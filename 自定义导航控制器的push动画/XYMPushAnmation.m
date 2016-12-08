//
//  XYMPushAnmation.m
//  自定义导航控制器的push动画
//
//  Created by jack xu on 16/12/7.
//  Copyright © 2016年 jack xu. All rights reserved.
//

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#import "XYMPushAnmation.h"

@interface XYMPushAnmation ()

@end

@implementation XYMPushAnmation

/* 动画持续的时间 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext

{
    
    return 0.5f;
    
}

/* 动画的内容 */
//通过transitionContext这个上下文环境可以获取源视图控制器，目标视图控制器：
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    if (self.navigationOperation == UINavigationControllerOperationPush) {
        
        //目的ViewController
        UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        //起始ViewController
        UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        //添加toView到上下文
        [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
        
        //自定义动画
        toViewController.view.transform = CGAffineTransformMakeTranslation(ScreenWidth, ScreenHeight);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            
            fromViewController.view.transform = CGAffineTransformMakeTranslation(-ScreenWidth, -ScreenHeight);
            //在操作结束之后可对设置量进行还原
            toViewController.view.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            fromViewController.view.transform = CGAffineTransformIdentity;
            // 声明过渡结束时调用 completeTransition: 这个方法
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
    
    }
    
    if (self.navigationOperation == UINavigationControllerOperationPop) {
        
        //目的ViewController
        UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        //起始ViewController
        UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        //添加toView到上下文
        [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
        
        //自定义动画
        toViewController.view.transform = CGAffineTransformMakeTranslation(-ScreenWidth, -ScreenHeight);
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            
            fromViewController.view.transform = CGAffineTransformMakeTranslation(ScreenWidth, ScreenHeight);
            toViewController.view.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            fromViewController.view.transform = CGAffineTransformIdentity;
            // 声明过渡结束时调用 completeTransition: 这个方法
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
        
    }


}


@end
