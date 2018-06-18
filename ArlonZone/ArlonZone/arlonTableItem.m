//
//  NSObject+arlonTableItem.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/15.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "arlonTableItem.h"


@implementation arlonTableItem


-(void)markAsChecked:(BOOL)isChecked{
    self.checked = isChecked;
    [self setCheckedDate];
}
-(void)setCheckedDate{
    if(self.checked){
        self.checkedDate = [NSDate date];
    }else{
        self.checkedDate = nil;
    }
}

//只要解析一个文件的时候就会调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        //要解归档的属性
        _itemName = [aDecoder decodeObjectForKey:@"itemName"];
        _checked = [aDecoder decodeBoolForKey:@"checked"];
    }
    return self;
}
//当一个对象要归档的时候就会调用这个方法归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //需要归档的属性
    [aCoder encodeObject:self.itemName forKey:@"itemName"];
    
    [aCoder encodeBool:self.checked forKey:@"checked"];
}

@end
