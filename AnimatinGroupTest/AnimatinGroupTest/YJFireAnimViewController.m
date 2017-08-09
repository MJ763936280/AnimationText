//
//  YJFireAnimViewController.m
//  AnimatinGroupTest
//
//  Created by 包宇津 on 2017/8/9.
//  Copyright © 2017年 baoyujin. All rights reserved.
//

#import "YJFireAnimViewController.h"
@interface YJFireAnimViewController ()

@end

@implementation YJFireAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CAEmitterLayer *fireEmitter = [CAEmitterLayer layer];
    UIImageView *candleIV = [[UIImageView alloc] init];
    
    self.view.backgroundColor = [UIColor blackColor];
    //发射器在xy平面的中心位置
    fireEmitter.emitterPosition = self.view.center;
    //发射器的尺寸大小
//    fireEmitter.emitterSize = CGSizeMake(20, 60);
    //发射器的发射模式
//    fireEmitter.emitterMode = kCAEmitterLayerOutline;
    //发射器的形状
    fireEmitter.emitterShape = kCAEmitterLayerCircle;
    //发射器渲染模式
    fireEmitter.renderMode = kCAEmitterLayerAdditive;
    //发射单元- 火焰
    CAEmitterCell *fire = [CAEmitterCell emitterCell];
    //粒子的创建速率，默认为1/s
    fire.birthRate = 200;
    //粒子的存活时间
    fire.lifetime = 0.2;
    //粒子的生存时间容差
    fire.lifetimeRange = 0.5;
//    fire.color = [UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1].CGColor;
    fire.color = [UIColor redColor].CGColor;
    fire.contents = (__bridge id _Nullable)([UIImage imageNamed:@"fire"].CGImage);
    fire.name = @"fire";
    //粒子的速度
    fire.velocity = 35;
    //粒子动画的速度容差
    fire.velocityRange = 10;
    //粒子在xy平面的发射角度
    fire.emissionLongitude = M_PI + M_2_PI;
    fire.emissionRange = M_2_PI;
    //缩放速度
    fire.scaleSpeed = 0.3;
    //旋转度
//    fire.spin = 0.2;
    fire.emitterCells = [NSArray arrayWithObject:fire];
    [self.view.layer addSublayer:fireEmitter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



