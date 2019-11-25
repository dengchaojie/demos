//
//  Mediator.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//  中介者

#import "Mediator.h"
#import "DetailViewController.h"
#import "ListViewController.h"

@implementation Mediator


+ (void)gotoDetailViewControllerWithName:(NSString *)name {
    
    DetailViewController *vc = DetailViewController.new;
    vc.name = name;
    
    
    
}

+ (void)gotoListViewControllerWithName:(NSString *)name {
    
    ListViewController *vc = ListViewController.new;
    vc.name = name;
    
    
    
}


@end
