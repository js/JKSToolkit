//
//  UIView+JKSAutoLayoutAdditions.h
//  JKSToolkit
//
//  Created by Johan Sørensen on 6/17/13.
//  Copyright (c) 2013 Johan Sørensen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JKSAutoLayoutAdditions)

- (void)jks_addVisualConstraintsWithFormat:(NSString *)format views:(NSDictionary *)viewDict;
- (void)jks_addHorizontalCenterConstraintForView:(UIView *)fromView toView:(UIView *)toView;
- (void)jks_addVerticalCenterConstraintForView:(UIView *)fromView toView:(UIView *)toView;

@end
