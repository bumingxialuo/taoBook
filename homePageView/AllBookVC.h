//
//  AllBookVC.h
//  taoBook
//
//  Created by apple7 on 17/3/16.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AllBookVCDelegate<NSObject>
@optional
- (void)AllBookVCDidScroll:(CGFloat)scrollY;
@end

@interface AllBookVC: UITableViewController
/**代理*/
@property(nonatomic,weak)id<AllBookVCDelegate> delegate;
@end
