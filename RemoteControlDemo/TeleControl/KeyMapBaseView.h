//
//  ControlBaseView.h
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/18.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyMapBaseView : UIView

@property (nonatomic, strong) UIImage *currentImage;

/// 获取点在数组的位置
- (NSInteger)indexOfPoint:(CGPoint)point;
/// 判断点是否在曲线内
- (BOOL)containsPoint:(CGPoint)point;
/// 闭合贝塞尔曲线的外包矩形大小
- (CGRect)getOutRectangularWithBezier:(UIBezierPath *)bezierPath;

@end


