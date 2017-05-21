//
//  HEETableViewCell.h
//  taoBook
//
//  Created by apple7 on 17/3/14.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HEETableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *bookImageView;               //书籍图片
@property (nonatomic, strong) UILabel *bookNameLabel;                   //书籍名字
@property (nonatomic, strong) UILabel *bookClassificationLabel;         //分类
@property (nonatomic, strong) UILabel *bookPriceLabel;                  //价格
@property (nonatomic, strong) UILabel *bookOwnerLabel;                  //发布人
@property (nonatomic, strong) UIImageView *owenerSexImageV;             //性别
@end
