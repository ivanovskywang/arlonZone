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
@end
