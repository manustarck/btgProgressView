//
//  BTGProgressView.m
//  burn_to_give
//
//  Created by Cristóbal Della Maggiora on 23/05/2020.
//  Copyright © 2020 Manuel Luque. All rights reserved.
//

#import "BTGProgressView.h"

@implementation BTGProgressView{
    double padding;
    double pointSize;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    padding = 2.;
    UIView *point = [[UIView alloc] init];
    point.backgroundColor = [UIColor whiteColor];
    point.tag = 1;
    [self addSubview:point];
}

- (void)setProgressViewHeight:(CGFloat)height{
    if (height != _height) {
      _height = height;
      [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_height != 0) {
        [self setCornerRadius];
    }
    
    for (UIView *view in self.subviews){
        if([view isKindOfClass:[UIView class]] && view.tag == 1){
            view.hidden = !_addPoint;
        }
    }
}

- (void)setGradientWithStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = @[ (__bridge id)startColor.CGColor,
                              (__bridge id)endColor.CGColor ];
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);

    UIGraphicsBeginImageContext(gradientLayer.bounds.size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.progressImage = gradientImage;
}

- (void)setCornerRadius{
    self.layer.cornerRadius = _height/2;
    self.clipsToBounds = YES;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.layer.masksToBounds = YES;
        obj.layer.cornerRadius = _height/2;
    }];
    
    for (UIView *view in self.subviews){
        if([view isKindOfClass:[UIView class]] && view.tag == 1){
              view.layer.cornerRadius = (_height - padding*2)/2;
          }
    }
}


- (void)setProgress:(float)progress{    
    double minProgress = _height/self.layer.frame.size.width;
    progress = minProgress + progress*(1 - minProgress);
    [super setProgress:progress];
    
    pointSize = _height - 2*padding;
    for (UIView *view in self.subviews){
          if([view isKindOfClass:[UIView class]]){
              double pointOrigin = self.layer.frame.size.width*progress - pointSize - padding;
              view.frame = CGRectMake(pointOrigin, padding, pointSize, pointSize);
          }
    }
}


@end
