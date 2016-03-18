//
//  ViewController.m
//  PKU
//
//  Created by 宋亚伟 on 15/8/11.
//  Copyright (c) 2015年 SYW. All rights reserved.
//

#import "ViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SYWLog(@"viewDidLoad");
    [[self rdv_tabBarItem] setBadgeValue:@"0"];
    self.view.backgroundColor = [UIColor brownColor];
    self.navigationItem.title = @"宋亚伟";
    self.navigationItem.rightBarButtonItem.title = @"返回";
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)click{
    if ([[self rdv_tabBarItem].badgeValue isEqualToString:@""]) {
        [[self rdv_tabBarItem] setBadgeValue:@"1"];
    }else{
        [[self rdv_tabBarItem] setBadgeValue:@""];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"songyawei");
    UIViewController *v = [[ViewController alloc] init];
    [self.navigationController pushViewController:v  animated:YES];

    
}
- (void)dealloc{
    SYWLog(@"ViewController-dealloc");
}

@end
