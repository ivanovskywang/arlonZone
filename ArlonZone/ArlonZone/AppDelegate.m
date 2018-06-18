//
//  AppDelegate.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/15.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property(nonatomic) NSInteger applicationIconBadgeNumber;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    UIApplication *app = [UIApplication sharedApplication];
//    app.applicationIconBadgeNumber = 999;
    [self writeInfo2PlistFile];
    [self notificationHandler];
    
    [self redirectNSlogToDocumentFolder];
    arlonLoginViewController * loginVC = [[arlonLoginViewController alloc]init];
    UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginVC];

    
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

    settingsViewController * VC03 = [[settingsViewController alloc]init];
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
    

    self.window.rootViewController = tabbarVC;
    // 显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)notificationHandler
{
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
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL*)url
{
    // 接受传过来的参数
    NSString *text = [[url host] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Open by Scheme"
                                                        message:text
                                                       delegate:nil
                                              cancelButtonTitle:@"OjbK"
                                              otherButtonTitles:nil];
    [alertView show];
    return YES;
}

// 被启动的APP处理传过来的参数
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"sourceApplication: %@", sourceApplication);
    NSLog(@"URL scheme:%@", [url scheme]);
    NSLog(@"URL query: %@", [url query]);
    
    // 接受传过来的参数
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"接收到参数"
                                                        message:[url query]
                                                       delegate:nil
                                              cancelButtonTitle:@"OjbK"
                                              otherButtonTitles:nil];
    [alertView show];
    
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



#pragma mark - notification的响应
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


#pragma mark - 将nslog的输出信息写入到dr.log文件中
- (void)redirectNSlogToDocumentFolder
{
    // 如果已经连接Xcode调试则不输出到文件
    if(isatty(STDOUT_FILENO))
    {
        return;
    }
    UIDevice *device = [UIDevice currentDevice];
    if([[device model] hasSuffix:@"Simulator"])
    {
        //在模拟器不保存到文件中return;
    }

    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"arlonLogFile.log"];//注意不是NSData!
    NSString *logFilePath = [documentDirectory stringByAppendingPathComponent:fileName];
    //先删除已经存在的文件
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    [defaultManager removeItemAtPath:logFilePath error:nil];
    
    // 将log输入到文件
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+", stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+", stderr);
}

#pragma mark - 将信息写入plist文件
-(void)writeInfo2PlistFile
{
    // 获取到Caches文件夹路径
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    // 拼接文件名
    NSString *filePath = [cachePath stringByAppendingPathComponent:@"tableVCinitData.plist"];
    // 将数据封装成字典
    NSMutableArray *infoArray = [[NSMutableArray alloc]init];
    NSString *tableData1 = @"english";
    [infoArray addObject:@"中文"];
    [infoArray addObject:@"😄"];
    [infoArray addObject:tableData1];
    // 将字典持久化到沙盒文件中
    [infoArray writeToFile:filePath atomically:YES];
}
@end
