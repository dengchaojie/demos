//
//  Mediator.h
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCJUI.h"

NS_ASSUME_NONNULL_BEGIN

@interface Mediator : NSObject

+ (instancetype)performTarget:(NSString *)target action:(NSString *)action
                   parameters:(NSDictionary *)parameters;
@end

NS_ASSUME_NONNULL_END
