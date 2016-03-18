//
//  SYWTabBarController.m
//  PKU
//
//  Created by 宋亚伟 on 15/8/14.
//  Copyright (c) 2015年 SYW. All rights reserved.
//

#import "SYWTabBarController.h"
#import "ViewController.h"
#import "SYWNavigationController.h"
#import "RDVTabBarItem.h"
#import "RDVFirstViewController.h"
#import "RDVSecondViewController.h"
#import "RDVThirdViewController.h"

@interface SYWTabBarController ()

@end

@implementation SYWTabBarController

+ (instancetype)getTabBarController
{
    SYWTabBarController *SYW = [[self alloc] init];
    return SYW;
}

- (instancetype)init{
    if(self = [super init]){
        UIViewController *firstViewController = [[RDVFirstViewController alloc] init];
        UIViewController *firstNavigationController = [[SYWNavigationController alloc]
                                                       initWithRootViewController:firstViewController];
        firstNavigationController.title = @"首页";
        
        UIViewController *secondViewController = [[RDVSecondViewController alloc] init];
        UIViewController *secondNavigationController = [[SYWNavigationController alloc]
                                                        initWithRootViewController:secondViewController];
        secondNavigationController.title = @"消息";
        
        UIViewController *plusBtnViewController = [[RDVThirdViewController alloc] init];
        UIViewController *plusBtnNavigationController = [[SYWNavigationController alloc]
                                                         initWithRootViewController:plusBtnViewController];
        
        UIViewController *thirdViewController = [[ViewController alloc] init];
        UIViewController *thirdNavigationController = [[SYWNavigationController alloc]
                                                       initWithRootViewController:thirdViewController];
        thirdNavigationController.title = @"发现";
        
        UIViewController *forthViewController = [[ViewController alloc] init];
        UIViewController *forthNavigationController = [[SYWNavigationController alloc]
                                                       initWithRootViewController:forthViewController];
        forthNavigationController.title = @"我";
        

        [self setViewControllers:@[firstNavigationController,secondNavigationController,plusBtnNavigationController,thirdNavigationController,forthNavigationController]];

        
        [self customizeTabBarForController:self];

    }
    return self;
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    //    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    //    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    
    NSArray *tabBarItemImages = @[@"tabbar_home", @"tabbar_message_center",@"tabbar_compose_icon_add", @"tabbar_discover", @"tabbar_profile"];
    
    NSArray *tabBarItemSelectedImages = @[@"tabbar_home_selected", @"tabbar_message_center_selected",@"tabbar_compose_icon_add_highlighted", @"tabbar_discover_selected", @"tabbar_profile_selected"];
    
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        
        //        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[tabBarItemSelectedImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        if (index == 2) {
            [item setBackgroundSelectedImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] withUnselectedImage:[UIImage imageNamed:@"tabbar_compose_button"]];
        }
        
        index++;
    }
}


@end
