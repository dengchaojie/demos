//
//  Mediator+List.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "Mediator+List.h"
#import "ListViewController.h"
//#import <AppKit/AppKit.h>


@implementation Mediator (List)


+ (void)gotoListViewControllerWithName:(NSString *)name {
    
    ListViewController *vc = ListViewController.new;
    vc.name = name;
    [[DCJUI getTopNavigationController] pushViewController:vc animated:true];

    
    
}


+ (void)gotoBAimControllerWithName:(NSString *)name callBack:(void (^)(void))callBack {
    NSDictionary *para = [NSDictionary
                          dictionaryWithObjectsAndKeys:
                          name,@"name",
                          callBack,@"callBack",
                          nil];
    [self performTarget:@"BAimTarget" action:@"gotoBAimController:" parameters:para];
}

@end
