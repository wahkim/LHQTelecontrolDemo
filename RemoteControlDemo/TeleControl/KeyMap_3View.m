//
//  KeyMap_3View.m
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/18.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import "KeyMap_3View.h"

@interface KeyMap_3View ()

@property (nonatomic, assign) BOOL isSel;
@property (nonatomic, assign) NSInteger selTag;

@end

@implementation KeyMap_3View

- (instancetype)initWithTeleType:(TelecontrolType)teleType mapType:(TelecontrolMapType)mapType colorType:(TelecontrolColType)colorType; {
    if (self = [super initWithTeleType:teleType mapType:mapType colorType:colorType]) {

        self.selTag = 0;
        [self setkeyMapSelWithCount:3];
    }
    return self;
}

- (void)setupKeyMap {
//     NSArray *dataArray = @[@{@"title" : @"闭锁", @"iconImage": @"ico_telecontrol_lock"},
//                                   @{@"title" : @"解锁", @"iconImage": @"ico_telecontrol_lock"},
//                                   @{@"title" : @"寻车", @"iconImage": @"ico_telecontrol_lock"}];
    
    NSArray *dataArray = @[IconDic(@"闭锁", @"ico_telecontrol_lock"),
                           IconDic(@"解锁", @"ico_telecontrol_lock"),
                           IconDic(@"寻车", @"ico_telecontrol_lock")];

    [self setupKeyMapWithDataSource:dataArray];
}

- (void)dissmissAction {
    self.keyMapArray[self.selTag] = [NSNumber numberWithInteger:0];
    self.isSel = NO;
    self.selTag = 0;
    [self setNeedsDisplay];
}

