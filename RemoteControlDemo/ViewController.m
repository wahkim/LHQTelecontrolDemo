//
//  ViewController.m
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/16.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import "ViewController.h"
#import "remoteControlView.h"
#import "IrregularView.h"
#import "RealControlController.h"
#import "SimulateViewController.h"

@interface ViewController ()

@property (nonatomic, strong) remoteControlView *rcView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(100, 100, 200, 35);
    btn1.tag = 1;
    [btn1 setTitle:@"真实车钥匙点击效果" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 200, 200, 35);
    btn2.tag = 2;
    [btn2 setTitle:@"遥控车钥匙点击效果" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
//    self.rcView = [[remoteControlView alloc] init];
//    self.rcView.frame = CGRectMake(0, 0, 300, 520);
//    self.rcView.center = self.view.center;
//    [self.view addSubview:self.rcView];
//
//    UIImageView *imv = [[UIImageView alloc] init];
//    imv.frame = CGRectMake(0, 64, 100, 100);
//    imv.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:imv];
//    imv.image = [self getBackgroundImage];
//
//    IrregularView *iView = [[IrregularView alloc] init];
//    iView.frame = CGRectMake(120, 64, 100, 100);
//    iView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:iView];
}

- (void)btnAction:(UIButton *)sender {
    if (sender.tag == 1) {
        RealControlController *vc = [RealControlController new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (sender.tag == 2) {
        SimulateViewController *vc = [SimulateViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UIImage *)getBackgroundImage {
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100,100),NO,0);
    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextAddEllipseInRect(context,CGRectMake(0,0,100,100));
    CGContextAddRect(context, CGRectMake(0,0,100,100));
    CGContextSetFillColorWithColor(context,[UIColor blueColor].CGColor);
    CGContextFillPath(context);

    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
