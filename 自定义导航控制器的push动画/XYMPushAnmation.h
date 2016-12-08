//
//  XYMPushAnmation.h
//  自定义导航控制器的push动画
//
//  Created by jack xu on 16/12/7.
//  Copyright © 2016年 jack xu. All rights reserved.
//

#import <UIKit/UIKit.h>

//动画类必须实现UIViewControllerAnimatedTransitioning协议
@interface XYMPushAnmation : NSObject<UIViewControllerAnimatedTransitioning>

@property(nonatomic,assign)UINavigationControllerOperation  navigationOperation;
@property(nonatomic,weak)UINavigationController * navigationController;

@end
