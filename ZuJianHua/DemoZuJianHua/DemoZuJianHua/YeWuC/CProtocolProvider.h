//
//  CProtocolProvider.h
//  DemoZuJianHua
//
//  Created by hrt03 on 2019/11/26.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CProtocolProvider : NSObject


- (void)gotoCAimControllerWithName:(NSString *)name callBack:(void (^)(void))callBack;

@end

NS_ASSUME_NONNULL_END
