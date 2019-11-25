//
//  DCJUI.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "DCJUI.h"
#import <UIKit/UIKit.h>


@implementation DCJUI


+ (UINavigationController *)getTopNavigationController {
    for (UIWindow *win in [UIApplication sharedApplication].windows) {
        if (win.windowLevel == 0) {
            return (UINavigationController *)(win.rootViewController);
        }
    }
    return nil;
}


@end
