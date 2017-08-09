//
//  YJDrawLineAnimViewController.m
//  AnimatinGroupTest
//
//  Created by 包宇津 on 2017/8/9.
//  Copyright © 2017年 baoyujin. All rights reserved.
//

#import "YJDrawLineAnimViewController.h"

@interface YJDrawLineAnimViewController ()

@end

@implementation YJDrawLineAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 250, 500)];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *pathAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnim.duration = 5.0;
    pathAnim.fromValue = [NSNumber numberWithFloat:0];
    pathAnim.toValue = [NSNumber numberWithFloat:1];
    pathAnim.autoreverses = true;
    pathAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnim.fillMode = kCAFillModeForwards;
    pathAnim.repeatCount = MAXFLOAT;
    [shapeLayer addAnimation:pathAnim forKey:@"strokeEndAnim"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end



