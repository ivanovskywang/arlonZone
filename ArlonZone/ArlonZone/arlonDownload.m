//
//  NSObject+arlonDownload.m
//  ArlonZone
//
//  Created by Arlongwang on 2018/6/15.
//  Copyright © 2018年 Arlongwang. All rights reserved.
//

#import "arlonDownload.h"

@implementation arlonDownload

// 下载数据
- (NSData *)downloadData
{
    NSString *urlString=@"http://res.tu.qq.com/weishi/materials/video_huangzitaomanhua_iOS.png?v=0?t=webp";
    [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url=[NSURL URLWithString:urlString];
    NSData *imageData=[NSData dataWithContentsOfURL:url];
    NSLog(@"%@",url.scheme);
    //服务器名称
    NSLog(@"%@",url.host);
    NSLog(@"%@",url.query);
    return imageData;
}


@end
