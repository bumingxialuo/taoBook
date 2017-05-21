//
//  HEETableViewCell.m
//  taoBook
//
//  Created by apple7 on 17/3/14.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEETableViewCell.h"
#import <UIView+SDAutoLayout.h>
#import <Chameleon.h>

#define bookNameLabelHeight 44

@interface HEETableViewCell()



@end

@implementation HEETableViewCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutCellSubviews];
    }
    return self;
}

- (void) layoutCellSubviews {
    
    [self.contentView layoutIfNeeded];
    
    NSString *name = @"###";
    NSString *owener = @"发布人: ";
    NSMutableAttributedString *mattStri = [[NSMutableAttributedString alloc] initWithString:name];
    NSRange range = [name rangeOfString:owener];
    [mattStri addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"00ff00"] range:range];
    
    NSString *dig = @"10";
    NSString *price = @"价格: ";
    NSMutableAttributedString *mattStri2 = [[NSMutableAttributedString alloc] initWithString:dig];
    NSRange range2 = [name rangeOfString:price];
    [mattStri2 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"ff0000"] range:range2];
    
    UIImageView *bookImageView = [[UIImageView alloc] init];
    self.bookImageView = bookImageView;
    bookImageView.image = [UIImage imageNamed:@"defaultIMG"];
    bookImageView.layer.cornerRadius = 3.0;
    bookImageView.layer.masksToBounds = YES;
    
    UILabel *bookNameLabel = [[UILabel alloc] init];
    self.bookNameLabel = bookNameLabel;
    bookNameLabel.text = @"2017年版全国计算机等级考试二级教程MS Office高级应用";
    bookNameLabel.textAlignment = NSTextAlignmentLeft;
    bookNameLabel.textColor = [UIColor colorWithHexString:@"#9C9C9C"];
    bookNameLabel.numberOfLines = 2;
    bookNameLabel.font = [UIFont systemFontOfSize:18];
    
    UILabel *bookClassificationLabel = [[UILabel alloc] init];
    self.bookClassificationLabel = bookClassificationLabel;
    bookClassificationLabel.text = @"分类: 计算机";
    bookClassificationLabel.textAlignment = NSTextAlignmentLeft;
    bookClassificationLabel.textColor = [UIColor colorWithHexString:@"#9C9C9C"];
    bookClassificationLabel.font = [UIFont systemFontOfSize:14];
    
    UILabel *bookPriceLabel = [[UILabel alloc] init];
    self.bookPriceLabel = bookPriceLabel;
//    bookPriceLabel.text = (NSString *)mattStri2;
    bookPriceLabel.text = @"10元";
    bookPriceLabel.textAlignment = NSTextAlignmentLeft;
    bookPriceLabel.textColor = [UIColor colorWithHexString:@"#9C9C9C"];
    bookPriceLabel.font = [UIFont systemFontOfSize:14];
    
    UILabel *bookOwnerLabel = [[UILabel alloc] init];
    self.bookOwnerLabel = bookOwnerLabel;
//    bookOwnerLabel.text = (NSString *)mattStri;
    bookOwnerLabel.text = @"发布人：###";
    bookOwnerLabel.textAlignment = NSTextAlignmentLeft;
    bookOwnerLabel.textColor = [UIColor colorWithHexString:@"#9C9C9C"];
    bookOwnerLabel.font = [UIFont systemFontOfSize:14];
    
    UIImageView *owenerSexImageV = [[UIImageView alloc] init];
    self.owenerSexImageV = owenerSexImageV;
    owenerSexImageV.image = [UIImage imageNamed:@"home_icon_boy"];
    owenerSexImageV.layer.masksToBounds = YES;
    
    [bookOwnerLabel sd_addSubviews:@[owenerSexImageV]];
    [self.contentView sd_addSubviews:@[bookImageView, bookNameLabel, bookClassificationLabel, bookPriceLabel, bookOwnerLabel]];
    
    CGFloat litleLabelHeight = (self.contentView.height - 10 * 2 - bookNameLabelHeight) / 3 ;
    
    NSLog(@"%f",self.contentView.width);
    
    bookImageView.sd_layout
    .leftSpaceToView(self.contentView, 16)
    .topSpaceToView(self.contentView, 17)
    .widthIs(75)
    .heightIs(100);
    
    bookNameLabel.sd_layout
    .topSpaceToView(self.contentView, 17)
    .leftSpaceToView(bookImageView, 15)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(bookNameLabelHeight);
    
    bookOwnerLabel.sd_layout
    .topSpaceToView(bookNameLabel, 0)
    .leftSpaceToView(bookImageView, 15)
    .widthIs(100)
    .heightIs(20);
    
        owenerSexImageV.sd_layout
        .rightSpaceToView(bookOwnerLabel, 0)
        .centerYEqualToView(bookOwnerLabel)
        .widthIs(12)
        .heightIs(12);
    
    bookClassificationLabel.sd_layout
    .topSpaceToView(bookOwnerLabel, 0)
    .leftSpaceToView(bookImageView, 15)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(20);
    
    bookPriceLabel.sd_layout
    .topSpaceToView(bookClassificationLabel, 0)
    .leftSpaceToView(bookImageView, 15)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(20);
//    NSLog(@"finish layoutcellsubview");
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
