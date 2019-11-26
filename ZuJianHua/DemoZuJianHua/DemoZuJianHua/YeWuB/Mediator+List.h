//
//  Mediator+List.h
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import "Mediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface Mediator (List)


/// 内部路由
+ (void)gotoListViewControllerWithName:(NSString *)name;

/// 外部路由
+ (void)gotoBAimControllerWithName:(NSString *)name
                          callBack:(void (^)(void))callBack;

@end

NS_ASSUME_NONNULL_END
