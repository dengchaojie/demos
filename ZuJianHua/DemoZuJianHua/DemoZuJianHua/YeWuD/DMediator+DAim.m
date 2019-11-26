//
//  DMediator+DAim.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/26.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "DMediator+DAim.h"

//#import <AppKit/AppKit.h>


@implementation DMediator (DAim)


+ (void)gotoDAimController:(NSString *)name callBack:(void (^)(void))callBack {
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          name, @"name",
                          callBack, @"callBack",
                          nil];
    [[DMediator shared] excuteBlockWithKey:@"DAim" parameter:dict];
    
    
}

@end
