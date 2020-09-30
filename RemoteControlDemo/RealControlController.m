//
//  RealControlController.m
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/18.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import "RealControlController.h"
#import "remoteControlView.h"

@interface RealControlController ()

@property (nonatomic, strong) remoteControlView *rcView;

@end

@implementation RealControlController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.rcView = [[remoteControlView alloc] init];
    self.rcView.frame = CGRectMake(0, 0, 300, 520);
    self.rcView.center = self.view.center;
    [self.view addSubview:self.rcView];
}



@end
