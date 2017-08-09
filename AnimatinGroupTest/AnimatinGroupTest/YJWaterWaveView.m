//
//  YJWaterWaveView.m
//  AnimatinGroupTest
//
//  Created by 包宇津 on 2017/8/9.
//  Copyright © 2017年 baoyujin. All rights reserved.
//

#import "YJWaterWaveView.h"

@interface YJWaterWaveView() {
    CGFloat waveA;   //水纹振幅
    CGFloat waveW;   //水纹周期
    CGFloat offsetX; //位移
    CGFloat currentK; //当前波浪高度
    CGFloat waveSpeed; //水纹速度
    CGFloat waterWaveWidth; //水纹路宽度
}
@property (nonatomic, strong) CADisplayLink *waveDisplayLink;
@property (nonatomic, strong) CAShapeLayer *firstWaveLayer;
@property (nonatomic, strong) CAShapeLayer *secondWaveLayer;
@property (nonatomic, strong) UIColor *firstWaveColor;
@end

@implementation YJWaterWaveView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        waveA = 10;
        waveW = 1 / 30.0;
        offsetX = 0;
        currentK = 0;
        waveSpeed = 0;
        waterWaveWidth = 0;
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = true;
        [self setupUI];
    }
    return self;
}

- (void)dealloc {
    [self.waveDisplayLink invalidate];
}
- (CADisplayLink *)waveDisplayLink {
    if (_waveDisplayLink) {
        return _waveDisplayLink;
    }
    _waveDisplayLink = [[CADisplayLink alloc] init];
    return _waveDisplayLink;
}

- (CAShapeLayer *)firstWaveLayer {
    if (!_firstWaveLayer) {
        _firstWaveLayer = [[CAShapeLayer alloc] init];
    }
    return _firstWaveLayer;
}

- (CAShapeLayer *)secondWaveLayer {
    if (!_secondWaveLayer) {
        return _secondWaveLayer;
    }
    _secondWaveLayer = [[CAShapeLayer alloc] init];
    return _secondWaveLayer;
}

- (void)setupUI {
    waterWaveWidth = self.bounds.size.width;       //波浪宽
    _firstWaveColor = [UIColor greenColor];        //波浪颜色
    waveSpeed = 0.4 / M_PI;                        //波浪速度
    self.firstWaveLayer.fillColor = [UIColor colorWithRed:73 / 255.0 green:142 / 255.0 blue:178 / 255.0 alpha:0.5].CGColor;    //设置闭环的颜色
    //设置边缘线的颜色
//    _firstWaveLayer.strokeColor = [UIColor blueColor].CGColor;
    _firstWaveLayer.strokeStart = 0.0;
    _firstWaveLayer.strokeEnd = 0.8;
    
    //设置闭环的颜色
    self.secondWaveLayer.fillColor = [UIColor colorWithRed:73 / 255.0 green:142 / 255.0 blue:178 / 255.0 alpha:0.5].CGColor;
    //设置边缘线的颜色
//    _secondWaveLayer.strokeColor = [UIColor blueColor].CGColor;
    _secondWaveLayer.strokeStart = 0.0;
    _secondWaveLayer.strokeEnd = 0.8;
    [self.layer addSublayer:_firstWaveLayer];
    [self.layer addSublayer:_secondWaveLayer];
    
    //设置波浪流动的速度
    waveSpeed = 0.05;
    //设置振幅
    waveA = 8;
    //设置周期
    waveW = 2 * M_PI / self.bounds.size.width;
    //设置波浪纵向位置
    currentK = self.bounds.size.height / 2;
    
    self.waveDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    [_waveDisplayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}
- (void)getCurrentWave {
    //实时位移
    offsetX += waveSpeed;
    [self setCurrentFirstWaveLayerPath];
}
- (void)setCurrentFirstWaveLayerPath {
    //创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = currentK;
    CGPathMoveToPoint(path, nil, 0, y);
    
    for (int i = 0 ;i < waterWaveWidth; i++) {
        y = waveA * sin(waveW * i + offsetX) + currentK;
        CGPathAddLineToPoint(path, nil, i, y);
    }
    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.bounds.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.bounds.size.height);
    CGPathCloseSubpath(path);
    _firstWaveLayer.path = path;
    
    //创建一个路径
    CGMutablePathRef path2 = CGPathCreateMutable();
    CGFloat y2 = currentK;
    CGPathMoveToPoint(path2, nil, 0, y);
    
    for (int i = 0; i < waterWaveWidth; i++) {
        y2 = waveA * sin(waveW * i + offsetX - waterWaveWidth / 2) + currentK;
        CGPathAddLineToPoint(path2, nil, i, y2);
    }
    
    CGPathAddLineToPoint(path2, nil, waterWaveWidth, self.bounds.size.height);
    CGPathAddLineToPoint(path2, nil, 0, self.bounds.size.height);
    CGPathCloseSubpath(path2);
    _secondWaveLayer.path = path2;
}
@end


