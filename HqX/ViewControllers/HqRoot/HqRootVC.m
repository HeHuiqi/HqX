//
//  HqRootVC.m
//  HqX
//
//  Created by macpro on 2018/2/6.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import "HqRootVC.h"
#import "HqHomeVC.h"
#import "HqMyVC.h"
#import "SuperNavigationVC.h"
@interface HqRootVC ()

@end

@implementation HqRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initControllers];
}
- (void)initControllers{
    HqHomeVC *home = [[HqHomeVC alloc] init];
    home.title = @"Home";
    SuperNavigationVC *homeNav = [[SuperNavigationVC alloc] initWithRootViewController:home];
    HqMyVC *my = [[HqMyVC alloc] init];
    my.title = @"My";
    SuperNavigationVC *myNav = [[SuperNavigationVC alloc] initWithRootViewController:my];
    
    self.viewControllers = @[homeNav,myNav];
    self.selectedIndex = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
