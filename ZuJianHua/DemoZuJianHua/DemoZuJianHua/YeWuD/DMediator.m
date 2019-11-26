//
//  DMediator.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/26.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "DMediator.h"

@interface DMediator ()

@property (nonatomic, strong) NSMutableDictionary *map;

@end

@implementation DMediator

+ (instancetype)shared {
    static DMediator *obj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[DMediator alloc] init];
        
    });
    return obj;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _map = NSMutableDictionary.new;
    }
    return self;
}


- (void)registerKey:(NSString *)key block: (nonnull id _Nullable (^)(NSDictionary * _Nullable para))block {
    if (key == nil || block == nil) {
        return;
    }
    self.map[key] = block;
    
    
}

- (instancetype)excuteBlockWithKey:(NSString *)key parameter:(NSDictionary *)parameter {
    if (key == nil) {
        return nil;
    }
    id (^block)(NSDictionary *) = self.map[key];
    if (block == nil) {
        return nil;
    }
    return block(parameter);
    
}

@end
