//
//  ViewController.m
//  DemoDispatchOC
//
//  Created by hrt03 on 2019/11/15.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImage *img;

@end

@implementation ViewController
//https://avatars2.githubusercontent.com/u/13744851?s=400&u=acd2cf709c9b572d6c5a53b1a728a7cba276355c&v=4
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imgV = UIImageView.new;
    [self.view addSubview:imgV];
    self.img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://b-gold-cdn.xitu.io/v3/static/img/45.b99ea03.svg"]]];
    imgV.frame = CGRectMake(100, 100, 100, 100);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        imgV.image = self.img;
    });
    
}



@end
