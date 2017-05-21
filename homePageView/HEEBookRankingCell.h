//
//  HEEBookRankingCell.h
//  taoBook
//
//  Created by apple7 on 17/3/26.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HEEBookRankingCell : UITableViewCell
@property (nonatomic, strong) UILabel *bookName;           //书名
@property (nonatomic, strong) UILabel *browsing;           //浏览量
@property (nonatomic, strong) UILabel *deal;               //交易
@property (nonatomic, strong) UILabel *wantToBy;           //想买
@property (nonatomic, strong) UIImageView *bookIMG;            //书的图片名字
@property (nonatomic, strong) UILabel *number;            //序列
@end
