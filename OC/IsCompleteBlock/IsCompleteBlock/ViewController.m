//
//  ViewController.m
//  IsCompleteBlock
//
//  Created by hrt03 on 2019/12/18.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "ViewController.h"
#import "JudgeCardData.h"

@interface ViewController ()
@property (nonatomic, strong) JudgeCardData *judge;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    JudgeCardData *judge = JudgeCardData.new;
    _judge = judge;
    [_judge judgeCardData:^(BOOL isValid, NSString * _Nonnull msg) {
        if (isValid) {
            
        } else {
            NSLog(@"%@", msg);
        }
    }];
    
    
}


@end
