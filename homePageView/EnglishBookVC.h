//
//  EnglishBookVC.h
//  taoBook
//
//  Created by apple7 on 17/3/16.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EnglishBookVCDelegate<NSObject>
@optional
- (void)EnglishBookVCDidScroll:(CGFloat)scrollY;
@end
@interface EnglishBookVC : UITableViewController
/**代理*/
@property(nonatomic,weak)id<EnglishBookVCDelegate> delegate;
@end
