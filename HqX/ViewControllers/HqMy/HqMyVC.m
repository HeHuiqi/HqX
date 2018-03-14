//
//  HqMyVC.m
//  HqX
//
//  Created by macpro on 2018/2/6.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import "HqMyVC.h"
#import "HqMyInfoVC.h"
#import "UIView+HqAutoLayout.h"
#import "HqHomeVC.h"
@interface HqMyVC ()

@end

@implementation HqMyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MyCenter";
    self.leftBtnImageName = @"返回";

    
    UILabel *lab = [[UILabel alloc] init];
    [self.view addSubview:lab];
    lab.text = @"点击屏幕进入继续";
    [lab centerXWithView:self.view space:0];
    [lab centerYWithView:self.view space:0];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.navigationController.viewControllers.count>2) {
        HqHomeVC *myInfo = [[HqHomeVC alloc] init];
        myInfo.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myInfo animated:YES];
    }else{
        HqMyInfoVC *myInfo = [[HqMyInfoVC alloc] init];
        myInfo.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myInfo animated:YES];
    }
   
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
