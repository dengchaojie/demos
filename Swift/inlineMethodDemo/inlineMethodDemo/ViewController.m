//
//  ViewController.m
//  inlineMethodDemo
//
//  Created by hrt03 on 2020/1/23.
//  Copyright © 2020 dengchaojie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self someMethod];
}


- (void)someMethod {
    NSLog(@"someMethod");
//    - (void)inlineMethod {
//        NSLog(@"inlineMethod");
//    }

}


@end
