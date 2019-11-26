//
//  CMediator.h
//  DemoZuJianHua
//
//  Created by hrt03 on 2019/11/26.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMediator : NSObject

+ (instancetype)shared;

- (void)regiterProtocol:(Protocol *)pro class: (Class)cls;

- (id <CProtocol>)getObjectWith:(Protocol *)pro;

@end

NS_ASSUME_NONNULL_END
