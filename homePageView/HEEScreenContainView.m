//
//  HEEScreenContainView.m
//  taoBook
//
//  Created by apple7 on 17/3/23.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEScreenContainView.h"
#import "HEEScreeningBtn.h"
#import <UIView+SDAutoLayout.h>

@implementation HEEScreenContainView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self layoutScreenSubView];

    }
    return self;
}

- (void)layoutScreenSubView {
    
//    UIImageView *conditionsBGIMG = [[UIImageView alloc] init];//345*154  154 = 4*18 + 5*16 345 = 4*75 + 5*9
//    conditionsBGIMG.image = [UIImage imageNamed:@"sjsc_screen_bg"];
    
    self.backgroundColor = [UIColor colorWithWhite:0.25 alpha:0.75];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"书籍分类";
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor colorWithHexString:@"676767"];
    label1.textAlignment = NSTextAlignmentLeft;
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"适合人群";
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = [UIColor colorWithHexString:@"676767"];
    label2.textAlignment = NSTextAlignmentLeft;
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = @"出售类别";
    label3.font = [UIFont systemFontOfSize:14];
    label3.textColor = [UIColor colorWithHexString:@"676767"];
    label3.textAlignment = NSTextAlignmentLeft;
    
    HEEScreeningBtn *btn11 = [[HEEScreeningBtn alloc] init];
    btn11.titleLabel.text = @"全部分类";
    [btn11 setTitle:@"全部分类" forState:UIControlStateNormal];
    btn11.tag = 11;
    [btn11 addTarget:self action:@selector(bookCateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn12 = [[HEEScreeningBtn alloc] init];
    btn12.titleLabel.text = @"考试类";
    [btn12 setTitle:@"考试类" forState:UIControlStateNormal];
    btn12.tag = 12;
    [btn12 addTarget:self action:@selector(bookCateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn13 = [[HEEScreeningBtn alloc] init];
    btn13.titleLabel.text = @"英语";
    [btn13 setTitle:@"英语" forState:UIControlStateNormal];
    btn13.tag = 13;
    [btn13 addTarget:self action:@selector(bookCateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn14 = [[HEEScreeningBtn alloc] init];
    btn14.titleLabel.text = @"文学/小说";
    [btn14 setTitle:@"文学/小说" forState:UIControlStateNormal];
    btn14.tag = 14;
    [btn14 addTarget:self action:@selector(bookCateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn15 = [[HEEScreeningBtn alloc] init];
    btn15.titleLabel.text = @"IT/工业";
    [btn15 setTitle:@"IT/工业" forState:UIControlStateNormal];
    btn15.tag = 15;
    [btn15 addTarget:self action:@selector(bookCateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn16 = [[HEEScreeningBtn alloc] init];
    btn16.titleLabel.text = @"经济/管理";
    [btn16 setTitle:@"经济／管理" forState:UIControlStateNormal];
    btn16.tag = 16;
    [btn16 addTarget:self action:@selector(bookCateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn17 = [[HEEScreeningBtn alloc] init];
    btn17.titleLabel.text = @"其它";
    [btn17 setTitle:@"其它" forState:UIControlStateNormal];
    btn17.tag = 17;
    [btn17 addTarget:self action:@selector(bookCateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn21 = [[HEEScreeningBtn alloc] init];
    btn21.titleLabel.text = @"不限";
    [btn21 setTitle:@"不限" forState:UIControlStateNormal];
    btn21.tag = 21;
    [btn21 addTarget:self action:@selector(personSuiteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn22 = [[HEEScreeningBtn alloc] init];
    btn22.titleLabel.text = @"教材资料";
    [btn22 setTitle:@"教材资料" forState:UIControlStateNormal];
    btn22.tag = 22;
    [btn22 addTarget:self action:@selector(personSuiteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn23 = [[HEEScreeningBtn alloc] init];
    btn23.titleLabel.text = @"课外";
    [btn23 setTitle:@"课外" forState:UIControlStateNormal];
    btn23.tag = 23;
    [btn23 addTarget:self action:@selector(personSuiteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn31 = [[HEEScreeningBtn alloc] init];
    btn31.titleLabel.text = @"不限";
    [btn31 setTitle:@"不限" forState:UIControlStateNormal];
    btn31.tag = 31;
    [btn31 addTarget:self action:@selector(cateSaleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn32 = [[HEEScreeningBtn alloc] init];
    btn32.titleLabel.text = @"出售";
    [btn32 setTitle:@"出售" forState:UIControlStateNormal];
    btn32.tag = 32;
    [btn32 addTarget:self action:@selector(cateSaleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    HEEScreeningBtn *btn33 = [[HEEScreeningBtn alloc] init];
    btn33.titleLabel.text = @"出借";
    [btn33 setTitle:@"出借" forState:UIControlStateNormal];
    btn33.tag = 33;
    [btn33 addTarget:self action:@selector(cateSaleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self sd_addSubviews:@[conditionsBGIMG]];
    [self sd_addSubviews:@[label1,label2,label3,btn11,btn12,btn13,btn14,btn15,btn16,btn17,btn21,btn22,btn23,btn31,btn32,btn33]];
    
//    conditionsBGIMG.sd_layout.topSpaceToView(self,0).leftSpaceToView(self,0).rightSpaceToView(self,0).bottomSpaceToView(self,0);
    
    label1.sd_layout.topSpaceToView(self, 16).leftSpaceToView(self,9).widthIs(75).heightIs(18);
    btn11.sd_layout.centerYEqualToView(label1).leftSpaceToView(label1,9).widthIs(75).heightIs(18);
    btn12.sd_layout.centerYEqualToView(label1).leftSpaceToView(btn11,9).widthIs(75).heightIs(18);
    btn13.sd_layout.centerYEqualToView(label1).leftSpaceToView(btn12,9).widthIs(75).heightIs(18);
    
    btn14.sd_layout.topSpaceToView(label1, 16).leftSpaceToView(self,9).widthIs(75).heightIs(18);
    btn15.sd_layout.centerYEqualToView(btn14).leftSpaceToView(btn14,9).widthIs(75).heightIs(18);
    btn16.sd_layout.centerYEqualToView(btn14).leftSpaceToView(btn15,9).widthIs(75).heightIs(18);
    btn17.sd_layout.centerYEqualToView(btn14).leftSpaceToView(btn16,9).widthIs(75).heightIs(18);
    
    label2.sd_layout.topSpaceToView(btn14, 16).leftSpaceToView(self,9).widthIs(75).heightIs(18);
    btn21.sd_layout.centerYEqualToView(label2).leftSpaceToView(label2,9).widthIs(75).heightIs(18);
    btn22.sd_layout.centerYEqualToView(label2).leftSpaceToView(btn21,9).widthIs(75).heightIs(18);
    btn23.sd_layout.centerYEqualToView(label2).leftSpaceToView(btn22,9).widthIs(75).heightIs(18);
    
    label3.sd_layout.topSpaceToView(label2, 16).leftSpaceToView(self,9).widthIs(75).heightIs(18);
    btn31.sd_layout.centerYEqualToView(label3).leftSpaceToView(label3,9).widthIs(75).heightIs(18);
    btn32.sd_layout.centerYEqualToView(label3).leftSpaceToView(btn31,9).widthIs(75).heightIs(18);
    btn33.sd_layout.centerYEqualToView(label3).leftSpaceToView(btn32,9).widthIs(75).heightIs(18);
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


- (void)bookCateBtnClick: (UIButton *)btn {
    switch (btn.tag) {
        case 11:
            NSLog(@"全部分类");
            break;
        case 12:
            NSLog(@"考试类");
            break;
        case 13:
            NSLog(@"英语");
            break;
        case 14:
            NSLog(@"文学／小说");
            break;
        case 15:
            NSLog(@"IT/工业");
            break;
        case 16:
            NSLog(@"经济／管理");
            break;
        case 17:
            NSLog(@"其它");
            break;
            
        default:
            break;
    }
}

- (void)cateSaleBtnClick: (UIButton *)btn {
    switch (btn.tag) {
        case 31:
            NSLog(@"不限");
            break;
        case 32:
            NSLog(@"出售");
            break;
        case 33:
            NSLog(@"出借");
            
        default:
            break;
    }

}

- (void)personSuiteBtnClick: (UIButton *)btn {
    switch (btn.tag) {
        case 21:
            NSLog(@"不限");
            break;
        case 22:
            NSLog(@"教材资料");
            break;
        case 23:
            NSLog(@"课外");
            
        default:
            break;
    }
}

@end
