//
//  HomeView.m
//  XcodeRefactor
//
//  Created by hrt03 on 2019/12/17.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

#import "HomeView.h"

@implementation HomeView


- (void)setFrameForSubviews {
    NSInteger count = [self.subviews count];
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        
        btn.tag = i;
        
        CGFloat x = i * self.bounds.size.width / count;
        CGFloat y = 0;
        CGFloat width = self.bounds.size.width / count;
        CGFloat height = self.bounds.size.height;
        
        btn.frame = CGRectMake(x, y, width, height);
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setFrameForSubviews];
}

@end
