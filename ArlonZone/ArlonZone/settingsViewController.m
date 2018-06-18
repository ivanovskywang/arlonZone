//
//  UIViewController+settingsViewController.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/18.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "settingsViewController.h"


@interface settingsViewController()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation settingsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addinputTextField];
    [self addLabel];
    [self addDeleteButton];
    [self addDownloadButton];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.title=@"Settings";
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveSettingAndMove2RootVC)];
    self.navigationItem.rightBarButtonItem = barButtonItem1;

}

#pragma mark - 各种界面控件
- (void)addLabel
{
    //创建一个标签，并设置位置
    CGRect fram=CGRectMake(50,100,100,50);
    UILabel *mylabel=[[UILabel alloc]initWithFrame:fram];
    //设置标签背景颜色为透明色
    mylabel.backgroundColor=[UIColor clearColor];
    //设置标签内容和字体颜色
    mylabel.text=@"FontSize";
    mylabel.textColor=[UIColor blackColor];
    
    //显示行数
    mylabel.numberOfLines=2;
    //阴影颜色
    //mylabel.shadowColor=[UIColor blackColor];
    //阴影尺寸
    //mylabel.shadowOffset=CGSizeMake(2.0,1.0);
    [self.view addSubview:mylabel];
    // [mylabel release];
}

-(void)addinputTextField
{
    
    self.textField = [[UITextField alloc]initWithFrame:
                      CGRectMake(150, 100, 200, 50)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.backgroundColor = [UIColor grayColor];
    self.textField.placeholder = @"输入字体大小";
    
    
    [self.view addSubview:self.textField];
    //设置显示文本
    self.textField.text = @"";
    //设置文本颜色
    self.textField.textColor = [UIColor redColor];
    //设置字体
    self.textField.font = [UIFont fontWithName:@"wawati sc" size:20];
}

-(void)addDeleteButton
{
    UIButton *myButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myButton setFrame:CGRectMake(50, 600,300,30)];
    [myButton setTitle:@"消灭一切" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [myButton setBackgroundColor:[UIColor redColor]];
    [myButton setTitle:@"HighLight" forState:UIControlStateHighlighted];
    [myButton addTarget:self action : @selector(deleteEverything) forControlEvents : UIControlEventTouchDown];
    //放开按钮时实现的方法
    //[myButton addTarget:self action:@selector(buttonRelease:)forControlEvents:UIControlEventTouchUpInside];
    //创建带有图片的按钮
    //[myButton setImage:[UIImage imageNamed:@"123.png"]forState:UIControlStateNormal];
    [self.view addSubview:myButton];
}

-(void)addDownloadButton
{
    UIButton *myButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myButton setFrame:CGRectMake(50, 250,300,30)];
    [myButton setTitle:@"下载个图片cc" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [myButton setBackgroundColor:[UIColor greenColor]];
    [myButton setTitle:@"HighLight" forState:UIControlStateHighlighted];
    [myButton addTarget:self action : @selector(downloadPic) forControlEvents : UIControlEventTouchDown];
    //放开按钮时实现的方法
    //[myButton addTarget:self action:@selector(buttonRelease:)forControlEvents:UIControlEventTouchUpInside];
    //创建带有图片的按钮
    //[myButton setImage:[UIImage imageNamed:@"123.png"]forState:UIControlStateNormal];
    [self.view addSubview:myButton];
}
#pragma mark - 实现selector方法
-(void)saveSettingAndMove2RootVC
{
    if(self.textField.text.length > 0)
    {
        NSString *fontSize = self.textField.text;
        [[NSUserDefaults standardUserDefaults] setObject:fontSize forKey:@"FontSize"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
    return;
}

-(void)deleteEverything
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFilePath = paths.firstObject;
    [self deleteAllFiles:documentFilePath];
}

-(void)downloadPic
{
    NSString *urlString = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529326364289&di=835479f4cbeb19d72616c24a59b30c03&imgtype=0&src=http%3A%2F%2Fimgs.bzw315.com%2FUploadFiles%2Fimage%2FNews%2F2016%2F11%2F15%2F20161115144239_5850.jpg";
    arlonDownload *downloadImage = [[arlonDownload alloc] init];
    NSData *downloadPicData = [downloadImage downloadData:urlString];
    UIImage * currentImage = [UIImage imageWithData:downloadPicData];
    //首先,需要获取沙盒路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    // 拼接图片名为"currentImage"的路径
    NSString *imageFilePath = [path stringByAppendingPathComponent:@"currentImage"];
    //其中参数0.5表示压缩比例，1表示不压缩，数值越小压缩比例越大
    [UIImageJPEGRepresentation(currentImage, 0.9) writeToFile:imageFilePath  atomically:YES];
    
    
   
    
}

#pragma mark - 文件处理
- (void)deleteAllFiles:(NSString *)path;{
    // 1.判断文件还是目录
    NSFileManager * fileManger = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL isExist = [fileManger fileExistsAtPath:path isDirectory:&isDir];
    if (isExist) {
        // 2. 判断是不是目录
        if (isDir) {
            NSArray * dirArray = [fileManger contentsOfDirectoryAtPath:path error:nil];
            NSString * subPath = nil;
            for (NSString * str in dirArray) {
                subPath  = [path stringByAppendingPathComponent:str];
                BOOL issubDir = NO;
                [fileManger fileExistsAtPath:subPath isDirectory:&issubDir];
                [self deleteAllFiles:subPath];
            }
        }else{
            NSLog(@"我要删了你：%@",path);
            BOOL sucess4 = [fileManger removeItemAtPath:path error:nil];
            if(sucess4){
                //删除成功
                NSLog(@"得手");
            }else{
                //删除失败
                NSLog(@"失败了。。。。");
            }
        }
    }else{
        NSLog(@"你删除的是目录或者不存在");
    }
}

@end
