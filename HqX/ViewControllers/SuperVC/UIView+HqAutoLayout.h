//
//  UIView+HqAutoLayout.h
//  HqX
//
//  Created by macpro on 2018/2/7.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HqAutoLayout)

- (NSLayoutConstraint *)topWithView:(UIView *)view2 space:(CGFloat)space;

- (NSLayoutConstraint *)leftWithView:(UIView *)view2 space:(CGFloat)space;

- (NSLayoutConstraint *)rightWithView:(UIView *)view2 space:(CGFloat)space;

- (NSLayoutConstraint *)bottomWithView:(UIView *)view2 space:(CGFloat)space;

- (NSLayoutConstraint *)centerXWithView:(UIView *)view2 space:(CGFloat)space;

- (NSLayoutConstraint *)centerYWithView:(UIView *)view2 space:(CGFloat)space;


- (NSLayoutConstraint *)width:(CGFloat)width;
- (NSLayoutConstraint *)height:(CGFloat)widt;
- (void)size:(CGSize)size;

@end
