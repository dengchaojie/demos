//
//  BugsViewController.m
//  TestSonar
//
//  Created by hrt03 on 2019/12/4.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "BugsViewController.h"
#import <Foundation/Foundation.h>

@interface BugsViewController ()

@end

@implementation BugsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUInteger param = 1;
    if (param == 1)
      NSLog(@"== 1");
    else if (param == 2)
        NSLog(@"== 2");
    else if (param == 1)  // Noncompliant
        NSLog(@"again == 1");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
