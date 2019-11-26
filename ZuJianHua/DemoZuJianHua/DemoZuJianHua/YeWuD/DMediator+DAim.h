//
//  DMediator+DAim.h
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/26.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import "DMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface DMediator (DAim)


+ (void)gotoDAimController:(NSString *)name callBack:(void (^)(void))callBack;

@end

NS_ASSUME_NONNULL_END
