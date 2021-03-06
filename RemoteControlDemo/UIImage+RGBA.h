//
//  UIImage+RGBA.h
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/16.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (RGBA)

-(UIColor *)colorAtPoint:(CGPoint)point WithImageSize:(CGSize)size;
-(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

@end

NS_ASSUME_NONNULL_END
