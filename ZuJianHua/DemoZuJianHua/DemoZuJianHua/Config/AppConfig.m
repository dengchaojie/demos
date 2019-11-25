//
//  AppConfig.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "AppConfig.h"

@implementation AppConfig


+ (instancetype)shared {
    static AppConfig *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = AppConfig.new;
    });
    return obj;
}





@end
