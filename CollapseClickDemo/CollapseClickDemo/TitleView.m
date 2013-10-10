//
//  TitleView.m
//  CollapseClickDemo
//
//  Created by rachel parsons on 10/10/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();

    //draw the gradient background
    UIColor *top = [UIColor colorWithRed:91.0/255.0 green:104.0/255.0 blue:148.0/255.0 alpha:1];
    UIColor *bottom = [UIColor colorWithRed:80.0/255.0 green:92.0/255.0 blue:136.0/255.0 alpha:1];
    NSArray *gradientColors = @[(id)top.CGColor, (id)bottom.CGColor];
    CGFloat gradientLocations[] = {0,0.5,1};

    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));

    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
}
@end
