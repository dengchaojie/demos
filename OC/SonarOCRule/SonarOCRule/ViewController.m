//
//  ViewController.m
//  SonarOCRule
//
//  Created by hrt03 on 2019/11/29.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    int a = 1;
    if (a) {
//        ...
    }
//    推荐：
    BOOL isE = (a == 1);
    if (isE) {
//        ...
    }
    
}


@end
