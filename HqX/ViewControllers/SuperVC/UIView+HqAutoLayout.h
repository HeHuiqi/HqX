//
//  UIView+HqAutoLayout.h
//  HqX
//
//  Created by macpro on 2018/2/7.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HqAutoLayout)

#pragma mark - top、bottom、left、right
- (NSLayoutConstraint *)topWithView:(UIView *)view2 space:(CGFloat)space;
- (NSLayoutConstraint *)leftWithView:(UIView *)view2 space:(CGFloat)space;
- (NSLayoutConstraint *)rightWithView:(UIView *)view2 space:(CGFloat)space;
- (NSLayoutConstraint *)bottomWithView:(UIView *)view2 space:(CGFloat)space;

- (NSLayoutConstraint *)leftWithViewRight:(UIView *)view2 space:(CGFloat)space;
#pragma mark - centerX、centerY
- (NSLayoutConstraint *)centerXWithView:(UIView *)view2 space:(CGFloat)space;
- (NSLayoutConstraint *)centerYWithView:(UIView *)view2 space:(CGFloat)space;

#pragma mark - width、height
- (NSLayoutConstraint *)widthEqualView:(UIView *)view;
- (NSLayoutConstraint *)heightEqualView:(UIView *)view;
- (NSLayoutConstraint *)width:(CGFloat)width;
- (NSLayoutConstraint *)height:(CGFloat)height;
- (void)size:(CGSize)size;

@end
