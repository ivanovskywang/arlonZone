//
//  UIViewController+arlonBlockController.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/7/12.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "arlonBlockController.h"
typedef void(^block)(void);

@interface arlonBlockController()
@property (copy, nonatomic) block myBlock;
@property (copy, nonatomic) NSString *blockString;
@end

@implementation arlonBlockController
- (void)viewDidLoad {
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [super viewDidLoad];
    self.title=@"Block循环引用";
    [self retainCycleButton];
    [self ojbkButton];
    [self testButton];
    UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(moveToAddItemVC)];
    self.navigationItem.rightBarButtonItem = barButtonItem1;
    
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //UIBarButtonItem *barButtonItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveSettingAndMove2RootVC)];
    //self.navigationItem.rightBarButtonItem = barButtonItem1;
    
}

#pragma mark - 界面控件

-(void)testButton
{
    UIButton *myButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myButton setFrame:CGRectMake(50, 200,300,30)];
    [myButton setTitle:@"测试下🚽" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [myButton setBackgroundColor:[UIColor yellowColor]];
    [myButton setTitle:@"HighLight" forState:UIControlStateHighlighted];
    [myButton addTarget:self action : @selector(myTestBlock) forControlEvents : UIControlEventTouchDown];
    [self.view addSubview:myButton];
}

-(void)retainCycleButton
{
    UIButton *myButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myButton setFrame:CGRectMake(50, 600,300,30)];
    [myButton setTitle:@"循环吧♻️" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [myButton setBackgroundColor:[UIColor redColor]];
    [myButton setTitle:@"HighLight" forState:UIControlStateHighlighted];
    [myButton addTarget:self action : @selector(retainCycleTestBlock) forControlEvents : UIControlEventTouchDown];
    [self.view addSubview:myButton];
}

-(void)ojbkButton
{
    UIButton *myButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [myButton setFrame:CGRectMake(50, 400,300,30)];
    [myButton setTitle:@"没有问题👌" forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [myButton setBackgroundColor:[UIColor greenColor]];
    [myButton setTitle:@"HighLight" forState:UIControlStateHighlighted];
    [myButton addTarget:self action : @selector(ojbkTestBlock) forControlEvents : UIControlEventTouchDown];
    [self.view addSubview:myButton];
}

#pragma mark - block的循环引用示例
- (void)retainCycleTestBlock {
//    NSLog(@"来，我们演示循环引用");
//    //由于block会对block中的对象进行持有操作,就相当于持有了其中的对象，而如果此时block中的对象又持有了该block，则会造成循环引用。
//    self.myBlock = ^(){
//        //其实注释中的代码，同样会造成循环引用
//        NSString *localString = self.blockString;
//        NSLog(@"由于block会对block中的对象进行持有操作,就相当于持有了其中的对象，而如果此时block中的对象又持有了该block，则会造成循环引用。");
//        NSLog(@"我们持有了self的blockString：%@",localString);
//        //NSString *localString = _blockString;
//        [self doSomething];
//    };
    
    ViewController *testVC = [[ViewController alloc]init];
    [self.navigationController pushViewController:testVC animated:YES];
}

- (void)ojbkTestBlock {
    NSLog(@"来，我们演示正常的引用");
    //由于block会对block中的对象进行持有操作,就相当于持有了其中的对象，而如果此时block中的对象又持有了该block，则会造成循环引用。
    __weak typeof(self) weakSelf = self;
    self.myBlock = ^(){
        //其实注释中的代码，同样会造成循环引用
        NSString *localString = weakSelf.blockString;
        NSLog(@"由于block会对block中的对象进行持有操作,就相当于持有了其中的对象，而如果此时block中的对象又持有了该block，则会造成循环引用。");
        NSLog(@"我们持有了self的blockString：%@",localString);
        //NSString *localString = _blockString;
        [weakSelf doSomething];
    };
}

- (void)myTestBlock {
    NSLog(@"来，我们ceshi");
    float price = 1.99;
    float (^finalPrice)(int) = ^(int quantity) {
        // Notice local variable price is
        // accessible in the block
        return quantity * price;
    };
    int orderQuantity = 10;
    NSLog(@"Ordering %d units, final price is: $%2.2f", orderQuantity, finalPrice(orderQuantity));
}

-(void)doSomething{
    NSLog(@"Do Something...");
}

-(void) retainCycleBlock
{
    if(self){
//        _instanceStr = @"A string";
//        __block arlonBlockController *blockSelf = self;
//        _myBlock = Block_copy(^{
//            NSLog(@"instanceStr is %@ \n",_instanceStr);
//        })
    }
}


@end
