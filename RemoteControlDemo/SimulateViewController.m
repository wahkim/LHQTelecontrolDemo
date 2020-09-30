//
//  SimulateViewController.m
//  RemoteControlDemo
//
//  Created by Xhorse_iOS3 on 2020/9/18.
//  Copyright © 2020 LHQ. All rights reserved.
//

#import "SimulateViewController.h"
#import "KeyMap_3View.h"

@interface SimulateViewController ()

@property (nonatomic, strong) KeyMap_3View *keyMapView;

@end

@implementation SimulateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.keyMapView = [[KeyMap_3View alloc] initWithTeleType:TelecontrolTypeDefault mapType:TelecontrolMapType_3 colorType:TelecontrolColTypeBlue];
    self.keyMapView.currentImage = [UIImage imageNamed:@"img_telecontrol_grey"];
    
    self.keyMapView.frame = CGRectMake(0, 0, self.keyMapView.currentImage.size.width, self.keyMapView.currentImage.size.height);
    self.keyMapView.center = self.view.center;
    [self.view addSubview:self.keyMapView];
}


@end
