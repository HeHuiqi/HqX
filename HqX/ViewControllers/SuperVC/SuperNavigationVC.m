//
//  SuperNavigationVC.m
//  HHQ
//
//  Created by iMac on 15/7/17.
//  Copyright (c) 2015年 HHQ. All rights reserved.
//

//#define NavigationBarColor COLOR(59, 181, 247, 1)

#import "SuperNavigationVC.h"
#import "HqViewControllerAnimated.h"

@interface SuperNavigationVC ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation SuperNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate = self;
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    BOOL isPop = self.viewControllers.count==1 ? NO:YES;
    return isPop;
}
/*
- (void)setNavagationStyle
{
    [[UINavigationBar appearance] setBarTintColor:NavigationBarColor];

    self.navigationBar.barTintColor = NavigationBarColor;
    self.navigationBar.shadowImage = [UIImage new];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationBar.tintColor = [UIColor whiteColor] ;
    self.navigationBar.translucent = NO;

    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    
}
*/
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return [[HqViewControllerAnimated alloc] init];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
