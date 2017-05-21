//
//  HEEBookRankingCell.m
//  taoBook
//
//  Created by apple7 on 17/3/26.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEBookRankingCell.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>

@implementation HEEBookRankingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutCellSubView];
    }
    return self;
}

- (void)layoutCellSubView {
    UILabel *bookNameL = [[UILabel alloc] init];
    self.bookName = bookNameL;
    bookNameL.textColor = [UIColor colorWithHexString:@"323232"];
    bookNameL.textAlignment = NSTextAlignmentLeft;
    bookNameL.font = [UIFont systemFontOfSize:16];
    bookNameL.numberOfLines = 1;
    
    UILabel *numberL = [[UILabel alloc] init];
    self.number = numberL;
    numberL.textColor = [UIColor colorWithHexString:@"323232"];
    numberL.textAlignment = NSTextAlignmentCenter;
    numberL.font = [UIFont systemFontOfSize:16];
    
    UILabel *browsing = [[UILabel alloc] init];
    self.browsing = browsing;
    browsing.textColor = [UIColor colorWithHexString:@"999999"];
    browsing.textAlignment = NSTextAlignmentCenter;
    browsing.font = [UIFont systemFontOfSize:12];
    
    
    UILabel *deal = [[UILabel alloc] init];
    self.deal = deal;
    deal.textColor = [UIColor colorWithHexString:@"999999"];
    deal.textAlignment = NSTextAlignmentCenter;
    deal.font = [UIFont systemFontOfSize:12];
    
    UILabel *wantToBy = [[UILabel alloc] init];
    self.wantToBy = wantToBy;
    wantToBy.textColor = [UIColor colorWithHexString:@"999999"];
    wantToBy.textAlignment = NSTextAlignmentCenter;
    wantToBy.font = [UIFont systemFontOfSize:12];
    
    UIImageView *bookIMG = [[UIImageView alloc] init];
    self.bookIMG = bookIMG;
    bookIMG.layer.masksToBounds = YES;
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"浏览";
    label1.textColor = [UIColor colorWithHexString:@"999999"];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:12];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"交易";
    label2.textColor = [UIColor colorWithHexString:@"999999"];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:12];
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = @"想买";
    label3.textColor = [UIColor colorWithHexString:@"999999"];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.font = [UIFont systemFontOfSize:12];
    
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    UIView *line2 = [[UIView alloc] init];
    line2.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    
    [self.contentView sd_addSubviews:@[numberL,bookNameL,bookIMG,browsing,deal,wantToBy,label1,label2,label3,line1,line2]];
    
    numberL.sd_layout
    .topSpaceToView(self.contentView, 25)
    .leftSpaceToView(self.contentView, 10)
    .widthIs(16)
    .heightIs(16);
    
    bookNameL.sd_layout
    .centerYEqualToView(numberL)
    .leftSpaceToView(numberL,0)
    .widthIs(200)
    .heightIs(16);
    
    bookIMG.sd_layout
    .topSpaceToView(self.contentView,6)
    .rightSpaceToView(self.contentView,8)
    .widthIs(75)
    .heightIs(100);
    
    browsing.sd_layout
    .topSpaceToView(bookNameL,10)
    .leftSpaceToView(self.contentView,30)
    .widthIs(25)
    .heightIs(18);
    
    label1.sd_layout
    .topSpaceToView(browsing,0)
    .leftEqualToView(browsing)
    .widthIs(25)
    .heightIs(18);
    
    line1.sd_layout
    .topSpaceToView(numberL,15)
    .leftSpaceToView(browsing,42)
    .widthIs(0.5)
    .heightIs(17);
    
    deal.sd_layout
    .topSpaceToView(bookNameL,10)
    .leftSpaceToView(line1,30)
    .widthIs(25)
    .heightIs(18);
    
    label2.sd_layout
    .topSpaceToView(deal,0)
    .leftEqualToView(deal)
    .widthIs(25)
    .heightIs(18);
    
    line2.sd_layout
    .topSpaceToView(numberL,15)
    .leftSpaceToView(deal,42)
    .widthIs(0.5)
    .heightIs(17);
    
    wantToBy.sd_layout
    .topSpaceToView(bookNameL,10)
    .leftSpaceToView(line2,30)
    .widthIs(25)
    .heightIs(18);
    
    label3.sd_layout
    .topSpaceToView(wantToBy,0)
    .leftEqualToView(wantToBy)
    .widthIs(25)
    .heightIs(18);
    
    
}

@end
