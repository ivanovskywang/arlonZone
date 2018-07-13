//
//  ViewController.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/15.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
typedef void(^block)(void);
@property (copy, nonatomic) NSString *blockString;
@property (copy, nonatomic) block myBlock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//#ifdef BLOCK_RETAIN_CYCLE
    self.title = @"演示循环引用";
    NSLog(@"来，我们演示循环引用");
    
    
    
    //由于block会对block中的对象进行持有操作,就相当于持有了其中的对象，而如果此时block中的对象又持有了该block，则会造成循环引用。
    __weak typeof(self) weakSelf = self;
    self.myBlock = ^(){
        //其实注释中的代码，同样会造成循环引用
        NSLog(@"由于block会对block中的对象进行持有操作,就相当于持有了其中的对象，而如果此时block中的对象又持有了该block，则会造成循环引用。");
        NSString *localString = weakSelf.blockString;
        NSLog(@"我们持有了self的blockString：%@",localString);
        //NSString *localString = _blockString;
        //[self doSomething];
    };
    //self.myBlock;
//#endif
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"看来没有造成内存泄漏呢^_^");
}
@end
