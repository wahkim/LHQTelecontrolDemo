//
//  remoteControlView.m
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/16.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import "remoteControlView.h"
#import "UIBezierPath+Points.h"
#import "IrregularButton.h"

#define PathKey @"path"
#define PositionKey @"position"
#define PathDic(path,position) [NSDictionary dictionaryWithObjectsAndKeys:path,@"path",position,@"position", nil]

@interface remoteControlView ()

@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) NSMutableArray *pathArray;

@end

@implementation remoteControlView

- (instancetype)init {
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor redColor];
        self.userInteractionEnabled = YES;
        
        self.btnArray = [NSMutableArray array];
        self.pathArray = [NSMutableArray array];
        
        IrregularButton *btn = [IrregularButton buttonWithType:UIButtonTypeCustom];
        btn.KMType = KMButtonTypeIrregular;
        [btn addTarget:self action:@selector(controlAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.btnArray addObject:btn];
    }
    return self;
}

- (void)controlAction:(UIButton *)sender {
    NSLog(@"就你了");
}

/// 获取点在数组的位置
- (NSInteger)indexOfPoint:(CGPoint)point {
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

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
//    UIColor* color = [UIColor colorWithRed: 0.8 green: 0.32 blue: 0.32 alpha: 1];
    UIColor* color = [UIColor clearColor];
//
    //// Image Declarations
    UIImage* m1 = [UIImage imageNamed: @"Maserati"];
    
    CGFloat W = 300;
    CGFloat H = m1.size.height;
    CGFloat scale = W / m1.size.width;
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, W, H * scale)];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextScaleCTM(context, 1, -1);
    CGContextDrawTiledImage(context, CGRectMake(0, 0, W, H * scale), m1.CGImage);
    CGContextRestoreGState(context);
    
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(146.5* scale, 370.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(210.5* scale, 370.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(218.5* scale, 378.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(272.5* scale, 378.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(272.5* scale, 528.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(175* scale, 528.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(169* scale, 522.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(163* scale, 511.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(158* scale, 497.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(156* scale, 488.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(155* scale, 480.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(152* scale, 462.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(148.5* scale, 420.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(147.5* scale, 402.5* scale)];
    [bezier2Path addLineToPoint: CGPointMake(146.5* scale, 370.5* scale)];
    [bezier2Path closePath];
    [color setFill];
    [bezier2Path fill];
    
    NSLog(@"%@",bezier2Path.points);
    
    NSLog(@"size = %@",[NSValue valueWithCGRect:[self getOutRectangularWithBezier:bezier2Path]]);
    CGRect frame = [self getOutRectangularWithBezier:bezier2Path];
    IrregularButton *btn = self.btnArray[0];
    btn.frame = frame;
    [btn setImage:[UIImage imageNamed: @"Maserati_40"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed: @"Maserati_41"] forState:UIControlStateHighlighted];
    
    [self.pathArray addObjectsFromArray:@[PathDic(bezier2Path, [NSNumber numberWithInteger:0])]];
    
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
