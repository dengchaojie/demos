//
//  BAimTarget.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "BAimTarget.h"
#import "BAimViewController.h"


@implementation BAimTarget


- (void)gotoBAimController:(NSDictionary *)parameters {
    BAimViewController *vc = BAimViewController.new;
    vc.name = parameters[@"name"];
    vc.callBack = parameters[@"name"];
    [[DCJUI getTopNavigationController] pushViewController:vc animated:true];
    

}

@end
