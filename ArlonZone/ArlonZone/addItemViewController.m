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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(sender != self.doneButton)
        return;
    if(self.textField.text.length > 0)
    {
        self.addItem = [[arlonTableItem alloc] init];
        self.addItem.itemName = self.textField.text;
        self.addItem.checked = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];    
    
    // Do any additional setup after loading the view.
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAddedItem)];
    self.navigationItem.rightBarButtonItem = barButtonItem1;
    self.title = @"添加页面";
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 300, 200, 50)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.textField];
    //设置显示文本
    self.textField.text = @"";
    //设置文本颜色
    self.textField.textColor = [UIColor redColor];
    //设置字体
    self.textField.font = [UIFont fontWithName:@"wawati sc" size:20];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
