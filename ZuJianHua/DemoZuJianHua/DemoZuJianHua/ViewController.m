//
//  ViewController.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "AMediator+Detail.h"// A
#import "Mediator+List.h"// B
#import "DMediator+DAim.h"// D
#import "CMediator.h"//C



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"ViewController";

    AppConfig.shared.isDetailExc = @0;// 后端下发
    [[NSUserDefaults standardUserDefaults] setObject:AppConfig.shared.isDetailExc forKey:@"DetailViewControllerException"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [Mediator gotoDetailViewControllerWithName:@"业务A"];
//    [Mediator gotoBAimControllerWithName:@"业务B" callBack:^{
//        NSLog(@"gotoBAimControllerWithName");
//    }];
//    [DMediator gotoDAimController:@"业务D" callBack:^{
//        NSLog(@"gotoDAimController");
//
//    }];
    id<CProtocol> obj = [[CMediator shared] getObjectWith:@protocol(CProtocol)];
    [obj gotoCAimControllerWithName:@"业务C" callBack:^{
        NSLog(@"goto 业务C");
    }];
    
}

@end
