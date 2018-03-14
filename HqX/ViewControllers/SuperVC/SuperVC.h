//
//  SuperVC.h
//  XWF_iOS
//
//  Created by iMac on 15/6/8.
//  Copyright (c) 2015年 xwf_id. All rights reserved.
//

#import <UIKit/UIKit.h>
#define HqDeviceHeight [UIScreen mainScreen].bounds.size.height

#define  IS_NOT_IPHONE_X ((HqDeviceHeight < 812.0f) ? 1 : 0)

#define HqTitleColor [UIColor blackColor]
#define HqTitleFontsize 18

#define HqNavBarColor [UIColor orangeColor]
#define HqBarBtnTintColor [UIColor blackColor]

#define HqShadowHeight 2

@interface SuperVC : UIViewController

@property (nonatomic,strong) UIColor *navbarCorlor;
@property (nonatomic,assign) CGFloat navBarheight;

@property (nonatomic,strong) UILabel *titelLab;

//左侧按钮,默认创建了一个按钮，也可以自己创建
@property (nonatomic,strong) UIButton *leftBtn;
//如果图片存在就设置为图片，不存在就设置为Title
@property (nonatomic,copy) NSString *leftBtnImageName;

//右侧按钮,默认没有创建可以自己创建设置相关属性
@property (nonatomic,strong) UIButton *rightBtn;
//如果图片存在就设置为图片，不存在就设置为Title
@property (nonatomic,copy) NSString *rightBtnImageName;

//这两个属性只能选择其一
//默认为YES,设置NO时隐藏底部线
@property (nonatomic,assign) BOOL isShowBottomLine;
//只要设置了颜色就表示要显示底部线isShowBottomLine会是YES
@property (nonatomic,strong) UIColor *bottomLineColor;

-(void)backClick;
- (void)backToVC:(NSString *)vcName;

@end
