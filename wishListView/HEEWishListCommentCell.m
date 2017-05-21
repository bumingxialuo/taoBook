//
//  HEEWishListCommentCell.m
//  taoBook
//
//  Created by apple7 on 17/3/20.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEWishListCommentCell.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>

@implementation HEEWishListCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)layoutCellSubViews {
    self.commentUserHeadIMG = [[UIImageView alloc] init];
    self.commentUserHeadIMG.layer.cornerRadius = 37/2;
    self.commentUserHeadIMG.layer.masksToBounds = YES;
    self.commentUserHeadIMG.layer.borderColor = [UIColor colorWithHexString:@"43c248"].CGColor;
    self.commentUserHeadIMG.layer.borderWidth = 0.5;
    
    self.commentUserNameL.font = [UIFont systemFontOfSize:12];
    self.commentUserNameL.textColor = [UIColor colorWithHexString:@"626262"];
    self.commentUserNameL.textAlignment = NSTextAlignmentLeft;
    
    self.commentDateL.textAlignment = NSTextAlignmentLeft;
    self.commentDateL.font = [UIFont systemFontOfSize:10];
    self.commentDateL.textColor = [UIColor colorWithHexString:@"626262"];
    
    self.commentInfoL.textColor = [UIColor colorWithHexString:@"626262"];
    self.commentInfoL.textAlignment = NSTextAlignmentLeft;
    self.commentInfoL.numberOfLines = 1;
    self.commentInfoL.font = [UIFont systemFontOfSize:12];
    
    self.replayBtn = [[UIButton alloc] init];
    [self.replayBtn setTitleColor:[UIColor colorWithHexString:@"43c248"] forState:UIControlStateNormal];
    self.replayBtn.titleLabel.text = @"回复";
    [self.replayBtn setFont:[UIFont systemFontOfSize:10]];
    
    [self.contentView sd_addSubviews:@[self.commentUserHeadIMG,self.commentUserNameL,self.commentDateL,self.commentInfoL,self.replayBtn]];
    
    self.commentUserHeadIMG.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 10)
    .widthIs(37)
    .heightIs(37);
    
    self.commentUserNameL.sd_layout
    .topSpaceToView(self.contentView,15)
    .leftSpaceToView(self.commentUserHeadIMG,10)
    .widthIs(80)
    .heightIs(12);
    
    self.commentDateL.sd_layout
    .topSpaceToView(self.commentUserNameL, 5)
    .leftEqualToView(self.commentUserNameL)
    .widthIs(50)
    .heightIs(10);
    
    self.commentInfoL.sd_layout
    .topSpaceToView(self.commentDateL, 10)
    .leftEqualToView(self.commentUserNameL)
    .heightIs(12)
    .widthIs([UIScreen mainScreen].bounds.size.width - 70);
    
    self.replayBtn.sd_layout
    .topSpaceToView(self.contentView,10)
    .rightSpaceToView(self.contentView,8)
    .widthIs(25)
    .heightIs(10);
    
}

@end
