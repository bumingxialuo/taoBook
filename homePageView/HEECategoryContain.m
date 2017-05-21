//
//  HEECategoryContain.m
//  taoBook
//
//  Created by apple7 on 17/3/18.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEECategoryContain.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>
#import "HEECategoryButton.h"

@interface HEECategoryContain()



@end

@implementation HEECategoryContain

- (instancetype)init {
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1. alpha:0.35];
        [self settingContainViewStyle];
    }
    return self;
}

- (void)settingContainViewStyle {
    UIView *cateTitltFormatView = [[UIView alloc] init];
    self.cateTitltFormatView = cateTitltFormatView;
    cateTitltFormatView.backgroundColor = [UIColor colorWithHexString:@"#43c248"];
    cateTitltFormatView.width = 10;
    cateTitltFormatView.height = 18;
    
    UILabel *cateTiltleLabel = [[UILabel alloc] init];
    self.cateTiltleLabel = cateTiltleLabel;
    cateTiltleLabel.textColor = [UIColor colorWithHexString:@"#323232"];
    cateTiltleLabel.textAlignment = NSTextAlignmentLeft;
    cateTiltleLabel.font = [UIFont systemFontOfSize:18];
    cateTiltleLabel.width = 75;
    cateTiltleLabel.height = 18;
    
    [self sd_addSubviews:@[cateTitltFormatView, cateTiltleLabel]];
    
    cateTitltFormatView.sd_layout
    .topSpaceToView(self, 20)
    .leftSpaceToView(self, 8);
    
    cateTiltleLabel.sd_layout
    .topSpaceToView(self, 20)
    .leftSpaceToView(cateTitltFormatView, 8);

}

@end
