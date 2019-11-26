//
//  CMediator.m
//  DemoZuJianHua
//
//  Created by hrt03 on 2019/11/26.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "CMediator.h"

@interface CMediator ()

@property (nonatomic, strong) NSMutableDictionary *map;
@end

@implementation CMediator

+ (instancetype)shared {
    static CMediator *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[CMediator alloc] init];
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

- (void)regiterProtocol:(Protocol *)pro class: (Class)cls {
    if (pro == nil || cls == nil) {
        return;
    }
    self.map[NSStringFromProtocol(pro)] = cls;
}

- (id <CProtocol>)getObjectWith:(Protocol *)pro {
    
    if (pro == nil) {
        return nil;
    }
    Class cls = self.map[NSStringFromProtocol(pro)];
    if (cls == nil) {
        return nil;
    }
    id obj = cls.new;
    if ([obj conformsToProtocol:pro]) {
        return obj;

    }
    return nil;
    
}



@end
