//
//  NSObject+arlonTableItem.h
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/15.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface arlonTableItem:NSObject<NSCoding>


@property (nonatomic, copy) NSString *itemName;
@property (nonatomic) BOOL checked;
@property NSDate *checkedDate;
-(void)markAschecked:(BOOL) isChecked;

@end


