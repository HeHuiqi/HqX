//
//  HqHeartAnimation.m
//  HqX
//
//  Created by macpro on 2018/3/7.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import "HqHeartAnimation.h"

@implementation HqHeartAnimation


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.frame = self.bounds;
    [self.layer addSublayer:lineLayer];
    lineLayer.lineWidth = 1;
    lineLayer.strokeColor = [UIColor purpleColor].CGColor;
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat y = height/2.0;
    CGFloat h = height/4.0;
    CGFloat sinX = width*0.3;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, y)];
    
    for (int x = 0;x<width; x++) {

        int x1 = x - sinX;
         x1 = abs((360-x)) ;

        NSLog(@"x1==%d",x1);
        y = -h*sin(360/180.0*M_PI)+height/2.0;

        
        [path addLineToPoint:CGPointMake(x, y)];
        
    }
    lineLayer.path = path.CGPath;
    
}


@end
