//
//  ControlBaseView.m
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/18.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import "KeyMapBaseView.h"
#import "UIBezierPath+Points.h"
#import "IrregularButton.h"

#define PathKey @"path"
#define PositionKey @"position"
#define PathDic(path,position) [NSDictionary dictionaryWithObjectsAndKeys:path,@"path",position,@"position", nil]

@interface KeyMapBaseView ()

@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) NSMutableArray *pathArray;

@end

@implementation KeyMapBaseView

- (instancetype)init {
    if (self = [super init]) {
        
//        self.backgroundColor = [UIColor redColor];
        self.userInteractionEnabled = YES;
        
        self.btnArray = [NSMutableArray array];
        self.pathArray = [NSMutableArray array];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIImage *bgImage = self.currentImage;
    
    CGFloat W = bgImage.size.width;
    CGFloat H = bgImage.size.height;

    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, W, H)];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextScaleCTM(context, 1, -1);
    CGContextDrawTiledImage(context, CGRectMake(0, 0, W, H), bgImage.CGImage);
    CGContextRestoreGState(context);
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
