//
//  UIView+JKSAutoLayoutAdditions.m
//  JKSToolkit
//
//  Created by Johan Sørensen on 6/17/13.
//  Copyright (c) 2013 Johan Sørensen. All rights reserved.
//

#import "UIView+JKSAutoLayoutAdditions.h"

@implementation UIView (JKSAutoLayoutAdditions)

- (void)jks_addVisualConstraintsWithFormat:(NSString *)format views:(NSDictionary *)viewDict
{
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:viewDict]];
}


- (void)jks_addHorizontalCenterConstraintForView:(UIView *)fromView toView:(UIView *)toView
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:fromView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:toView
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0]];
}


- (void)jks_addVerticalCenterConstraintForView:(UIView *)fromView toView:(UIView *)toView
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:fromView
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:toView
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
}

@end
