//
//  DeceasedFatherGrindVC.h
//  taoBook
//
//  Created by apple7 on 17/3/16.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DeceasedFatherGrindVCDelegate<NSObject>
@optional
- (void)DeceasedFatherGrindVCDidScroll:(CGFloat)scrollY;
@end
@interface DeceasedFatherGrindVC : UITableViewController
/**代理*/
@property(nonatomic,weak)id<DeceasedFatherGrindVCDelegate> delegate;
@end
