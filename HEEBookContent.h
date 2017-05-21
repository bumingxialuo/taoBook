//
//  HEEBookContent.h
//  taoBook
//
//  Created by apple7 on 17/3/14.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HEEBookContent : NSObject

@property (nonatomic, strong) NSString  *bookIMGName;               //图片名
@property (nonatomic, strong) NSString  *bookName;                  //书名
@property (nonatomic, strong) NSString  *owenerName;                //发布人姓名
@property (nonatomic, assign) NSString   *sexIMG;                     //发布人性别
@property (nonatomic, strong) NSString  *classification;            //类别   (结构体： 里面有系列种类供选择)
@property (nonatomic, assign) NSNumber  *price;                      //价格    (可以单独封装， 然后添加)


@end
