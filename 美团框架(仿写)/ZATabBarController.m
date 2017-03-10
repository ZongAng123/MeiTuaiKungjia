//
//  ZATabBarController.m
//  美团框架(仿写)
//
//  Created by 纵昂 on 2017/3/10.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "ZATabBarController.h"

#import "ZAHomeController.h"
#import "ZABusinessController.h"
#import "ZAMeController.h"
#import "ZAMoreController.h"

@interface ZATabBarController ()

@end

@implementation ZATabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initTabbarItem];
    
}
-(void)initTabbarItem{
    
    ZAHomeController *home = [[ZAHomeController alloc]init];
    [self controller:home title:@"首页" image:@"icon_tabbar_homepage@2x" selectedimage:@"icon_tabbar_homepage_selected@2x"];
    
    ZABusinessController *business = [[ZABusinessController alloc]init];
    [self controller:business title:@"商家" image:@"icon_tabbar_merchant_normal@2x" selectedimage:@"icon_tabbar_merchant_selected@2x"];
    
    ZAMeController *me = [[ZAMeController alloc]init];
    [self controller:me title:@"我的" image:@"icon_tabbar_mine@2x" selectedimage:@"icon_tabbar_mine_selected@2x"];
    
    ZAMoreController *more = [[ZAMoreController alloc]init];
    [self controller:more title:@"更多" image:@"icon_tabbar_misc@2x" selectedimage:@"icon_tabbar_misc_selected@2x"];
    
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:navigationBarColor,UITextAttributeTextColor, nil] forState:UIControlStateSelected];
}


//初始化一个zi控制器
-(void)controller:(UIViewController *)TS title:(NSString *)title image:(NSString *)image selectedimage:(NSString *)selectedimage
{
    TS.tabBarItem.title = title;
    TS.tabBarItem.image = [UIImage imageNamed:image];
    TS.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:TS];
    [self addChildViewController:nav];
}

@end
