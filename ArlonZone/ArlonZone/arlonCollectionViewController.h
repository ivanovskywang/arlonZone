//
//  NSObject+arlonCollectionViewController.h
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/15.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "arlonCollectionCell.h"


@interface arlonCollectionViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property(strong,nonatomic)UICollectionView * myCollection;
@property(strong,nonatomic)NSMutableArray * myArray;
@end
