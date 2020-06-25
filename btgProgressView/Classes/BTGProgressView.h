//
//  BTGProgressView.h
//  burn_to_give
//
//  Created by Cristóbal Della Maggiora on 23/05/2020.
//  Copyright © 2020 Manuel Luque. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BTGProgressView : UIProgressView

@property (nonatomic, assign) IBInspectable CGFloat height;
@property (nonatomic, assign) IBInspectable BOOL addPoint;


- (void)setProgressViewHeight:(CGFloat)height;
- (void)setGradientWithStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor;

@end

NS_ASSUME_NONNULL_END
