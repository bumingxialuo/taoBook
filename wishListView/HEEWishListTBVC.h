//
//  HEEWishListTBVC.h
//  taoBook
//
//  Created by apple7 on 17/3/16.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HEEWishListTBVCDelegate<NSObject>
@optional
- (void)HEEWishListTBVCDidScroll:(CGFloat)scrollY;
@end

@interface HEEWishListTBVC: UIViewController
/**代理*/
@property(nonatomic,weak)id<HEEWishListTBVCDelegate> delegate;
@end
