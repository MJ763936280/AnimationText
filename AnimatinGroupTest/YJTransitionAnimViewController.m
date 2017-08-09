//
//  YJTransitionAnimViewController.m
//  AnimatinGroupTest
//
//  Created by 包宇津 on 2017/8/9.
//  Copyright © 2017年 baoyujin. All rights reserved.
//

#import "YJTransitionAnimViewController.h"

@interface YJTransitionAnimViewController ()
@property (nonatomic, strong) NSMutableArray *animArr;
@property (nonatomic, strong) UILabel *transitionLabel;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation YJTransitionAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.index = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    self.transitionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    _transitionLabel.center = CGPointMake(375 / 2, 667 / 2);
    _transitionLabel.backgroundColor = [UIColor redColor];
    _transitionLabel.font = [UIFont systemFontOfSize:20];
    _transitionLabel.numberOfLines = 0;
    _transitionLabel.textColor = [UIColor blueColor];
    _transitionLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_transitionLabel];
    
    self.btn = [[UIButton alloc] init];
    _btn.backgroundColor = [UIColor blueColor];
    _btn.frame = CGRectMake(0, 0, 50, 40);
    _btn.center = CGPointMake(375 / 2, 640);
    [_btn setTitle:@"动画" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
}

- (void)btnAction {
    if (self.index > self.animArr.count - 1) {
        self.index = 0;
    }
    CATransition *pageCurlAnim = [[CATransition alloc] init];
    pageCurlAnim.duration = 1.0;
    pageCurlAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pageCurlAnim.type = self.animArr[self.index];
    pageCurlAnim.subtype = kCATransitionFromLeft;
    pageCurlAnim.repeatCount = 1;
    [pageCurlAnim setValue:@"transitionAnim" forKey:@"anim"];
    [_transitionLabel.layer addAnimation:pageCurlAnim forKey:@"transition"];
    _transitionLabel.text = [NSString stringWithFormat:@"动画效果:%@",self.animArr[self.index]];
    self.index += 1;
}

- (NSMutableArray *)animArr {
    if (_animArr) {
        return _animArr;
    }
    NSArray *array = @[@"cube", @"suckEffect", @"rippleEffect", @"pageCurl", @"pageUnCurl", @"oglFlip", @"cameraIrisHollowOpen", @"cameraIrisHollowClose", @"spewEffect",@"genieEffect",@"unGenieEffect",@"twist",@"tubey",@"swirl",@"charminUltra", @"zoomyIn", @"zoomyOut", @"oglApplicationSuspend"];
    _animArr = [NSMutableArray arrayWithArray:array];
    return _animArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

