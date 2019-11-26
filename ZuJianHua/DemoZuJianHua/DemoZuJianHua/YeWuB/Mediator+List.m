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

//定义分类的目的前面也说了，相当于一个语法糖，让调用者轻松使用，让 hard code 交给对应的业务工程师。
/// 此方法就是一个拦截器，可做容错以及动态调度
+ (void)gotoBAimControllerWithName:(NSString *)name callBack:(void (^)(void))callBack {
    NSDictionary *para = [NSDictionary
                          dictionaryWithObjectsAndKeys:
                          name,@"name",
                          callBack,@"callBack",
                          nil];
    // 运行时解耦
    // 硬编码
    [self performTarget:@"BAimTarget" action:@"gotoBAimController:" parameters:para];
}

@end
