//
//  IrregularView.m
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/17.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import "IrregularView.h"

#define KAddSpace(a) (a + 2)
#define KSubSpace(a) (a - 2)

@implementation IrregularView


- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();

    /// 画线成矩形
    /// 矩形1
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y);
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y + rect.size.height);
    CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y);
    /// 1F2F56
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:31/255.0 green:47/255.0 blue:86/255.0 alpha:1].CGColor);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    /// 矩形2
//    CGColorSpaceRef rgb2 = CGColorSpaceCreateDeviceRGB();
//    CGFloat colors2[] =
//    {
////        40/255.0, 58/255.0, 103/266.0, 1.00,
//        95/255.0, 115/255.0, 169/266.0, 1.00,
//        33/255.0, 49/255.0, 89/266.0, 1.00,
//    };
//    CGFloat locations2[] = {0.0,1.0};
//    CGGradientRef gradient2 = CGGradientCreateWithColorComponents(rgb2, colors2, locations2, 2);//形成梯形，渐变的效果
//    CGColorSpaceRelease(rgb2);
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, KAddSpace(rect.origin.x), KAddSpace(rect.origin.y));
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, KAddSpace(rect.origin.y));
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    CGContextAddLineToPoint(context, KAddSpace(rect.origin.x), rect.origin.y + rect.size.height);
    CGContextAddLineToPoint(context, KAddSpace(rect.origin.x), KAddSpace(rect.origin.y));
    /// 213159
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:33/255.0 green:49/255.0 blue:89/255.0 alpha:1].CGColor);
//    CGContextDrawLinearGradient(context,
//                                gradient2,
//                                CGPointMake(KAddSpace(rect.origin.x), KAddSpace(rect.origin.y)),
//                                CGPointMake(KAddSpace(rect.origin.x), rect.origin.y + rect.size.height),
//                                kCGGradientDrawsAfterEndLocation);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    /// 矩形3
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);
    CGContextAddLineToPoint(context, KSubSpace(rect.origin.x + rect.size.width), rect.origin.y);
    CGContextAddLineToPoint(context, KSubSpace(rect.origin.x + rect.size.width), KSubSpace(rect.origin.y + rect.size.height));
    CGContextAddLineToPoint(context, rect.origin.x, KSubSpace(rect.origin.y + rect.size.height));
    CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y);
    /// 5F73A9
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:95/255.0 green:115/255.0 blue:169/255.0 alpha:1].CGColor);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    /// 矩形4
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, KAddSpace(rect.origin.x), KAddSpace(rect.origin.y));
    CGContextAddLineToPoint(context, KSubSpace(rect.origin.x + rect.size.width), KAddSpace(rect.origin.y));
    CGContextAddLineToPoint(context, KSubSpace(rect.origin.x + rect.size.width), KSubSpace(rect.origin.y + rect.size.height));
    CGContextAddLineToPoint(context, KAddSpace(rect.origin.x), KSubSpace(rect.origin.y + rect.size.height));
    CGContextAddLineToPoint(context, KAddSpace(rect.origin.x), KAddSpace(rect.origin.y));
    /// 324577
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:50/255.0 green:69/255.0 blue:119/255.0 alpha:1].CGColor);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);

    
    
    /*
//    CGRect rRect = CGRectMake(rect.origin.x + 5, rect.origin.y + 5, rect.size.width - 10, rect.size.height - 10);
    
    CGRect rRect = rect;
    
    CGGradientRef gradientRef;
    CGColorSpaceRef colorSpaceRef;
    CGFloat locs[2] = {0,1};
    CGFloat colors[8] = { 22/255.0, 24/255.0, 46/255.0, 1.0,  // 前4个为起始颜色的rgba
        21/255.0, 23/255.0, 49/255.0, 1.0 }; // 后4个为结束颜色的rgba
    colorSpaceRef = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    gradientRef = CGGradientCreateWithColorComponents (colorSpaceRef, colors,
                                                       locs, 2);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    //这个方法用于创建轴向渐变
    CGContextDrawLinearGradient(contextRef, gradientRef, rRect.origin, CGPointMake(rRect.origin.x+rRect.size.width, rRect.origin.y+rRect.size.height), 0);
    //这个方法用于创建径向渐变
//    CGContextDrawRadialGradient(contextRef, gradientRef, CGPointMake(rect.origin.x+rect.size.width/2, rect.origin.y+rect.size.height/2), rect.size.width/2, CGPointMake(rect.origin.x+rect.size.width/2, rect.origin.y+rect.size.height/2), rect.size.width/4, 0);
    
    CAGradientLayer *gradient = [CAGradientLayer layer];

    gradient.frame = rRect;

    gradient.cornerRadius = 20.0f;

    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:130/255.0 green:0 blue:140/255.0 alpha:1] CGColor], (id)[[UIColor colorWithRed:108/255.0 green:0 blue:120/255.0 alpha:1] CGColor], nil];
    
    [self.layer insertSublayer:gradient atIndex:0];
    */
    
    /*
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(rect.origin.x + 5, rect.origin.y + 5)];
    [bezierPath addLineToPoint: CGPointMake(rect.origin.x + rect.size.width - 5, rect.origin.y + 5)];
    [bezierPath addLineToPoint: CGPointMake(rect.origin.x + rect.size.width - 5, rect.origin.y + rect.size.height/2)];
    [bezierPath addQuadCurveToPoint:CGPointMake(rect.origin.x + rect.size.width - 5 - 45, rect.origin.y + rect.size.height - 5) controlPoint:CGPointMake(rect.origin.x + rect.size.width - 5 - 15, rect.origin.y + rect.size.height - 5 - 15)];
    
    [bezierPath addLineToPoint: CGPointMake(rect.origin.x + 5, rect.origin.y + rect.size.height - 5)];
    
    
    [bezierPath addLineToPoint: CGPointMake(rect.origin.x + 5, rect.origin.y + 5)];
    
    [bezierPath closePath];
    [[UIColor colorWithRed:31/255.0 green:34/255.0 blue:71/255.0 alpha:1] setFill];
    [bezierPath fill];
//    [UIColor.blackColor setStroke];
//    bezierPath.lineWidth = 1;
//    [bezierPath stroke];
    */
    
    /*
    CGRect bounds = [self bounds];

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGFloat radius = 0.5f * CGRectGetHeight(bounds);





    // Create the "visible" path, which will be the shape that gets the inner shadow

    // In this case it's just a rounded rect, but could be as complex as your want

    CGMutablePathRef visiblePath = CGPathCreateMutable();

//    CGRect innerRect = CGRectInset(bounds, radius, radius);
//
//    CGPathMoveToPoint(visiblePath, NULL, innerRect.origin.x, bounds.origin.y);
//
//    CGPathAddLineToPoint(visiblePath, NULL, innerRect.origin.x + innerRect.size.width, bounds.origin.y);
//
//    CGPathAddArcToPoint(visiblePath, NULL, bounds.origin.x + bounds.size.width, bounds.origin.y, bounds.origin.x + bounds.size.width, innerRect.origin.y, radius);
//
//    CGPathAddLineToPoint(visiblePath, NULL, bounds.origin.x + bounds.size.width, innerRect.origin.y + innerRect.size.height);
//
//    CGPathAddArcToPoint(visiblePath, NULL,  bounds.origin.x + bounds.size.width, bounds.origin.y + bounds.size.height, innerRect.origin.x + innerRect.size.width, bounds.origin.y + bounds.size.height, radius);
//
//    CGPathAddLineToPoint(visiblePath, NULL, innerRect.origin.x, bounds.origin.y + bounds.size.height);
//
//    CGPathAddArcToPoint(visiblePath, NULL,  bounds.origin.x, bounds.origin.y + bounds.size.height, bounds.origin.x, innerRect.origin.y + innerRect.size.height, radius);
//
//    CGPathAddLineToPoint(visiblePath, NULL, bounds.origin.x, innerRect.origin.y);
//
//    CGPathAddArcToPoint(visiblePath, NULL,  bounds.origin.x, bounds.origin.y, innerRect.origin.x, bounds.origin.y, radius);
    
//    CGPathMoveToPoint(visiblePath, NULL, rect.origin.x + 5, rect.origin.y + 5);
//    CGPathAddLineToPoint(visiblePath, NULL, rect.origin.x + rect.size.width - 5, rect.origin.y + 5);
//    CGPathAddLineToPoint(visiblePath, NULL, rect.origin.x + rect.size.width - 5, rect.origin.y + rect.size.height - 5);
//    CGPathAddLineToPoint(visiblePath, NULL, rect.origin.x + 5, rect.origin.y + rect.size.height - 5);
//    CGPathAddLineToPoint(visiblePath, NULL, rect.origin.x + 5, rect.origin.y + 5);
    
    CGPathMoveToPoint(visiblePath, NULL, rect.origin.x, rect.origin.y);
    CGPathAddLineToPoint(visiblePath, NULL, rect.origin.x + rect.size.width, rect.origin.y);
    CGPathAddLineToPoint(visiblePath, NULL, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    CGPathAddLineToPoint(visiblePath, NULL, rect.origin.x, rect.origin.y + rect.size.height);
    CGPathAddLineToPoint(visiblePath, NULL, rect.origin.x, rect.origin.y);
    CGPathCloseSubpath(visiblePath);
    UIColor *aColor = [UIColor colorWithRed:52/255.0 green:65/255.0 blue:119/255.0 alpha:1];
    [aColor setFill];
    CGContextAddPath(context, visiblePath);
    
    
    CGMutablePathRef visiblePath2 = CGPathCreateMutable();
    CGPathMoveToPoint(visiblePath2, NULL, rect.origin.x + 3, rect.origin.y + 3);
    CGPathAddLineToPoint(visiblePath2, NULL, rect.origin.x + rect.size.width, rect.origin.y + 3);
    CGPathAddLineToPoint(visiblePath2, NULL, rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    CGPathAddLineToPoint(visiblePath2, NULL, rect.origin.x + 3, rect.origin.y + rect.size.height);
    CGPathAddLineToPoint(visiblePath2, NULL, rect.origin.x+ 3, rect.origin.y + 3);
    CGPathCloseSubpath(visiblePath2);
//    UIColor *aColor2 = [UIColor colorWithRed:18/255.0 green:26/255.0 blue:51/255.0 alpha:1];
    UIColor *aColor2 = [UIColor whiteColor];
    [aColor2 setFill];
    CGContextAddPath(context, visiblePath2);
    
    CGContextFillPath(context);


//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, CGRectInset(rect, -47, -47));
//    CGPathAddPath(path, NULL, visiblePath);
//    CGPathCloseSubpath(path);
//
//    CGContextAddPath(context, visiblePath);
//    CGContextClip(context);

    // Now setup the shadow properties on the context

//    aColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f];
//    aColor = [UIColor colorWithRed:53/255.0 green:55/255.0 blue:102/255.0 alpha:0.5];
//    aColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
//    CGContextSaveGState(context);
//    CGContextSetShadowWithColor(context, CGSizeMake(3.0f, 3.0f), 10.0f, [aColor CGColor]);
//
//    [aColor setFill];
//    CGContextSaveGState(context);
//    CGContextAddPath(context, path);
//    CGContextEOFillPath(context);
//
//    // Release the paths
//    CGPathRelease(path);
//    CGPathRelease(visiblePath);
     */
}

@end