- (void)tapAction:(UITapGestureRecognizer *)gesture {
    
    BOOL containsPoint = [self containsPoint:[gesture locationInView:self]];
    NSInteger tag = [self indexOfPoint:[gesture locationInView:self]];
    NSLog(@"ges seltag = %ld",tag);
    if (containsPoint) {
        [self recoverAllKeyMap];
        self.isSel = !self.isSel;
        self.selTag = tag;
        self.keyMapArray[self.selTag] = [NSNumber numberWithBool:self.isSel];
        [self setNeedsDisplay];
        if (self.isSel) {
            [self performSelector:@selector(dissmissAction) withObject:nil afterDelay:0.15];
        }
    }
    
    if (gesture.numberOfTapsRequired == 1) {
        NSLog(@"single tap");
    } else if (gesture.numberOfTapsRequired == 2) {
        NSLog(@"double tap");
    }
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    UIImage *hyellow = [UIImage imageNamed: @"img_telecontrol_grey_division"];
    
    UIBezierPath *keymap1;
    UIBezierPath *keymap2;
    UIBezierPath *keymap3;
    
    NSArray *norColorArr = self.colorsArr[0];
    NSArray *selColorArr = self.colorsArr[1];
    
    /// 键位1
    if (self.isSel && [self getKeyMapWithIndex:KeyMap_3Button_1] == YES) {
        /// Rectangle 1_1 Drawing
        UIBezierPath* rectangle1_1 = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(31, 30, 256, 162) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(35, 35)];
        [rectangle1_1 closePath];
        [selColorArr[0] setFill];
        [rectangle1_1 fill];
        
        //// Rectangle 1_2 Drawing
        UIBezierPath* rectangle1_2 = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(31, 30.5, 255.5, 158.5) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(35, 35)];
        [rectangle1_2 closePath];
        [selColorArr[1] setFill];
        [rectangle1_2 fill];

        /// Inner Shadow
        [self setInnerShadowWithContext:self.context Path:rectangle1_2 innerShadow:self.selShadow];
        
        keymap1 = rectangle1_2;
    } else {
        /// Rectangle 1_1 Drawing
        UIBezierPath* rectangle1_1 = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(30.5, 29.5, 255, 162) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(35, 35)];
        [rectangle1_1 closePath];
        [norColorArr[0] setFill];
        [rectangle1_1 fill];

        /// Rectangle 1_2 Drawing
        UIBezierPath* rectangle1_2 = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(32, 29.5, 253, 162) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(35, 35)];
        [rectangle1_2 closePath];
        [norColorArr[1] setFill];
        [rectangle1_2 fill];

        //// Rectangle 1_3 Drawing
        UIBezierPath* rectangle1_3 = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(30, 30, 253.5, 159.5) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(35, 35)];
        [rectangle1_3 closePath];
        [norColorArr[2] setFill];
        [rectangle1_3 fill];

        /// Rectangle 1_4 Drawing
        UIBezierPath* rectangle1_4 = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(32, 31, 251.5, 159) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(35, 35)];
        [rectangle1_4 closePath];
        [norColorArr[3] setFill];
        [rectangle1_4 fill];
        
        keymap1 = rectangle1_1;
    }
    
    /// 键位2
    if (self.isSel && [self getKeyMapWithIndex:KeyMap_3Button_2] == YES) {
        
        /// 2_1 Drawing
        UIBezierPath* rectangle2_1 = [UIBezierPath bezierPathWithRect: CGRectMake(31, 197, 255.5, 161.5)];
        [selColorArr[0] setFill];
        [rectangle2_1 fill];


        //// 2_2 Drawing
        UIBezierPath* rectangle2_2 = [UIBezierPath bezierPathWithRect: CGRectMake(31, 197, 252.5, 159.5)];
        [selColorArr[1] setFill];
        [rectangle2_2 fill];

        /// 2_2 Inner Shadow
        [self setInnerShadowWithContext:self.context Path:rectangle2_2 innerShadow:self.selShadow];

        keymap2 = rectangle2_1;
    } else {
        /// Rectangle 2_1 Drawing
        UIBezierPath* rectangle2_1 = [UIBezierPath bezierPathWithRect: CGRectMake(30, 197, 255, 161.5)];
        [norColorArr[0] setFill];
        [rectangle2_1 fill];

        /// Rectangle 2_2 Drawing
        UIBezierPath* rectangle2_2 = [UIBezierPath bezierPathWithRect: CGRectMake(32, 197, 252.5, 161.5)];
        [norColorArr[1] setFill];
        [rectangle2_2 fill];

        /// Rectangle 2_3 Drawing
        UIBezierPath* rectangle2_3 = [UIBezierPath bezierPathWithRect: CGRectMake(30, 197, 252.5, 159.5)];
        [norColorArr[2] setFill];
        [rectangle2_3 fill];

        //// Rectangle 2_4 Drawing
        UIBezierPath* rectangle2_4 = [UIBezierPath bezierPathWithRect: CGRectMake(32, 198, 251.5, 159.5)];
        [norColorArr[3] setFill];
        [rectangle2_4 fill];
        
        keymap2 = rectangle2_1;
    }
    
    /// 键位3
    if (self.isSel && [self getKeyMapWithIndex:KeyMap_3Button_3] == YES) {
        
        /// Rectangle 3_1 Drawing
        UIBezierPath* rectangle3_1 = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(31, 363.5, 255.5, 162) byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake(34, 34)];
        [rectangle3_1 closePath];
        [selColorArr[0] setFill];
        [rectangle3_1 fill];


        //// Rectangle 3_2 Drawing
        UIBezierPath* rectangle3_2 = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(31, 363.5, 255.5, 159.5) byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake(34, 34)];
        [rectangle3_2 closePath];
        [selColorArr[1] setFill];
        [rectangle3_2 fill];

        /// Rectangle 4 Inner Shadow
        [self setInnerShadowWithContext:self.context Path:rectangle3_2 innerShadow:self.selShadow];

        keymap3 = rectangle3_1;
        
    } else {
        /// Rectangle 3_1 Drawing
        UIBezierPath* rectangle3_1 = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(30, 364, 255, 162) byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake(34, 34)];
        [rectangle3_1 closePath];
        [norColorArr[0] setFill];
        [rectangle3_1 fill];

        /// Rectangle 3_2 Drawing
        UIBezierPath* rectangle13_2 = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(32, 364, 252.5, 162) byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake(34, 34)];
        [rectangle13_2 closePath];
        [norColorArr[1] setFill];
        [rectangle13_2 fill];

        /// Rectangle 3_3 Drawing
        UIBezierPath* rectangle3_3= [UIBezierPath bezierPathWithRoundedRect: CGRectMake(30, 364, 252.5, 162) byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake(34, 34)];
        [rectangle3_3 closePath];
        [norColorArr[2] setFill];
        [rectangle3_3 fill];

        /// Rectangle 3_4 Drawing
        UIBezierPath* rectangle3_4 = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(32, 365, 251, 160.5) byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake(34, 34)];
        [rectangle3_4 closePath];
        [norColorArr[3] setFill];
        [rectangle3_4 fill];
        
        keymap3 = rectangle3_1;
    }
    
    /// 中间黄色图
    /// Rectangle Tmp_1 Drawing
    UIBezierPath* rectangleTmp_1 = [UIBezierPath bezierPathWithRect: CGRectMake(90, 352, 137.5, 18)];
    CGContextSaveGState(self.context);
    [rectangleTmp_1 addClip];
    CGContextScaleCTM(self.context, 1, -1);
    CGContextDrawTiledImage(self.context, CGRectMake(90, -352, hyellow.size.width, hyellow.size.height), hyellow.CGImage);
    CGContextRestoreGState(self.context);

    /// Rectangle Tmp_2 Drawing
    UIBezierPath* rectangleTmp_2 = [UIBezierPath bezierPathWithRect: CGRectMake(90, 185, 137.5, 18)];
    CGContextSaveGState(self.context);
    [rectangleTmp_2 addClip];
    CGContextScaleCTM(self.context, 1, -1);
    CGContextDrawTiledImage(self.context, CGRectMake(90, -185, hyellow.size.width, hyellow.size.height), hyellow.CGImage);
    CGContextRestoreGState(self.context);
    
    
    [self.pathArray addObjectsFromArray:@[PathDic(keymap1, [NSNumber numberWithInteger:0]),
                                          PathDic(keymap2, [NSNumber numberWithInteger:1]),
                                          PathDic(keymap3, [NSNumber numberWithInteger:2])]];
    
    [self.tmpPathArray addObjectsFromArray:@[PathDic(rectangleTmp_1, [NSNumber numberWithInteger:-1]),
                                             PathDic(rectangleTmp_2, [NSNumber numberWithInteger:-1])]];

    for (NSInteger i = 0; i < self.btnArray.count; i ++) {
        NSDictionary *dic = self.pathArray[i];
        IrregularButton *btn = self.btnArray[i];
        btn.frame = [self getOutRectangularWithBezier:dic[PathKey]];
    }
    
}



/*
- (UIImage *)drawBigTopImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();

    /// shape 1
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 19, 41);
    CGContextAddLineToPoint(context, 19, 41);
    CGContextAddLineToPoint(context, 184, 124);
    CGContextAddLineToPoint(context, 184, 37);
    CGContextAddCurveToPoint(context, 184, 37, 180, 19, 165, 19);
    CGContextAddCurveToPoint(context, 150, 19, 37, 19.5, 37, 19.5);
    CGContextAddCurveToPoint(context, 37, 19.5, 31.23, 20.02, 26, 24.5);
    CGContextAddCurveToPoint(context, 21.86, 28.04, 19, 33.49, 19, 41);
    CGContextAddCurveToPoint(context, 19, 58, 19, 41, 19, 41);
    /// 1F2F56
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:31/255.0 green:47/255.0 blue:86/255.0 alpha:1].CGColor);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
*/
@end
