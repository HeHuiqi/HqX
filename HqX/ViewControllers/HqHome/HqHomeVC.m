//
//  HqHomeVC.m
//  HqX
//
//  Created by macpro on 2018/2/6.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import "HqHomeVC.h"
#import "HqHeartAnimation.h"

@interface HqHomeVC ()

@property (nonatomic,strong) HqHeartAnimation *heartView;

@end

@implementation HqHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftBtn.hidden = YES;
    self.title = @"Home";
    [self.view addSubview:self.heartView];
}
- (HqHeartAnimation *)heartView{
    if (!_heartView) {
        _heartView = [[HqHeartAnimation alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width-100, self.view.bounds.size.width)];
    }
   return  _heartView;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
