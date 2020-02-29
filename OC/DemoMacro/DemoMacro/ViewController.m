//
//  ViewController.m
//  DemoMacro
//
//  Created by hrt03 on 2019/11/18.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "ViewController.h"
//#import <CoreText/>
//#import <Asyn>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *someV = UIView.new;
    someV.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:someV];
    someV.backgroundColor = UIColor.whiteColor;
//    someV.clipsToBounds = true;
//    someV.layer.masksToBounds = true;
//
//    UIImageView *imgV = UIImageView.new;
//    UIImage *img = UIImage.new;
//
//    UILabel *label = UILabel.new;
//    ASCornerRoundingTypeDefaultSlowCALayer
//    CALayer *mask = CALayer.new;
//    mask.backgroundColor = UIColor.blackColor.CGColor;
//    mask.frame = someV.bounds;
//    mask.opacity = 0.5;
//    someV.layer.mask = mask;
//    someV.alpha = 0.5;
//    someV.layer.cornerRadius = 10;
//    someV.layer.masksToBounds = true;
    someV.layer.opacity = 0.5;
    CALayer *blueL = CALayer.new;
    blueL.backgroundColor = UIColor.blueColor.CGColor;
    blueL.frame = CGRectMake(0, 0, 200, 100);
    [someV.layer addSublayer:blueL];
    CALayer *orangeL = CALayer.new;
    orangeL.backgroundColor = UIColor.orangeColor.CGColor;
    orangeL.frame = CGRectMake(0, 100, 200, 100);
    [someV.layer addSublayer:orangeL];
    
#if DcjRelease == 1
    NSLog(@"kdkdkdkkdkd");

    
#endif
}


@end
