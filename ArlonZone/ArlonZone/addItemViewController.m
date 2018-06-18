//
//  UIViewController+addItemViewController.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/15.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "addItemViewController.h"
#import "arlonTableViewController.h"

@interface addItemViewController()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation addItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    
    // Do any additional setup after loading the view.
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAddedItem)];
    self.navigationItem.rightBarButtonItem = barButtonItem1;
    self.title = @"添加页面";
    [self addinputTextField];
    [self addLabel];
    [self addArlonButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addinputTextField
{
    
    self.textField = [[UITextField alloc]initWithFrame:
                      CGRectMake(50, 200, 300, 50)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.backgroundColor = [UIColor grayColor];
    self.textField.placeholder = @"输入要添加的事件";
    

    [self.view addSubview:self.textField];
    //设置显示文本
    self.textField.text = @"";
    //设置文本颜色
    self.textField.textColor = [UIColor redColor];
    //设置字体
    self.textField.font = [UIFont fontWithName:@"wawati sc" size:20];
}

- (void)addLabel
{
    //创建一个标签，并设置位置
    CGRect fram=CGRectMake(50,150,100,50);
    UILabel *mylabel=[[UILabel alloc]initWithFrame:fram];
    //设置标签背景颜色为透明色
    mylabel.backgroundColor=[UIColor clearColor];
    //设置标签内容和字体颜色
    mylabel.text=@"在此输入";
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

-(void)addArlonButton
{
    UIButton *myButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myButton setFrame:CGRectMake(50, 600,200,30)];
    [myButton setTitle:@"设置字体" forState:UIControlStateNormal];
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
//    NSLog(@"%@",NSHomeDirectory());
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"沙箱路径"
//                                                        message:NSHomeDirectory()
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OjbK"
//                                              otherButtonTitles:nil];
//    [alertView show];
    settingsViewController *settingVC = [[settingsViewController alloc]init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

-(void)saveAddedItem
{
    if(self.textField.text.length > 0)
    {
        arlonTableItem *addItem = [[arlonTableItem alloc] init];
        addItem.itemName = self.textField.text;
        addItem.checked = NO;
        if (self.saveBlock){
            self.saveBlock(addItem);
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
