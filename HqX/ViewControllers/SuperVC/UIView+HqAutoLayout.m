//
//  UIView+HqAutoLayout.m
//  HqX
//
//  Created by macpro on 2018/2/7.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import "UIView+HqAutoLayout.h"

@implementation UIView (HqAutoLayout)

#pragma mark - top、bottom、left、right

- (NSLayoutConstraint *)topWithView:(UIView *)view2 space:(CGFloat)space{
   NSLayoutConstraint *layout = [self baseWithView:view2 space:space attribute:NSLayoutAttributeTop];
    return layout;
}
- (NSLayoutConstraint *)bottomWithView:(UIView *)view2 space:(CGFloat)space{
    NSLayoutConstraint *layout = [self baseWithView:view2 space:space attribute:NSLayoutAttributeBottom];

    return layout;
}
- (NSLayoutConstraint *)leftWithView:(UIView *)view2 space:(CGFloat)space{
   NSLayoutConstraint *layout = [self baseWithView:view2 space:space attribute:NSLayoutAttributeLeft];

    return layout;
}
- (NSLayoutConstraint *)leftWithViewRight:(UIView *)view2 space:(CGFloat)space{
    NSLayoutConstraint *layout = [self baseWithView:view2 space:space attribute1:NSLayoutAttributeLeft attribute2:NSLayoutAttributeRight];
    
    return layout;
}
- (NSLayoutConstraint *)rightWithView:(UIView *)view2 space:(CGFloat)space{
    NSLayoutConstraint *layout = [self baseWithView:view2 space:space attribute:NSLayoutAttributeRight];

    return layout;
}
#pragma mark - centerX、centerY
- (NSLayoutConstraint *)centerXWithView:(UIView *)view2 space:(CGFloat)space{

    NSLayoutConstraint *layout = [self baseWithView:view2 space:space attribute:NSLayoutAttributeCenterX];

    return layout;
}
- (NSLayoutConstraint *)centerYWithView:(UIView *)view2 space:(CGFloat)space{

    NSLayoutConstraint *layout = [self baseWithView:view2 space:space attribute:NSLayoutAttributeCenterY];

    return layout;
}
- (NSLayoutConstraint *)baseWithView:(UIView *)view2 space:(CGFloat)space attribute:(NSLayoutAttribute)attribute {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    //    view2.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:view2 attribute:attribute multiplier:1.0 constant:space];
    [view2 addConstraint:layout];

    return layout;
}
- (NSLayoutConstraint *)baseWithView:(UIView *)view2 space:(CGFloat)space attribute1:(NSLayoutAttribute)attribute1 attribute2:(NSLayoutAttribute)attribute2{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    //    view2.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self attribute:attribute1 relatedBy:NSLayoutRelationEqual toItem:view2 attribute:attribute2 multiplier:1.0 constant:space];
    [view2 addConstraint:layout];
    
    return layout;
}


#pragma mark - width、height
- (NSLayoutConstraint *)widthEqualView:(UIView *)view{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *layout = [self baseEqualView:view space:0 attribute:NSLayoutAttributeWidth];
    return layout;
}
- (NSLayoutConstraint *)heightEqualView:(UIView *)view{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *layout = [self baseEqualView:view space:0 attribute:NSLayoutAttributeHeight];
    return layout;
}
- (NSLayoutConstraint *)width:(CGFloat)width{
    NSLayoutConstraint *layout = [self baseEqualView:nil space:width attribute:NSLayoutAttributeWidth];
    return layout;
}
- (NSLayoutConstraint *)height:(CGFloat)height{
     NSLayoutConstraint *layout = [self baseEqualView:nil space:height attribute:NSLayoutAttributeHeight];
    return layout;
}
- (void)size:(CGSize)size{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self width:size.width];
    [self height:size.height];
}
- (NSLayoutConstraint *)baseEqualView:(UIView *)view space:(CGFloat)space attribute:(NSLayoutAttribute)attribute{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:NSLayoutRelationEqual toItem:view attribute:attribute multiplier:1.0 constant:space];
    [self addConstraint:layout];
    return layout;
}
@end
