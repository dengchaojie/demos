//
//  AMediator+Detail.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "AMediator+Detail.h"
#import "DetailViewController.h"
#import "DetailOldViewController.h"

@implementation AMediator (Detail)


+ (void)gotoDetailViewControllerWithName:(NSString *)name {
    BOOL isException = [[[NSUserDefaults standardUserDefaults] objectForKey:@"DetailViewControllerException"] boolValue];
    if (isException) {
        [self gotoDetailOldViewController];
        return;
    }
    
    
    DetailViewController *vc = DetailViewController.new;
    vc.name = name;
    [[DCJUI getTopNavigationController] pushViewController:vc animated:true];
    
    
}

+ (void)gotoDetailOldViewController {
    
    DetailOldViewController *vc = DetailOldViewController.new;
    [[DCJUI getTopNavigationController] pushViewController:vc animated:true];
}


- (void)gotoAim:(NSString *)aim params:(NSDictionary *)params {
//    1、动态调用逻辑（通过服务器下发配置判断）
    BOOL isException = [[[NSUserDefaults standardUserDefaults] objectForKey:@"DetailViewControllerException"] boolValue];
    if (isException) {
        //    2、通过 aim 和 params 动态调用具体业务

        return;
    }
    
    
    
}

@end
