//
//  IrregularButton.m
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/16.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import "IrregularButton.h"
#import "UIImage+RGBA.h"

@implementation IrregularButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (self.KMType == KMButtonTypeNormal) {
        return [super pointInside:point withEvent:event];
    }

    UIImage *image = [self imageForState:UIControlStateNormal];
    if (image == nil) {
        return YES;
    }

    CGColorRef color = [[image colorAtPoint:point WithImageSize:self.frame.size] CGColor];
    CGFloat alphaValue = CGColorGetAlpha(color);
    return (alphaValue >= 0.1f);
}

- (void)setBackgroundView:(UIView *)view forState:(UIControlState)state {
    
}



@end
