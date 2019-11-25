//
//  BAimViewController.h
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "BaseViewController.h"

//typedef void(^BlockBAim)(void);

NS_ASSUME_NONNULL_BEGIN

@interface BAimViewController : BaseViewController


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) void (^callBack)(void);

//@property (nonatomic, copy) BlockBAim callBack;
@end

NS_ASSUME_NONNULL_END
