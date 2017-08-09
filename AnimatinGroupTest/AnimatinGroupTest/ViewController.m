//
//  ViewController.m
//  AnimatinGroupTest
//
//  Created by 包宇津 on 2017/8/8.
//  Copyright © 2017年 baoyujin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *groupArray;
@property (nonatomic, strong) NSMutableArray *section2Array;
@property (nonatomic, strong) NSMutableArray *classArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    self.title =@"动画测试";
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}


- (NSMutableArray *)groupArray {
    if (_groupArray) {
        return _groupArray;
    }
    _groupArray = [[NSMutableArray alloc] initWithObjects:@"CABasicAnimatino基础动画",@"CAKeyFrameAnimation基础动画",@"画线动画 线条递增 递减动画",@"CATransition转场动画",@"CASpringAnimatin弹簧动画", nil];
    return _groupArray;
}

- (NSMutableArray *)section2Array {
    if (_section2Array) {
        return _section2Array;
    }
    _section2Array = [[NSMutableArray alloc] initWithObjects:@"水波纹动画",@"烛火效果", nil];
    return _section2Array;
}

- (NSMutableArray *)classArray {
    if (_classArray) {
        return _classArray;
    }
    NSArray *array = @[@[@"YJBasicAnimation",@"YJKeyFrameAnimation",@"YJDrawLineAnimViewController",@"YJTransitionAnimViewController",@"YJSpringAnimViewController"],@[@"YJWaterWaveAnimViewController",@"YJFireAnimViewController"]];
    _classArray = [[NSMutableArray alloc] initWithArray:array];
    return _classArray;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"动画基础实例";
    }else{
        return @"动画常见经典案例";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    }else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0){
        return 0;
    }
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (indexPath.section == 0) {
        cell.textLabel.text = self.groupArray[indexPath.row];
    }else {
        cell.textLabel.text = self.section2Array[indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = [self.classArray[indexPath.section] objectAtIndex:indexPath.row];
    Class  class = NSClassFromString(className);
    UIViewController *VC = [[class alloc] init];
    if(!([VC isKindOfClass:[UIViewController class]])){ //这种方式不需要导入头文件 
        return;
    }else {
        [self.navigationController pushViewController:VC animated:YES];
    }
}

@end
