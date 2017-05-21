//
//  HEEBookRankingTVC.h
//  taoBook
//
//  Created by apple7 on 17/3/26.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HEEBookRankingTVCDelegate<NSObject>
@optional
- (void)HEEBookRankingTVCDidScroll:(CGFloat)scrollY;
@end
@interface HEEBookRankingTVC : UITableViewController
/**代理*/
@property(nonatomic,weak)id<HEEBookRankingTVCDelegate> delegate;
@end
