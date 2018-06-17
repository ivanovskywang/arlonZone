//
//  UIViewController+mainWindow.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/17.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "mainWindow.h"

@interface mainWindow()

@end

@implementation mainWindow

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置窗口的跟控制器
    UITabBarController * tabbarVC = [[UITabBarController alloc]init];
    
    arlonTableViewController * VC01 = [[arlonTableViewController alloc]init];
    //设置navigationcontroller
    UINavigationController *tableNav = [[UINavigationController alloc]initWithRootViewController:VC01];
    
    tableNav.tabBarItem.title = @"TableView";
    tableNav.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    tableNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    tableNav.view.backgroundColor = [UIColor whiteColor];
    [tabbarVC addChildViewController:tableNav];
    
    arlonCollectionViewController * VC02 = [[arlonCollectionViewController alloc]init];
    VC02.tabBarItem.title = @"CollectionView";
    VC02.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    VC02.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_new_click_icon"];
    VC02.view.backgroundColor = [UIColor greenColor];
    [tabbarVC addChildViewController:VC02];
    
    addItemViewController * VC03 = [[addItemViewController alloc]init];
    VC03.tabBarItem.title = @"关注";
    VC03.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    VC03.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    VC03.view.backgroundColor = [UIColor whiteColor];
    [tabbarVC addChildViewController:VC03];
    
    arlonLoginViewController * VC04 = [[arlonLoginViewController alloc]init];
    VC04.tabBarItem.title = @"login";
    VC04.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    VC04.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    VC04.view.backgroundColor = [UIColor whiteColor];
    [tabbarVC addChildViewController:VC04];
    
}

@end
