//
//  SecondViewController.m
//  TestSonar
//
//  Created by hrt03 on 2019/12/2.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondModel.h"

#define isViPOS 0

@interface SecondViewController ()

@property (nonatomic, copy) NSString *someStr;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.purpleColor;
//    Misplaced nil check
    NSString *verifyStatus = [[NSUserDefaults standardUserDefaults] objectForKey:@"verifyStatus"];
    //  不推荐示例：
    if ([verifyStatus isEqualToString:@""] || !verifyStatus) {
        NSLog(@"if verifyStatus true");
    } else {
        NSLog(@"if verifyStatus false");
    }
    //  推荐示例：
    BOOL isNil = (verifyStatus == nil);
    BOOL isEmpty = [verifyStatus isEqualToString:@""];
    BOOL result = (isNil || isEmpty);
    if (result == true) {
        NSLog(@"if verifyStatus true");
    } else {
        NSLog(@"if verifyStatus false");
    }
    
//    Bitwise operator in conditional
    NSInteger zero = 0;
    NSInteger one = 1;
    //  不推荐示例：
    if (zero & one) {
        NSLog(@"同真为真");
    } else {
        NSLog(@"其他为假");

    }
    //  推荐示例：
    BOOL result2 = zero & one;//位运算符号：与
    if (result2) {
        NSLog(@"同真为真");
    } else {
        NSLog(@"其他为假");

    }
    
    [self someMethod];
    [self someMethod2];

}

//
- (void)someMethod {
        
//    Collapsible if statements
    NSString *str1 = @"dcj";
    NSString *str2 = @"lpj";
    //  不推荐示例：
    if ([str1 isEqualToString:@"dcj"]) {
        if ([str2 isEqualToString:@"lpj"]) {
            // 双层判断，可以合并为一层
            NSLog(@"isEqualToString true");
        }
    }
    //  推荐示例：
    BOOL isE = [str1 isEqualToString:@"dcj"] && [str2 isEqualToString:@"lpj"];
    if (isE) {
        NSLog(@"isEqualToString true");
    } else {
        NSLog(@"isEqualToString false");

    }

//    Constant if expression
    //  不推荐示例：
    if (isViPOS == 1)  {
        NSLog(@"define constaint isViPOS true");

    } else {
        NSLog(@"define constaint isViPOS false");
    }
    //  推荐示例：
    BOOL result3 = (isViPOS == 1);
    if (result3)  {
        NSLog(@"define constaint isViPOS true");

    } else {
        NSLog(@"define constaint isViPOS false");

    }
    
//    Dead code
//    return;
//    NSLog(@"code will never be excuted");
    

}

- (void)someMethod2 {
//    Broken oddness check
    NSUInteger someInt = 3;
    //  不推荐示例：
    if (someInt%2 ==1 ) {
        NSLog(@"奇数");
    } else {
        NSLog(@"偶数");
    }
    //  推荐示例：
    if (someInt % 2 == 1) {
        NSLog(@"奇数");
    } else {
        NSLog(@"偶数");
    }
    
//    Ivar assignment outside accessors or init
    //  不推荐示例：
    _someStr = @"someStr";
    //  推荐示例：
    self.someStr = @"someStr";
    
    SecondModel *model = SecondModel.new;
    NSLog(@"SecondModel-someName-%@", model.someName);
   
//    Inverted logic
    //  不推荐示例：
    if (_someStr != nil) {
        NSLog(@"反向逻辑判断 true");
    } else {
        NSLog(@"反向逻辑判断 false");
    }
    //  推荐示例：
    if (self.someStr == nil) {
        NSLog(@"正向逻辑判断 true");
    } else {
        NSLog(@"正向逻辑判断 false");
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:true completion:nil];
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
