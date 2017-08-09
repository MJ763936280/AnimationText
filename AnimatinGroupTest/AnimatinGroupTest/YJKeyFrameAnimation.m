//
//  YJKeyFrameAnimation.m
//  AnimatinGroupTest
//
//  Created by 包宇津 on 2017/8/9.
//  Copyright © 2017年 baoyujin. All rights reserved.
//

#import "YJKeyFrameAnimation.h"

@interface YJKeyFrameAnimation ()

@end

@implementation YJKeyFrameAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(50, 120, 250, 500)];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];
    
    UIView *animView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 70, 70)];
    animView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview: animView];
    
    CAKeyframeAnimation *orbitAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    orbitAnim.duration = 5;
    orbitAnim.path = bezierPath.CGPath;
    orbitAnim.calculationMode = kCAAnimationPaced;
    orbitAnim.fillMode = kCAFillModeForwards;
    orbitAnim.repeatCount = MAXFLOAT;
    orbitAnim.rotationMode = kCAAnimationRotateAutoReverse;
    [animView.layer addAnimation:orbitAnim forKey:@"orbitAnim"];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 0.5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

