//
//  HEEWishListCellTableViewCell.h
//  taoBook
//
//  Created by apple7 on 17/3/19.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HEEWishListCellTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *userHeadIMG;         //用户头像
@property (nonatomic, strong) UILabel *userNameL;               //用户名
@property (nonatomic, strong) UILabel *bookNameL;               //书名
@property (nonatomic, strong) UILabel *phoneNumberL;            //电话号码
@property (nonatomic, strong) UILabel *sellTypeL;               //加急卖
@property (nonatomic, strong) UILabel *instructionsL;           //详情
@property (nonatomic, strong) UIButton *helpBtn;                //帮助按钮
@property (nonatomic, strong) UIImageView *userSexIMG;          //用户性别图片标记


@end
