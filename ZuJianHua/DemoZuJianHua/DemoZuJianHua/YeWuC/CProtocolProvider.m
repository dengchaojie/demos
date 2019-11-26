//
//  CProtocolProvider.m
//  DemoZuJianHua
//
//  Created by hrt03 on 2019/11/26.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "CProtocolProvider.h"
#import "CProtocol.h"
#import "CMediator.h"
#import "CAimViewController.h"


@interface CProtocolProvider () <CProtocol>


@end


@implementation CProtocolProvider


+ (void)load {
    [[CMediator shared] regiterProtocol:@protocol(CProtocol) class:self];
    
    
}


- (void)gotoCAimControllerWithName:(NSString *)name callBack:(void (^)(void))callBack {
    CAimViewController *vc = CAimViewController.new;
    vc.name = name;
    vc.callBack = callBack;
    [[DCJUI getTopNavigationController] pushViewController:vc animated:true];
    
}

@end
