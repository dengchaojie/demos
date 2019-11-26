//
//  Mediator.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//  中介者

#import "Mediator.h"

@implementation Mediator


+ (instancetype)performTarget:(NSString *)target action:(NSString *)action
                   parameters:(NSDictionary *)parameters {
    
    Class cls;
    SEL sel;
    id obj;
    
    cls = NSClassFromString(target);
    if (cls == nil) {
        goto fail;
    }
    sel = NSSelectorFromString(action);
    if (sel == nil) {
        goto fail;
    }
    obj = cls.new;
    if (obj == nil) {
        goto fail;
    }
    if ([obj respondsToSelector: sel]) {

    } else {
        goto fail;
    }
    
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [obj performSelector:sel withObject:parameters];
    #pragma clang diagnostic pop
    fail:
        NSLog(@"找不到目标，写容错逻辑");
        return nil;
    
    
}




@end
