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
@property (nonatomic,strong) UIImage *origalBottomImage;

@end

@implementation SuperVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navbarCorlor = HqNavBarColor;
    
    [self titelLab];
    self.isShowBottomLine = YES;
    [self origalBottomImage];

    self.leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.leftBtnImageName = @"返回";
    self.leftBtn.tintColor = HqBarBtnTintColor;
    self.leftBtn.frame = CGRectMake(0, 0, 50, 44);
    self.leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.navigationItem.leftBarButtonItem = [self barItemWithView:self.leftBtn];
    //当导航控制器的的控制器数为0即根控制器时，隐藏返回键
    if (self.navigationController.viewControllers.count==1) {
        self.leftBtn.hidden = YES;
    }
}
- (void)setTitle:(NSString *)title{
    _titelLab.text = title;
    [_titelLab sizeToFit];
    [super setTitle:title];
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

#pragma mark - left、right按钮相关
- (void)setLeftBtn:(UIButton *)leftBtn{
    if (leftBtn) {
        _leftBtn = leftBtn;
    }
    [_leftBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setLeftBtnImageName:(NSString *)leftBtnImageName{

    NSString *fielPath = [[NSBundle mainBundle] pathForResource:leftBtnImageName ofType:@"png"];
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:fielPath]) {
        UIImage *image = [UIImage imageNamed:leftBtnImageName];
        [_leftBtn setImage:image forState:UIControlStateNormal];
    }else{
        [_leftBtn setTitle:leftBtnImageName forState:UIControlStateNormal];
    }
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
    
    NSString *fielPath = [[NSBundle mainBundle] pathForResource:rightBtnImageName ofType:@"png"];
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:fielPath]) {
        UIImage *image = [UIImage imageNamed:rightBtnImageName];
        [_rightBtn setImage:image forState:UIControlStateNormal];
    }else{
        [_rightBtn setTitle:rightBtnImageName forState:UIControlStateNormal];
    }
}
#pragma mark - 返回事件
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

#pragma mark - 这里处理在切换controller时导航条的变化
- (void)viewWillAppear:(BOOL)animated{

    [self viewControllerReset];
    
    [super viewWillAppear:animated];
}
- (void)viewControllerReset{
    
    //获取上一个导航的状态然后重新赋值
    self.navbarCorlor = self.navbarCorlor;
    self.isShowBottomLine = self.isShowBottomLine;
}
#pragma mark - NavBar
- (CGFloat )navBarheight{
    BOOL device = IS_NOT_IPHONE_X;
    CGFloat barHeight = 64;
    if (!device) {
        barHeight = 88;
    }
    return barHeight;
}
- (void)setNavbarCorlor:(UIColor *)navbarCorlor{
    _navbarCorlor = navbarCorlor;
    self.navigationController.navigationBar.barTintColor = _navbarCorlor;
}
#pragma mark - NavBarBottomLine

- (UIImage *)origalBottomImage{
    //这里只能执行一次因为改变完shadowImage后在次获取就是自定义的shadowImage了
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_origalBottomImage) {
            _origalBottomImage = self.navigationController.navigationBar.shadowImage;
        }
    });
    return _origalBottomImage;
}

- (void)setIsShowBottomLine:(BOOL)isShowBottomLine{
    _isShowBottomLine = isShowBottomLine;
    if (_isShowBottomLine) {
        [self.navigationController.navigationBar setShadowImage:self.bottomLineImage];
    }else{
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
}
- (void)setBottomLineColor:(UIColor *)bottomLineColor{
    _bottomLineColor = bottomLineColor;
    
    UIImage *image = [self createImageWithColor:_bottomLineColor];
    if (image) {
        self.bottomLineImage = image;
        
    }else{
        self.bottomLineImage = self.origalBottomImage;
        
    }
    self.isShowBottomLine = YES;
}
- (void)setBottomLineImage:(UIImage *)bottomLineImage{
    _bottomLineImage = bottomLineImage;
}
- (UIImage*) createImageWithColor: (UIColor*) color
{
    if (color) {
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
    return nil;
    
}

@end
