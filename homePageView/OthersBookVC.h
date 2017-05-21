//
//  OthersBookVC.h
//  taoBook
//
//  Created by apple7 on 17/3/16.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OthersBookVCDelegate<NSObject>
@optional
- (void)OthersBookVCDidScroll:(CGFloat)scrollY;
@end
@interface OthersBookVC : UITableViewController
/**代理*/
@property(nonatomic,weak)id<OthersBookVCDelegate> delegate;
@end
