//
//  ControlBaseView.m
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/18.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import "KeyMapBaseView.h"

@interface KeyMapBaseView ()

@end

@implementation KeyMapBaseView

- (instancetype)initWithTeleType:(TelecontrolType)teleType mapType:(TelecontrolMapType)mapType colorType:(TelecontrolColType)colorType {
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        
        
        self.teleType = teleType;
        self.teleMapType = mapType;
        self.teleColType = colorType;
        self.btnArray = [NSMutableArray array];
        self.pathArray = [NSMutableArray array];
        self.tmpPathArray = [NSMutableArray array];
        self.colorsArr = [NSMutableArray array];
        self.keyMapArray = [[NSMutableArray alloc] init];
        [self setupKeyMap];
        [self configColors];
        [self configGesture];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    [self.pathArray removeAllObjects];
    [self.tmpPathArray removeAllObjects];
    
    self.context = UIGraphicsGetCurrentContext();
    
    UIImage *bgImage = self.currentImage;
    
    CGFloat W = bgImage.size.width;
    CGFloat H = bgImage.size.height;

    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, W, H)];
    CGContextSaveGState(self.context);
    [rectanglePath addClip];
    CGContextScaleCTM(self.context, 1, -1);
    CGContextDrawTiledImage(self.context, CGRectMake(0, 0, W, H), bgImage.CGImage);
    CGContextRestoreGState(self.context);
}

#pragma mark - Setup Views

- (void)setupKeyMap {
    
}

- (void)setupKeyMapWithDataSource:(NSArray *)dataSource {
    for (NSInteger i = 0; i < dataSource.count; i ++) {
        NSDictionary *dic = dataSource[i];
        IrregularButton *btn = [IrregularButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        btn.KMType = KMButtonTypeNormal;
        [btn setTitle:dic[TitleKey] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:dic[IconKey]] forState:UIControlStateNormal];
        [self addSubview:btn];
        btn.userInteractionEnabled = NO;
        [self.btnArray addObject:btn];
    }
}

#pragma mark - config Gesture

- (void)configGesture {

    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [singleTap setNumberOfTapsRequired:1];
    [self addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self addGestureRecognizer:doubleTap];

//    [singleTap requireGestureRecognizerToFail:doubleTap];
}

- (void)tapAction:(UITapGestureRecognizer *)gesture {
    
}

#pragma mark - KeyMap Method

/// 设置键位数状态值
- (void)setkeyMapSelWithCount:(NSInteger)count {
    for (NSInteger i = 0; i < count; i ++) {
        NSNumber *number = [NSNumber numberWithBool:NO];
        [self.keyMapArray addObject:number];
    }
}

/// 设置键位选择状态
- (void)setKeyMapWithIndex:(NSInteger)index isSel:(BOOL)isSel {
    self.keyMapArray[index] = [NSNumber numberWithBool:isSel];
}

/// 恢复键位状态
- (void)recoverKeyMapWithIndex:(NSInteger)index {
    self.keyMapArray[index] = [NSNumber numberWithBool:NO];
}

/// 恢复所有键位状态
- (void)recoverAllKeyMap {
    for (NSInteger i = 0; i < self.keyMapArray.count; i ++) {
        self.keyMapArray[i] = [NSNumber numberWithBool:NO];
    }
}

/// 获取键位状态
- (BOOL)getKeyMapWithIndex:(NSInteger)index {
    NSNumber *number = self.keyMapArray[index];
    return [number boolValue];
}

#pragma mark - Config Colors

- (void)configColors {
    
    self.selShadow = [[NSShadow alloc] init];
    self.selShadow.shadowOffset = CGSizeMake(5, 6);
    self.selShadow.shadowBlurRadius = 12.5;
    
    switch (self.teleColType) {
        case TelecontrolColTypeBlue:
        {
            [self configColorWithBlue];
        }
            break;
            
        default:
            break;
    }
    
    
}

- (void)configColorWithBlue {
    UIColor *color1 = [UIColor colorWithRed:31/255.0 green:47/255.0 blue:86/255.0 alpha:1];
    UIColor *color2 = [UIColor colorWithRed:33/255.0 green:49/255.0 blue:89/255.0 alpha:1];
    UIColor *color3 = [UIColor colorWithRed:95/255.0 green:115/255.0 blue:169/255.0 alpha:1];
    UIColor *color4 = [UIColor colorWithRed:50/255.0 green:69/255.0 blue:119/255.0 alpha:1];
    
    UIColor *selColor1 = [UIColor colorWithRed:42/255.0 green:62/255.0 blue:109/255.0 alpha:1]; // #2A3E6D
//    UIColor *selColor2 = [UIColor colorWithRed:26/255.0 green:42/255.0 blue:82/255.0 alpha:1]; // #1A2A52
    UIColor *selColor2 = [UIColor colorWithRed:40/255.0 green:57/255.0 blue:102/255.0 alpha:1]; // #
    
    [self.colorsArr addObject:@[color1,color2,color3,color4]];
    [self.colorsArr addObject:@[selColor1,selColor2]];
    
    self.selShadowColor = [UIColor colorWithRed:26/255.0 green:42/255.0 blue:82/255.0 alpha:1];
    
    self.selShadow.shadowColor = [UIColor colorWithRed:26/255.0 green:42/255.0 blue:82/255.0 alpha:1];
}

/// 设置内阴影
- (void)setInnerShadowWithContext:(CGContextRef)context Path:(UIBezierPath *)path innerShadow:(NSShadow *)innerShadow {
    /// Inner Shadow
    CGContextSaveGState(context);
    CGContextClipToRect(context, path.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);

    CGContextSetAlpha(context, CGColorGetAlpha([innerShadow.shadowColor CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor* opaqueShadow = [innerShadow.shadowColor colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, innerShadow.shadowOffset, innerShadow.shadowBlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);

        [opaqueShadow setFill];
        [path fill];

        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
}

#pragma mark - Bezier Path & Position

/// 获取点在数组的位置
- (NSInteger)indexOfPoint:(CGPoint)point {
    
    for (NSDictionary *path in self.tmpPathArray) {
        if ([[path objectForKey:PathKey] containsPoint:point]) {
            return -1;
        }
    }
    
    for (NSDictionary *path in self.pathArray) {
        if ([[path objectForKey:PathKey] containsPoint:point]) {
            return [self.pathArray indexOfObject:path];
        }
    }
    return -1;
}

/// 判断点是否在曲线内
- (BOOL)containsPoint:(CGPoint)point {
    return ([self indexOfPoint:point] == -1 ? NO : YES);
}

/// 闭合贝塞尔曲线的外包矩形大小
- (CGRect)getOutRectangularWithBezier:(UIBezierPath *)bezierPath {
    NSArray *points = bezierPath.points;
    
    CGPoint tmpPoint = [points[0] CGPointValue];
    CGFloat minX = tmpPoint.x;
    CGFloat minY = tmpPoint.y;
    
    CGFloat maxX = tmpPoint.x;
    CGFloat maxY = tmpPoint.y;
    
    for (NSInteger i = 1; i < points.count; i ++) {
        CGPoint point = [points[i] CGPointValue];
        if (point.x < minX) {
            minX = point.x;
        }
        if (point.y < minY) {
            minY = point.y;
        }
        
        if (point.x > maxX) {
            maxX = point.x;
        }
        if (point.y > maxY) {
            maxY = point.y;
        }
    }
    CGRect rect = CGRectMake(minX, minY, maxX - minX, maxY - minY);
    return rect;
}

@end
