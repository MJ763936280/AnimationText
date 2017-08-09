//
//  YJBasicAnimation.m
//  AnimatinGroupTest
//
//  Created by 包宇津 on 2017/8/8.
//  Copyright © 2017年 baoyujin. All rights reserved.
//

#import "YJBasicAnimation.h"

@interface YJBasicAnimation ()

@end

@implementation YJBasicAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
#pragma mark -旋转动画
    UIView *rotationViewX = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 70, 70)];
    rotationViewX.backgroundColor = [UIColor redColor];
    [self.view addSubview:rotationViewX];
    CABasicAnimation *rotationAnimX = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotationAnimX.beginTime = 0.0;
    rotationAnimX.toValue = [NSNumber numberWithFloat:2 * M_PI];
    rotationAnimX.duration = 1.5;
    rotationAnimX.repeatCount = MAXFLOAT;
    [rotationViewX.layer addAnimation:rotationAnimX forKey:@"rotationAnimX"];
    
    UIView *rotationViewY =[[UIView alloc] initWithFrame:CGRectMake(150, 100, 70, 70)];
    rotationViewY.backgroundColor = [UIColor blueColor];
    [self.view addSubview:rotationViewY];
    CABasicAnimation *rotationAnimY = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimY.beginTime = CACurrentMediaTime() + 2;
    rotationAnimY.toValue = [NSNumber numberWithFloat:2 * M_PI];
    rotationAnimY.duration = 1.5;
    rotationAnimY.repeatCount = MAXFLOAT;
    [rotationViewY.layer addAnimation:rotationAnimY forKey:@"rotationAnimY"];
    
    UIView *rotationViewZ = [[UIView alloc] initWithFrame:CGRectMake(280, 100, 70, 70)];
    rotationViewZ.backgroundColor = [UIColor blackColor];
    [self.view addSubview:rotationViewZ];
    CABasicAnimation *rotationAnimZ = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimZ.beginTime = 0;
    rotationAnimZ.toValue = [NSNumber numberWithFloat:2 * M_PI];
    rotationAnimZ.duration = 2.0;
    rotationAnimZ.repeatCount = MAXFLOAT;
    [rotationViewZ.layer addAnimation:rotationAnimZ forKey:@"rotationAnimZ"];
    
    
#pragma mark -移动动画
    UIView *moveView = [[UIView alloc] initWithFrame:CGRectMake(20, 240, 70, 70)];
    moveView.center = CGPointMake(40, 200);
    moveView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:moveView];
    CABasicAnimation *moveAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(40, 240)];
    moveAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 240)];
    moveAnim.duration = 2;
    moveAnim.repeatCount = MAXFLOAT;
    moveAnim.autoreverses = YES;
    moveAnim.removedOnCompletion = false;
    moveAnim.fillMode = kCAFillModeForwards;
    [moveView.layer addAnimation:moveAnim forKey:@"moveAnim"];
    
#pragma mark -背景颜色变化动画
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(20, 310, 70, 70)];
    colorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:colorView];
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnim.fromValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    colorAnim.toValue = (__bridge id _Nullable)([UIColor greenColor].CGColor);
    colorAnim.duration = 2.0;
    colorAnim.repeatCount = MAXFLOAT;
    [colorView.layer addAnimation:colorAnim forKey:@"colorAnim"];
    
#pragma mark -内容变化动画
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 310, 70, 70)];
    imageView.image = [UIImage imageNamed:@"from"];
    [self.view addSubview:imageView];
    CABasicAnimation *contentsAnim = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentsAnim.toValue = (__bridge id _Nullable)([UIImage imageNamed:@"to"].CGImage);
    contentsAnim.duration = 1.5;
    contentsAnim.autoreverses = YES;
    contentsAnim.repeatCount = MAXFLOAT;
    [imageView.layer addAnimation:contentsAnim forKey:@"contensAnim"];
    
#pragma mark --圆角变化动画
    UIView *cornerRadiusView = [[UIView alloc] initWithFrame:CGRectMake(280, 310, 70, 70)];
    cornerRadiusView.backgroundColor = [UIColor redColor];
    cornerRadiusView.layer.masksToBounds = YES; //加不加效果没区别
    [self.view addSubview:cornerRadiusView];
    CABasicAnimation *cornerRadiusAnim = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerRadiusAnim.toValue = [NSNumber numberWithInt:35];
    cornerRadiusAnim.duration = 2;
    cornerRadiusAnim.repeatCount = MAXFLOAT;
    [cornerRadiusView.layer addAnimation:cornerRadiusAnim forKey:@"cornerRadiusAnim"];
    
#pragma mark --比例缩放动画
    UIView *scaleView = [[UIView alloc] initWithFrame:CGRectMake(20, 410, 70, 70)];
    scaleView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleView];
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.fromValue = [NSNumber numberWithFloat:0.3];
    scaleAnim.toValue = [NSNumber numberWithFloat:1.3];
    scaleAnim.duration = 2;
    scaleAnim.autoreverses = YES;
    scaleAnim.repeatCount = MAXFLOAT;
    [scaleView.layer addAnimation:scaleAnim forKey:@"scaleAnim"];
    
#pragma mark --比例缩放动画X
    UIView *scaleViewX = [[UIView alloc] initWithFrame:CGRectMake(150, 410, 70, 70)];
    scaleViewX.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleViewX];
    CABasicAnimation *scaleXAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleXAnim.fromValue = [NSNumber numberWithFloat:0.3];
    scaleXAnim.toValue = [NSNumber numberWithFloat:1.3];
    scaleXAnim.duration = 2;
    scaleXAnim.autoreverses = YES;
    scaleXAnim.repeatCount = MAXFLOAT;
    [scaleViewX.layer addAnimation:scaleXAnim forKey:@"scaleXAnim"];
    
#pragma mark --比例缩放动画Y
    UIView *scaleViewY = [[UIView alloc] initWithFrame:CGRectMake(280, 410, 70, 70)];
    scaleViewY.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleViewY];
    CABasicAnimation *scaleYAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleYAnim.fromValue = [NSNumber numberWithFloat:0.3];
    scaleYAnim.toValue = [NSNumber numberWithFloat:1.3];
    scaleYAnim.autoreverses = YES;
    scaleYAnim.duration = 2;
    scaleYAnim.repeatCount = MAXFLOAT;
    [scaleViewY.layer addAnimation:scaleYAnim forKey:@"scaleYAnim"];
    
#pragma mark --指定大小缩放
    UIView *boundsView = [[UIView alloc] initWithFrame:CGRectMake(40, 520, 70, 70)];
    boundsView.backgroundColor = [UIColor redColor];
    [self.view addSubview:boundsView];
    CABasicAnimation *boundsAnim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(800, 500, 90, 80)];
    boundsAnim.duration = 2;
    boundsAnim.autoreverses = YES;
    boundsAnim.repeatCount = MAXFLOAT;
    [boundsView.layer addAnimation:boundsAnim forKey:@"boundsAnim"];
    
#pragma mark --透明动画
    UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(150, 520, 70, 70)];
    alphaView.backgroundColor = [UIColor redColor];
    [self.view addSubview:alphaView];
    CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnim.fromValue = @0.3;
    alphaAnim.toValue = @1;
    alphaAnim.duration = 0.6;
    alphaAnim.autoreverses = YES;
    alphaAnim.repeatCount = MAXFLOAT;
    [alphaView.layer addAnimation:alphaAnim forKey:@"alphaAnim"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


