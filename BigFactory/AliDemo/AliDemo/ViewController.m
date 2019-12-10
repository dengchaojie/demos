//
//  ViewController.m
//  AliDemo
//
//  Created by hrt03 on 2019/12/10.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "ViewController.h"

#define TXUserDefaults [NSUserDefaults standardUserDefaults]
#define TX_Top_Request_Environment_Key      @"TX_AliComSDKDemo_Env"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    integerForKey
    [[NSUserDefaults standardUserDefaults] integerForKey:TX_Top_Request_Environment_Key];
}

//打印一个对象，友好的显示
#pragma mark - utils
- (void)showResult:(id __nullable)result {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *desc = nil;
        if ([result isKindOfClass:NSString.class]) {
            desc = (NSString *)result;
        } else {
            desc = [result description];
            if (desc != nil) {
                desc = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
            }
        }
        NSLog(@"description == %@", desc);
//        self.tv_result.text = desc;
    });
}
@end
