//
//  SuperVC.m
//  HHQ
//
//  Created by iMac on 15/6/8.
//  Copyright (c) 2015年 HHQ. All rights reserved.
//

#import "SuperVC.h"
#import "Masonry.h"
#import "UIView+HqAutoLayout.h"

@interface SuperVC ()

@property (nonatomic,strong) UIImage *bottomLineImage;

@end

@implementation SuperVC

- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGFloat height = 1.0/[UIScreen mainScreen].scale;
    CGRect rect=CGRectMake(0,0, 1, height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
- (void)setBottomLineColor:(UIColor *)bottomLineColor{
    _bottomLineColor = bottomLineColor;
}

- (UIImage *)bottomLineImage{
    if (!_isShowBottomLine) {
       
        _bottomLineImage = [self createImageWithColor:self.bottomLineColor];
    }
    return _bottomLineImage;
  
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;

    [self titelLab];
    self.bottomLineColor = [UIColor colorWithRed:197.0/255.0 green:197.0/255.0 blue:200.0/255.0 alpha:1];
    self.isShowBottomLine = YES;

    self.leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.leftBtnImageName = nil;
    self.leftBtn.tintColor = HqBarBtnTintColor;
    self.leftBtn.frame = CGRectMake(0, 0, 50, 44);
    self.leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.leftBtn.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.leftBtn.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.navigationItem.leftBarButtonItem = [self barItemWithView:self.leftBtn];
 
    self.navbarCorlor = HqNavBarColor;
//    self.navigationController.navigationBar.barTintColor = self.navbarCorlor;
    

   
}
- (UILabel *)titelLab{
    if (!_titelLab) {
        _titelLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
        _titelLab.textAlignment = NSTextAlignmentCenter;
        _titelLab.textColor = HqTitleColor;
        _titelLab.font = [UIFont boldSystemFontOfSize:HqTitleFontsize];
        self.navigationItem.titleView = _titelLab;
        
       
    }
    return _titelLab;
}
- (void)setLeftBtn:(UIButton *)leftBtn{
    if (leftBtn) {
        _leftBtn = leftBtn;
    }
    [_leftBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setLeftBtnImageName:(NSString *)leftBtnImageName{

    UIImage * image = nil;
    if (leftBtnImageName.length > 0) {
        image = [UIImage imageNamed:leftBtnImageName];
        [_leftBtn setImage:image forState:UIControlStateNormal];

    }else{
        [_leftBtn setTitle:leftBtnImageName forState:UIControlStateNormal];
    }
    [_leftBtn setTitle:leftBtnImageName forState:UIControlStateNormal];

}

- (void)setRightBtn:(UIButton *)rightBtn{
    _rightBtn = rightBtn;
    if (rightBtn) {
        [_rightBtn removeFromSuperview];
        _rightBtn = rightBtn;
        self.navigationItem.rightBarButtonItem = [self barItemWithView:_rightBtn];
    }
}
- (UIBarButtonItem *)barItemWithView:(UIView *)view{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    return item;
}
- (void)setRightBtnImageName:(NSString *)rightBtnImageName{
    
    UIImage *image = [UIImage imageNamed:rightBtnImageName];
    
    [_rightBtn setImage:image forState:UIControlStateNormal];
}
- (void)setTitle:(NSString *)title{
    _titelLab.text = title;
    [_titelLab sizeToFit];

    [super setTitle:title];

}
- (CGFloat )navBarheight{
    BOOL device = IS_NOT_IPHONE_X;
    CGFloat barHeight = 64;
    if (!device) {
        barHeight = 88;
    }
    return barHeight;
}

#pragma mark - BottomLine
- (void)setIsShowBottomLine:(BOOL)isShowBottomLine{
    _isShowBottomLine = isShowBottomLine;
    if (_isShowBottomLine) {
        [self.navigationController.navigationBar setShadowImage:self.bottomLineImage];
    }else{
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
}
-(void)backClick
{
    if (self.navigationController.viewControllers.count>0) {
        [self.view endEditing:YES];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)backToVC:(NSString *)vcName{
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    for (UIViewController *vc in viewControllers) {
        if ([vc isKindOfClass:NSClassFromString(vcName)]) {
            [self.navigationController popToViewController:vc animated:YES];
            break;
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated{
    SuperVC *vc = (SuperVC *)[self.navigationController.viewControllers lastObject];
    if (vc.isShowBottomLine) {
        [self.navigationController.navigationBar setShadowImage:self.bottomLineImage];
    }else{
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
    vc.navbarCorlor = vc.navbarCorlor;
    [super viewWillAppear:animated];

}
- (void)setNavbarCorlor:(UIColor *)navbarCorlor{
    _navbarCorlor = navbarCorlor;
    if (_navbarCorlor) {
        self.navigationController.navigationBar.barTintColor = _navbarCorlor;
    }
}

@end
