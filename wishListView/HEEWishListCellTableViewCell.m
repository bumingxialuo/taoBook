//
//  HEEWishListCellTableViewCell.m
//  taoBook
//
//  Created by apple7 on 17/3/19.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEWishListCellTableViewCell.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>

@interface HEEWishListCellTableViewCell()


@end

@implementation HEEWishListCellTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutCellSubviews];
    }
    return self;
}

- (void)layoutCellSubviews {
    
    self.userHeadIMG = [[UIImageView alloc] init];
    self.userHeadIMG.layer.cornerRadius = 36/2;
    self.userHeadIMG.layer.masksToBounds = YES;
    
    self.userNameL = [[UILabel alloc] init];
    self.userNameL.textColor = [UIColor colorWithHexString:@"86d285"];
    self.userNameL.textAlignment = NSTextAlignmentLeft;
    self.userNameL.font = [UIFont systemFontOfSize:14];
    
    self.userSexIMG = [[UIImageView alloc] init];
    self.userSexIMG.layer.masksToBounds = YES;
    
    self.helpBtn = [[UIButton alloc] init];
    self.helpBtn.layer.borderColor = [UIColor colorWithHexString:@"45c24a"].CGColor;
    self.helpBtn.layer.cornerRadius = 4.5;
    self.helpBtn.layer.masksToBounds = YES;
    self.helpBtn.layer.borderWidth = 1.0;
//    self.helpBtn.titleLabel.text = @"帮助Ta";
    [self.helpBtn setTitle:@"帮助Ta" forState:UIControlStateNormal];
    [self.helpBtn setTitle:@"帮助Ta" forState:UIControlStateSelected];
//    self.helpBtn.titleLabel.textColor = [UIColor colorWithHexString:@"45c24a"];
//    [self.helpBtn.titleLabel setTextColor:[UIColor colorWithHexString:@"45c24a"]];
    [self.helpBtn setTitleColor:[UIColor colorWithHexString:@"45c24a"] forState:UIControlStateNormal];
    self.helpBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    self.helpBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.bookNameL = [[UILabel alloc] init];
    self.bookNameL.textAlignment = NSTextAlignmentLeft;
    self.bookNameL.font = [UIFont systemFontOfSize:16];
    self.bookNameL.textColor = [UIColor colorWithHexString:@"323232"];
    
    self.sellTypeL = [[UILabel alloc] init];
    self.sellTypeL.textColor = [UIColor colorWithHexString:@"e5661f"];
    self.sellTypeL.textAlignment = NSTextAlignmentRight;
    self.sellTypeL.text = @"加急！开价10元";
    self.sellTypeL.font = [UIFont systemFontOfSize:16];
    
    UILabel *contactWayL = [[UILabel alloc] init];
    contactWayL.text = @"联系方式";
    contactWayL.textAlignment = NSTextAlignmentLeft;
    contactWayL.textColor = [UIColor colorWithHexString:@"666666"];
    contactWayL.font = [UIFont systemFontOfSize:14];
    
    self.phoneNumberL = [[UILabel alloc] init];
    self.phoneNumberL.textColor = [UIColor colorWithHexString:@"45c24a"];
    self.phoneNumberL.textAlignment = NSTextAlignmentLeft;
    self.phoneNumberL.font = [UIFont systemFontOfSize:14];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    self.instructionsL = [[UILabel alloc] init];
    self.instructionsL.textColor = [UIColor colorWithHexString:@"666666"];
    self.instructionsL.textAlignment = NSTextAlignmentLeft;
    self.instructionsL.font = [UIFont systemFontOfSize:14];
    self.instructionsL.lineBreakMode = NSLineBreakByCharWrapping;
    self.instructionsL.numberOfLines = 0;
    
    UIView *intervalView = [[UIView alloc] init];
    intervalView.backgroundColor = [UIColor colorWithHexString:@"f1f1f1"];
    
    
    [self.contentView sd_addSubviews:@[self.userHeadIMG,self.userNameL,self.userSexIMG,self.helpBtn,self.bookNameL,self.sellTypeL,contactWayL,self.phoneNumberL,line,self.instructionsL,intervalView]];
//    NSLog(@"cell add subview");
    
    self.userHeadIMG.sd_layout
    .topSpaceToView(self.contentView, 8)
    .leftSpaceToView(self.contentView, 8)
    .widthIs(36)
    .heightIs(36);
    
    self.userNameL.sd_layout
    .leftSpaceToView(self.userHeadIMG, 8)
    .centerYEqualToView(self.userHeadIMG)
    .heightIs(14)
    .widthIs(50);
    
    self.userSexIMG.sd_layout
    .leftSpaceToView(self.userNameL, 8)
    .centerYEqualToView(self.userHeadIMG)
    .widthIs(12)
    .heightIs(12);
    
    self.helpBtn.sd_layout
    .rightSpaceToView(self.contentView, 10)
    .centerYEqualToView(self.userHeadIMG)
    .widthIs(75)
    .heightIs(22);
    
    self.bookNameL.sd_layout
    .topSpaceToView(self.userHeadIMG, 8)
    .leftSpaceToView(self.contentView, 8)
    .heightIs(16)
    .widthIs(120);
    
    self.sellTypeL.sd_layout
    .rightSpaceToView(self.contentView, 10)
    .centerYEqualToView(self.bookNameL)
    .heightIs(16)
    .widthIs(120);
    
    contactWayL.sd_layout
    .topSpaceToView(self.bookNameL, 8)
    .leftSpaceToView(self.contentView, 8)
    .heightIs(14)
    .widthIs(60);
    
    self.phoneNumberL.sd_layout
    .leftSpaceToView(self.contentView,76)
    .heightIs(14)
    .centerYEqualToView(contactWayL)
    .widthIs(110);
    
    line.sd_layout
    .topSpaceToView(contactWayL, 8)
    .leftSpaceToView(self.contentView,12)
    .rightSpaceToView(self.contentView,12)
    .heightIs(0.5);
    
    self.instructionsL.sd_layout
    .topSpaceToView(line, 8)
    .leftSpaceToView(self.contentView, 8)
    .rightSpaceToView(self.contentView, 8)
    .heightIs(40);
    
    intervalView.sd_layout
    .topSpaceToView(line, 66)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(5);
}

@end
