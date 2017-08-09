//
//  YJWaterWaveAnimViewController.m
//  AnimatinGroupTest
//
//  Created by 包宇津 on 2017/8/9.
//  Copyright © 2017年 baoyujin. All rights reserved.
//

#import "YJWaterWaveAnimViewController.h"
#import "YJWaterWaveView.h"
@interface YJWaterWaveAnimViewController ()

@end

@implementation YJWaterWaveAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    YJWaterWaveView *waterView = [[YJWaterWaveView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:waterView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
}

@end

