//
//  TeachingMaterialVC.h
//  taoBook
//
//  Created by apple7 on 17/3/16.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TeachingMaterialVCDelegate<NSObject>
@optional
- (void)TeachingMaterialVCDidScroll:(CGFloat)scrollY;
@end
@interface TeachingMaterialVC : UITableViewController
/**代理*/
@property(nonatomic,weak)id<TeachingMaterialVCDelegate> delegate;
@end
