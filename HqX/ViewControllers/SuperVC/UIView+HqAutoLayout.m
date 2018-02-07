//
//  UIView+HqAutoLayout.m
//  HqX
//
//  Created by macpro on 2018/2/7.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import "UIView+HqAutoLayout.h"

@implementation UIView (HqAutoLayout)

- (NSLayoutConstraint *)topWithView:(UIView *)view2 space:(CGFloat)space{
    self.translatesAutoresizingMaskIntoConstraints = NO;
//    view2.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeTop multiplier:1.0 constant:space];
    [view2 addConstraint:layout];

    return layout;
}
- (NSLayoutConstraint *)bottomWithView:(UIView *)view2 space:(CGFloat)space{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    //    view2.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:space];
    [view2 addConstraint:layout];
    return layout;
}
- (NSLayoutConstraint *)leftWithView:(UIView *)view2 space:(CGFloat)space{
    self.translatesAutoresizingMaskIntoConstraints = NO;
//    view2.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeLeft multiplier:1.0 constant:space];
    [view2 addConstraint:layout];
    return layout;
}
- (NSLayoutConstraint *)rightWithView:(UIView *)view2 space:(CGFloat)space{
    self.translatesAutoresizingMaskIntoConstraints = NO;
//    view2.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeRight multiplier:1.0 constant:space];
    [view2 addConstraint:layout];
    return layout;
}

- (NSLayoutConstraint *)centerXWithView:(UIView *)view2 space:(CGFloat)space{
    self.translatesAutoresizingMaskIntoConstraints = NO;
//    view2.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:space];
    [view2 addConstraint:layout];
    return layout;
}
- (NSLayoutConstraint *)centerYWithView:(UIView *)view2 space:(CGFloat)space{
    self.translatesAutoresizingMaskIntoConstraints = NO;
//    view2.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:space];
    [view2 addConstraint:layout];

    return layout;
}
- (NSLayoutConstraint *)width:(CGFloat)width{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:width];
    [self addConstraint:layout];
    return layout;
}
- (NSLayoutConstraint *)height:(CGFloat)width{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:width];
    [self addConstraint:layout];
    return layout;
}
- (void)size:(CGSize)size{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self width:size.width];
    [self height:size.height];
}
@end
