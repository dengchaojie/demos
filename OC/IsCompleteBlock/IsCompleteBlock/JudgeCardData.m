//
//  JudgeCardData.m
//  IsCompleteBlock
//
//  Created by hrt03 on 2019/12/18.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "JudgeCardData.h"

@implementation JudgeCardData



- (void)judgeCardData:(void (^)(BOOL, NSString *))complete {
    
    NSString *one = @"";
    if ([one isEqualToString:@"1"]) {
        complete(NO, @"equal 1");
    }
    NSLog(@"do not equal 1");
    NSString *two = @"2";
    if ([two isEqualToString:@"2"]) {
        complete(NO, @"equal 2");
    }
    NSLog(@"do not equal 2");

    
}
@end
