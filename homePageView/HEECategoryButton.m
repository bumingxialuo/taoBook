//
//  HEECategoryButton.m
//  taoBook
//
//  Created by apple7 on 17/3/18.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEECategoryButton.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>


@implementation HEECategoryButton

-(instancetype) init {
    
    if (self) {
        [self settingBtnStyle];
    }
    
    return self;
}

-(void)settingBtnStyle {
    
    self.layer.cornerRadius = 5.;
    self.layer.masksToBounds = YES;
    [self setBackgroundImage:[self imageWithColor:[UIColor colorWithHexString:@"43c248"]] forState:UIControlStateSelected];
    [self setBackgroundImage:[self imageWithColor:[UIColor colorWithHexString:@"f1f1f1"]] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHexString:@"ffffff"] forState:UIControlStateSelected];
    [self setTitleColor:[UIColor colorWithHexString:@"919191"] forState:UIControlStateNormal];
    
    self.width = ([UIScreen mainScreen].bounds.size.width - 56) / 3;
    self.height = 32.;
}

//将颜色转为图片
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
