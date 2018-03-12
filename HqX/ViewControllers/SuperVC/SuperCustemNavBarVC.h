//
//  SuperCustemNavBarVC.h
//  HqX
//
//  Created by macpro on 2018/3/12.
//  Copyright © 2018年 macpro. All rights reserved.
//隐藏系统导航条

#import <UIKit/UIKit.h>
#define HqDeviceHeight [UIScreen mainScreen].bounds.size.height

#define  IS_NOT_IPHONE_X ((HqDeviceHeight < 812.0f) ? 1 : 0)

#define HqTitleColor [UIColor blackColor]
#define HqTitleFontsize 18

#define HqNavBarColor [UIColor orangeColor]
#define HqBarBtnTintColor [UIColor blackColor]

#define HqShadowHeight 2
@interface SuperCustemNavBarVC : UIViewController

@property (nonatomic,strong) UIView *navBarView;
@property (nonatomic,assign) CGFloat navBarheight;
@property (nonatomic,strong) UILabel *titelLab;
@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,copy) NSString *leftBtnImageName;

@property (nonatomic,strong) UIButton *rightBtn;
@property (nonatomic,copy) NSString *rightBtnImageName;

@property (nonatomic,assign) BOOL isShowBottomLine;
@property (nonatomic,strong) UIView *bottomLine;

@property (nonatomic,strong) UIBezierPath *shadowPath;

@end
