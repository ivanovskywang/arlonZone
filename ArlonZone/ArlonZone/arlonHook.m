//
//  NSObject+arlonHook.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/26.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "arlonHook.h"
#import <objc/objc.h>
#import <objc/runtime.h>
@interface arlonHook()
@end


@implementation arlonHook
+ (void)load
{
    // 获取到ViewController中sendEvent对应的method
    Method sendEvent = class_getInstanceMethod([UIViewController class], @selector(sendToMessage:));
    Method sendEventMySelf = class_getInstanceMethod([self class], @selector(sendEventHooked:));
    
    // 然后用我们自己的函数的实现，替换目标函数对应的实现
    IMP sendEventMySelfImp = method_getImplementation(sendEventMySelf);
    class_replaceMethod([UIViewController class], @selector(sendToMessage:), sendEventMySelfImp, method_getTypeEncoding(sendEvent));
}

/*
 * 截获到ViewController的sendEvent
 * 我们可以先处理完以后，再继续调用正常处理流程
 */

- (void)sendEventHooked:(NSString *)str
{
    // 操作我们想操作的事情
    NSLog(@"%s, --> %@",__func__,@"操作我们想操作的事情");
}

@end
