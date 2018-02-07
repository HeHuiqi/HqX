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

@end

@implementation SuperVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.navBarView];
    self.navBarView.backgroundColor  = HqNavBarColor;
    [self titelLab];
 

    self.leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.leftBtnImageName = nil;
    self.leftBtn.tintColor = HqBarBtnTintColor;
    
   
}
- (UILabel *)titelLab{
    if (!_titelLab) {
        _titelLab = [[UILabel alloc]init];
        _titelLab.textColor = HqTitleColor;
        _titelLab.font = [UIFont boldSystemFontOfSize:HqTitleFontsize];
        [self.navBarView addSubview:_titelLab];
        /*
        [_titelLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.navBarView.mas_centerX);
//            make.left.equalTo(self.navBarView).offset(kZoomValue(50));
            make.bottom.equalTo(_navBarView).offset(0);
            make.height.mas_equalTo(44);
        }];*/

        _titelLab.translatesAutoresizingMaskIntoConstraints = NO;
        [_titelLab bottomWithView:self.navBarView space:0];
        [_titelLab centerXWithView:self.navBarView space:0];
        [_titelLab height:44];
        
    }
    return _titelLab;
}
- (void)setLeftBtn:(UIButton *)leftBtn{
    if (leftBtn) {
        [_leftBtn removeFromSuperview];
        _leftBtn = leftBtn;
        [self.navBarView addSubview:_leftBtn];
    }
    self.leftBtn.tintColor = [UIColor whiteColor];

    [_leftBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    /*
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_navBarView).offset(0);
        make.bottom.equalTo(_navBarView).offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 44));
    }];
    */
    [_leftBtn leftWithView:self.navBarView space:0];
    [_leftBtn bottomWithView:self.navBarView space:0];
    [_leftBtn size:CGSizeMake(50, 44)];
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
        [self.navBarView addSubview:_rightBtn];
    }
    /*
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_navBarView).offset(0);
        make.bottom.equalTo(_navBarView).offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 44));
    }];
    */
    [_rightBtn rightWithView:self.navBarView space:0];
    [_rightBtn bottomWithView:self.navBarView space:0];
    [_rightBtn size:CGSizeMake(50, 44)];
}

- (void)setRightBtnImageName:(NSString *)rightBtnImageName{
    
    UIImage *image = [UIImage imageNamed:rightBtnImageName];
    
    [_rightBtn setImage:image forState:UIControlStateNormal];
}
- (void)setTitle:(NSString *)title{
    [super setTitle:title];
    _titelLab.text = title;
}
-(UIView *)navBarView{
    if (!_navBarView) {
        BOOL device = IS_NOT_IPHONE_X;
        CGFloat barHeight = 64;
        if (!device) {
            barHeight = 88;
        }
        self.navBarheight = barHeight;
        _navBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.navBarheight)];
        _navBarView.backgroundColor = [UIColor whiteColor];
    }
    
   

    return _navBarView;
}
- (UIBezierPath *)shadowPath{
    if(!_shadowPath){
    _navBarView.layer.shadowColor = [UIColor redColor].CGColor;
    _navBarView.layer.shadowOpacity = 1.0;
    _navBarView.layer.shadowOffset = CGSizeMake(_navBarView.bounds.size.width, HqShadowHeight);
    CGFloat shadowHeight = HqShadowHeight;
    UIBezierPath *shadowdPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, _navBarView.bounds.size.height+shadowHeight, _navBarView.bounds.size.width, shadowHeight)];
        _shadowPath = shadowdPath;
    }
    return _shadowPath;
}
- (void)setIsShowBottomLine:(BOOL)isShowBottomLine{
    _isShowBottomLine = isShowBottomLine;
    
    if (_isShowBottomLine) {
        UIView *xline = [[UIView alloc] init];
        xline.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_navBarView addSubview:xline];
        /*
        [xline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_navBarView).offset(0);
            make.left.equalTo(self.view).offset(0);
            make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 0.5));
        }];
        */
        [xline bottomWithView:self.navBarView space:0];
        [xline leftWithView:self.navBarView space:0];
        [xline size:CGSizeMake(self.view.bounds.size.width, 0.5)];
        _bottomLine = xline;
    }
}

-(void)backClick
{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
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

@end
