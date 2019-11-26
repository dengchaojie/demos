//
//  CAimViewController.h
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/26.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAimViewController : BaseViewController


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) void (^callBack)(void);


@end

NS_ASSUME_NONNULL_END
