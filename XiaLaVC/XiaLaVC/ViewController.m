//
//  ViewController.m
//  XiaLaVC
//
//  Created by 喵了个咪 on 2019/2/11.
//  Copyright © 2019年 dcj. All rights reserved.
//

#import "ViewController.h"

#define screenHeight (UIScreen.mainScreen.bounds.size.height)
#define screenWidth (UIScreen.mainScreen.bounds.size.width)

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTB;
@property (strong, nonatomic) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _scrollView = UIScrollView.new;
    [self.view addSubview:_scrollView];
    _scrollView.delegate = self;
    _scrollView.frame = self.view.bounds;
    _scrollView.contentSize = CGSizeMake(screenWidth, screenHeight + 10);
    _scrollView.backgroundColor = UIColor.whiteColor;
    _scrollView.showsVerticalScrollIndicator = NO;
    UILabel *lb = UILabel.new;
    [_scrollView addSubview:lb];
    lb.text = @"拍一个视频动态";
    lb.frame = CGRectMake(0, 200, screenWidth, 40);
    lb.textAlignment = NSTextAlignmentCenter;
    
    
    
//    self.myTB.contentSize = CGSizeMake(screenWidth, screenHeight);
//    if (@available(iOS 11.0, *)) {
//        self.myTB.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    }else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//
//    }
    
    [self.view bringSubviewToFront:_myTB];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = true;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerV = UIView.new;
    headerV.bounds = CGRectMake(0, 0, screenWidth, 44);
    
    UIButton *btn = UIButton.new;
    [btn setTitle:@"拍照" forState:(UIControlStateNormal)];
    [btn setTitleColor:UIColor.blueColor forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(screenWidth - 44, 0, 44, 44);
    [headerV addSubview:btn];
    return headerV;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    CGPoint offset = scrollView.contentOffset;
    if (scrollView == _scrollView) {
        if (offset.y > 10) {

            [UIView animateKeyframesWithDuration:0.5 delay:0 options:(UIViewKeyframeAnimationOptionCalculationModeLinear) animations:^{
                self.tabBarController.tabBar.alpha = 1;
                self.myTB.frame = CGRectMake(0, 0, screenWidth, screenHeight);
            } completion:^(BOOL finished) {
                
            }];
        }
    }else
    {
        if (offset.y < - 44) {
            [UIView animateKeyframesWithDuration:0.5 delay:0 options:(UIViewKeyframeAnimationOptionCalculationModeLinear) animations:^{
                self.myTB.frame = CGRectMake(0, screenHeight, screenWidth, screenHeight);
                self.tabBarController.tabBar.alpha = 0;

            } completion:^(BOOL finished) {
            }];


        }
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
