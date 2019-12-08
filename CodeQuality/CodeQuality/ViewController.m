//
//  ViewController.m
//  CodeQuality
//
//  Created by hrt03 on 2019/12/3.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.purpleColor;
    
    void (^animationBlock)(void) = ^(void) {
        self.view.alpha = 0.5;
        NSLog(@"animationBlock");
    };
    void (^completionBlock)(BOOL isCompleted) = ^(BOOL isCompleted) {
        self.view.alpha = 1.0;
        NSLog(@"animate end");
    };
    
//    float duration = 2.0;
//    if (duration > 0) {
//        NSLog(@"animate begin");
//        [UIView animateWithDuration:duration animations:animationBlock completion:completionBlock];
//    } else {
//        NSLog(@"no animation, directly excute");
//        animationBlock();
//        completionBlock(true);
//    }
    
    
    
    
    
}


@end
