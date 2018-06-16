//
//  UIViewController+addItemViewController.h
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/15.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "arlonTableItem.h"
#import "arlonTableViewController.h"

@interface addItemViewController : UIViewController

@property arlonTableItem *addItem;
 @property (nonatomic, strong) void(^saveBlock)(arlonTableItem *);

@end
