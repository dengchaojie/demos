//
//  ViewController.m
//  DemoMacro
//
//  Created by hrt03 on 2019/11/18.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#if DcjRelease == 1
    NSLog(@"kdkdkdkkdkd");

    
#endif
}


@end
