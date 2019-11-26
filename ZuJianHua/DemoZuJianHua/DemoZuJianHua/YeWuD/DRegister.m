//
//  DRegister.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/26.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "DRegister.h"
#import "DMediator.h"
#import "DAimViewController.h"

@implementation DRegister

+ (void)load {
    [[DMediator shared] registerKey:@"DAim" block:^id _Nullable(NSDictionary * _Nullable para) {
        DAimViewController *vc = DAimViewController.new;
        vc.name = para[@"name"];
        vc.callBack = para[@"callBack"];
        [[DCJUI getTopNavigationController] pushViewController:vc animated:true];
        return nil;
        
    }];
}



@end
