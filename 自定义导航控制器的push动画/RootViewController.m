//
//  RootViewController.m
//  自定义导航控制器的push动画
//
//  Created by jack xu on 16/12/7.
//  Copyright © 2016年 jack xu. All rights reserved.
//

#import "RootViewController.h"
#import "TwoViewController.h"
#import "XYMPushAnmation.h"

@interface RootViewController ()<UINavigationControllerDelegate>

@property (nonatomic,strong)XYMPushAnmation *xymPushAnmation;

@end

@implementation RootViewController

- (XYMPushAnmation *)xymPushAnmation
{
    if (_xymPushAnmation == nil) {
        _xymPushAnmation = [[XYMPushAnmation alloc]init];
        
    }
    return _xymPushAnmation;
}

- (void)viewDidLoad {

    self.delegate = self;
    _xymPushAnmation = [[XYMPushAnmation alloc] init];
}

//这个代理方法里面使用我们的自定义的动画
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0)
{
    self.xymPushAnmation.navigationOperation = operation;
    self.xymPushAnmation.navigationController = self;
    return self.xymPushAnmation;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
