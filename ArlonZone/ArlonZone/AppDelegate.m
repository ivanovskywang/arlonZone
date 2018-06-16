//
//  AppDelegate.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/15.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIDevice *device = [UIDevice currentDevice];
    [device beginGeneratingDeviceOrientationNotifications];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    //监听屏幕方向
    [nc addObserver:self
           selector:@selector(orientationChanged:)
               name:UIDeviceOrientationDidChangeNotification
             object:device];
    // app启动或者app从后台进入前台都会调用这个方法
    [nc addObserver:self
           selector:@selector(applicationBecomeActive:)
               name:UIApplicationDidBecomeActiveNotification
             object:nil];
    // app从后台进入前台都会调用这个方法
    [nc addObserver:self
           selector:@selector(applicationBecomeActive:) name:UIApplicationWillEnterForegroundNotification
             object:nil];
    // 添加检测app进入后台的观察者
    [nc addObserver:self
           selector:@selector(applicationEnterBackground:)
               name: UIApplicationDidEnterBackgroundNotification
             object:nil];
    
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
    

    self.window.rootViewController = tabbarVC;
    // 显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)orientationChanged:(NSNotification *)note
{
    NSLog(@"屏幕旋转方向常量：%ld",[[note object]orientation]);
}

// 在AppDelete实现该方法
- (void)applicationEnterBackground:(UIApplication *)application
{
    //进入后台
    NSLog(@"进入后台");
}
// 在AppDelete实现该方法
- (void)applicationBecomeActive:(UIApplication *)application
{
    // app启动或者app从后台进入前台都会调用这个方法
    NSLog(@"app启动或者app从后台进入前台");
}

@end
