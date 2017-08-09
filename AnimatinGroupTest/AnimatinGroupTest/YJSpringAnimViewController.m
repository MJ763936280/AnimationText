//
//  YJSpringAnimViewController.m
//  AnimatinGroupTest
//
//  Created by 包宇津 on 2017/8/9.
//  Copyright © 2017年 baoyujin. All rights reserved.
//

#import "YJSpringAnimViewController.h"

@interface YJSpringAnimViewController ()

@end

@implementation YJSpringAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 50, 50)];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    CASpringAnimation *springAnim = [CASpringAnimation animationWithKeyPath:@"position.x"];
    springAnim.damping = 5;
    springAnim.stiffness = 100;
    springAnim.mass = 1;
    springAnim.initialVelocity = 0;
    springAnim.fromValue = [NSNumber numberWithInt:label.layer.position.x];
    springAnim.toValue = [NSNumber numberWithInt:(label.layer.position.x + 100)];
    springAnim.autoreverses = YES;
    springAnim.repeatCount = MAXFLOAT;
    springAnim.duration = springAnim.settlingDuration;
    [label.layer addAnimation:springAnim forKey:@"sprinAnim"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

