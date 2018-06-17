//
//  UIViewController+arlonLoginViewController.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/17.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "arlonLoginViewController.h"

@interface arlonLoginViewController()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;


@end


@implementation arlonLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.title=@"LoginIn";
    
    [self addNameInputLabel];
    [self addNameInputTextField];
    [self addPwdInputLabel];
    [self addPwdameInputTextField];
    [self addLoginButton];
}



#pragma mark - 向屏幕上添加控件
-(void)addNameInputTextField
{
    
    self.nameTextField = [[UITextField alloc]initWithFrame:
                      CGRectMake(150, 200, 200, 50)];
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameTextField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.nameTextField];
    //设置显示文本
    self.nameTextField.text = @"";
    //设置文本颜色
    self.nameTextField.textColor = [UIColor redColor];
    //设置字体
    self.nameTextField.font = [UIFont fontWithName:@"wawati sc" size:20];
}
-(void)addPwdameInputTextField
{
    
    self.pwdTextField = [[UITextField alloc]initWithFrame:
                          CGRectMake(150, 300, 200, 50)];
    self.pwdTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.pwdTextField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.pwdTextField];
    //设置显示文本
    self.pwdTextField.text = @"";
    //设置文本颜色
    self.pwdTextField.textColor = [UIColor redColor];
    //设置字体
    self.pwdTextField.font = [UIFont fontWithName:@"wawati sc" size:20];
}

- (void)addNameInputLabel
{
    //创建一个标签，并设置位置
    CGRect fram=CGRectMake(50,200,100,50);
    UILabel *mylabel=[[UILabel alloc]initWithFrame:fram];
    //设置标签背景颜色为透明色
    mylabel.backgroundColor=[UIColor clearColor];
    //设置标签内容和字体颜色
    mylabel.text=@"Name";
    mylabel.textColor=[UIColor redColor];
    
    //显示行数
    mylabel.numberOfLines=2;
    //阴影颜色
    //mylabel.shadowColor=[UIColor blackColor];
    //阴影尺寸
    //mylabel.shadowOffset=CGSizeMake(2.0,1.0);
    [self.view addSubview:mylabel];
    // [mylabel release];
}

- (void)addPwdInputLabel
{
    //创建一个标签，并设置位置
    CGRect fram=CGRectMake(50,300,100,50);
    UILabel *mylabel=[[UILabel alloc]initWithFrame:fram];
    //设置标签背景颜色为透明色
    mylabel.backgroundColor=[UIColor clearColor];
    //设置标签内容和字体颜色
    mylabel.text=@"PassWord";
    mylabel.textColor=[UIColor redColor];
    
    //显示行数
    mylabel.numberOfLines=2;
    //阴影颜色
    //mylabel.shadowColor=[UIColor blackColor];
    //阴影尺寸
    //mylabel.shadowOffset=CGSizeMake(2.0,1.0);
    [self.view addSubview:mylabel];
    // [mylabel release];
}



-(void)addLoginButton
{
    UIButton *myButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myButton setFrame:CGRectMake(125, 400,150,40)];
    [myButton setTitle:@"Login" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [myButton setBackgroundColor:[UIColor blueColor]];
    [myButton setTitle:@"HighLight" forState:UIControlStateHighlighted];
    [myButton addTarget:self action : @selector(buttonDown) forControlEvents : UIControlEventTouchDown];
    //放开按钮时实现的方法
    //[myButton addTarget:self action:@selector(buttonRelease:)forControlEvents:UIControlEventTouchUpInside];
    //创建带有图片的按钮
    //[myButton setImage:[UIImage imageNamed:@"123.png"]forState:UIControlStateNormal];
    [self.view addSubview:myButton];
}


#pragma mark - selector
-(void)buttonDown
{
    //NSLog(@"%@",NSHomeDirectory());
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登陆喽"
                                                        message:@"ojbk?"
                                                       delegate:nil
                                              cancelButtonTitle:@"OjbK!"
                                              otherButtonTitles:nil];
    [alertView show];
    mainWindow *mainwindow = [[mainWindow alloc]init];
    [self.navigationController pushViewController:mainwindow animated:YES];
}

@end
