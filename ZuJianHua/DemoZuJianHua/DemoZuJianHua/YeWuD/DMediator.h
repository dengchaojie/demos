//
//  DMediator.h
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/26.
//  Copyright © 2019 chao jie deng. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface DMediator : NSObject

+ (instancetype)shared;

- (void)registerKey:(NSString *)key block: (nonnull id _Nullable (^)(NSDictionary * _Nullable para))block;

- (instancetype)excuteBlockWithKey:(NSString *)key parameter:(NSDictionary *)parameter;
@end

NS_ASSUME_NONNULL_END
