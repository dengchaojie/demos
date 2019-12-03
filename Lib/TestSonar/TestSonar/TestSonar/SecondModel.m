//
//  SecondModel.m
//  TestSonar
//
//  Created by hrt03 on 2019/12/2.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "SecondModel.h"

@implementation SecondModel

- (instancetype)init
{
    self = [super init];
    //  不推荐示例：
    if (self) {
        _someName = @"someName";
        NSLog(@"SecondModel init");
        NSLog(@"SecondModel init2");

    }
    //  推荐示例：
    if (self == nil) {
        return self;
    }
    self.someName = @"someName";
    return self;
}


@end
