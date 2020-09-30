//
//  IrregularButton.h
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/16.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KMButtonType) {
    KMButtonTypeNormal,
    KMButtonTypeIrregular,
};

@interface IrregularButton : UIButton

@property (nonatomic, assign) KMButtonType KMType;

@end

