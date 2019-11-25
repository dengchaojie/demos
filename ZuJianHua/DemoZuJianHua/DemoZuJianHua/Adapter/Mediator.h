//
//  Mediator.h
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Mediator : NSObject


+ (void)gotoDetailViewControllerWithName:(NSString *)name;

+ (void)gotoListViewControllerWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
