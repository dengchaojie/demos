//
//  BAimViewController.m
//  DemoZuJianHua
//
//  Created by chao jie deng on 2019/11/25.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#import "BAimViewController.h"

@interface BAimViewController ()

@end

@implementation BAimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.purpleColor;
    self.title = self.name;

    if (_callBack) {
        _callBack();
    }
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
