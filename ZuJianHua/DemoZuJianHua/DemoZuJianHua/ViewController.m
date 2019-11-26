//
//  ViewController.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "ViewController.h"
#import "Mediator+Detail.h"
#import "Mediator+List.h"
#import "DMediator+DAim.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppConfig.shared.isDetailExc = @0;// 后端下发
    [[NSUserDefaults standardUserDefaults] setObject:AppConfig.shared.isDetailExc forKey:@"DetailViewControllerException"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [Mediator gotoDetailViewControllerWithName:@"业务A"];
//    [Mediator gotoBAimControllerWithName:@"业务B" callBack:^{
//        NSLog(@"gotoBAimControllerWithName");
//    }];
    [DMediator gotoDAimController:@"业务D" callBack:^{
        NSLog(@"gotoDAimController");

    }];
}

@end
