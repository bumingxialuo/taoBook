//
//  HEEScreeningBtn.m
//  taoBook
//
//  Created by apple7 on 17/3/23.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEScreeningBtn.h"

@implementation HEEScreeningBtn

- (instancetype)init {
    self = [super init];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
//        [self setImage:[self imageWithColor:[UIColor colorWithHexString:@"ffffff"]] forState:UIControlStateNormal];
//        [self setImage:[self imageWithColor:[UIColor colorWithHexString:@"43c248"]] forState:UIControlStateSelected];
        [self setImage:[self imageWithColor:[UIColor colorWithHexString:@"ffffff"]] forState:UIControlStateNormal];
        [self setImage:[self imageWithColor:[UIColor colorWithHexString:@"43c248"]] forState:UIControlStateSelected];
        self.layer.cornerRadius = 4.5;
        self.layer.borderColor = [UIColor colorWithHexString:@"dddddd"].CGColor;
        self.layer.borderWidth = 0.5;
        [self setTitleColor:[UIColor colorWithWhite:1. alpha:1.] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        
    }
    
    return self;
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
