//
//  JudgeCardData.h
//  IsCompleteBlock
//
//  Created by hrt03 on 2019/12/18.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JudgeCardData : NSObject


- (void)judgeCardData:(void (^)(BOOL isValid, NSString *msg))complete;

@end

NS_ASSUME_NONNULL_END
