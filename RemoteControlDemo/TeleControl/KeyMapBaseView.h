//
//  ControlBaseView.h
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/18.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBezierPath+Points.h"
#import "IrregularButton.h"

#define PathKey @"path"
#define PositionKey @"position"
#define PathDic(path,position) [NSDictionary dictionaryWithObjectsAndKeys:path,@"path",position,@"position", nil]

#define TitleKey @"title"
#define IconKey @"iconImage"
#define IconDic(title,iconImage) [NSDictionary dictionaryWithObjectsAndKeys:title,@"title",iconImage,@"iconImage", nil]

#define KAddSpace(a) (a + 2)
#define KSubSpace(a) (a - 2)

/// telecontrol
/// 遥控颜色类型
typedef NS_ENUM(NSUInteger, TelecontrolColType) {
    TelecontrolColTypeBlue = 0, /// 蓝色
    TelecontrolColTypeGreen, /// 绿色
    TelecontrolColTypeRed, /// 红色
};

/// 遥控键位类型
typedef NS_ENUM(NSUInteger, TelecontrolMapType) {
    TelecontrolMapType_3 = 0, /// 3键
};

/// 遥控类型
typedef NS_ENUM(NSUInteger, TelecontrolType) {
    TelecontrolTypeDefault = 0, /// 默认
    TelecontrolTypeReal = 1, /// 真实
};

@interface KeyMapBaseView : UIView

@property (nonatomic, assign) TelecontrolColType teleColType;
@property (nonatomic, assign) TelecontrolMapType teleMapType;
@property (nonatomic, assign) TelecontrolType teleType;
@property (nonatomic, strong) UIImage *currentImage;

@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) NSMutableArray *pathArray;
@property (nonatomic, strong) NSMutableArray *tmpPathArray; /// 不可点击的路径
@property (nonatomic, strong) NSMutableArray *colorsArr;
@property (nonatomic, strong) UIColor *selShadowColor;
@property (nonatomic, strong) NSShadow *selShadow;
@property (nonatomic, strong) NSMutableArray *keyMapArray;

@property (nonatomic, assign) CGContextRef context;

- (instancetype)initWithTeleType:(TelecontrolType)teleType mapType:(TelecontrolMapType)mapType colorType:(TelecontrolColType)colorType;

- (void)setupKeyMap;
- (void)setupKeyMapWithDataSource:(NSArray *)dataSource;

/// 设置内阴影
- (void)setInnerShadowWithContext:(CGContextRef)context Path:(UIBezierPath *)path innerShadow:(NSShadow *)innerShadow;

/// 设置键位数状态值
- (void)setkeyMapSelWithCount:(NSInteger)count;
/// 设置键位选择状态
- (void)setKeyMapWithIndex:(NSInteger)index isSel:(BOOL)isSel;
/// 恢复键位状态
- (void)recoverKeyMapWithIndex:(NSInteger)index;
/// 恢复所有键位状态
- (void)recoverAllKeyMap;
/// 获取键位状态
- (BOOL)getKeyMapWithIndex:(NSInteger)index;

/// 获取点在数组的位置
- (NSInteger)indexOfPoint:(CGPoint)point;
/// 判断点是否在曲线内
- (BOOL)containsPoint:(CGPoint)point;
/// 闭合贝塞尔曲线的外包矩形大小
- (CGRect)getOutRectangularWithBezier:(UIBezierPath *)bezierPath;

@end


