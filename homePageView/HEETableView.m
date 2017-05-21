//
//  HEETableView.m
//  taoBook
//
//  Created by apple7 on 17/3/14.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEETableView.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>
#import "HEETableViewCell.h"
#import "HEEBookContent.h"

@interface HEETableView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *allContactsArray;         //声明一个大数组存放所有书本信息

@end

@implementation HEETableView

- (NSMutableArray *)allContactsArray {
    
    if (_allContactsArray == nil) {
        _allContactsArray = [NSMutableArray array];
    }
    
    return _allContactsArray;
    
}

- (instancetype)init {
    if (self = [super init]) {
        self.delegate = self;
        self.dataSource = self;
        [self handleData];
    }
    return self;
}

- (void)handleData {
    //读取plist文件
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HEEBookContent" ofType:@"plist"]];
    //将要显示的数据转为model对象
    for (NSDictionary *contactDict in array) {
        HEEBookContent *content = [[HEEBookContent alloc] init];
        //使用KVC赋值
        [content setValuesForKeysWithDictionary:contactDict];
        //将模型存放在大数组中
        [self.allContactsArray addObject:content];
    }
    
    NSError *error;
    
    //获取并解析json数据
    //加载一个NSURL对象
    NSURL *url = [NSURL URLWithString:@"json数据地址"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"json数据地址"]];
    
    NSString *jsonWithString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"jsonString -->%@",jsonWithString);
    
    //json层数问题 ／ 要不要导包？
    
    //将请求的url数据放到NSData对象中 / 要不要创建一个子线程了（主线程更新ui 未加载的数据采用默认的）
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    
    for (NSDictionary *contactDict in dic) {
        HEEBookContent *content = [[HEEBookContent alloc] init];
        //使用KVC赋值
        [content setValuesForKeysWithDictionary:contactDict];
        //将模型存放在大数组中
        [self.allContactsArray addObject:content];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //动态return allContactsArray;
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.allContactsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"bookListCell";
    HEETableViewCell *bookdetails = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!bookdetails) {
        bookdetails = [[HEETableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    HEEBookContent *content = self.allContactsArray[indexPath.row];
    bookdetails.bookImageView.image = [UIImage imageNamed:content.bookIMGName];
    bookdetails.bookNameLabel.text = content.bookName;
    bookdetails.bookClassificationLabel.text = content.classification;
    bookdetails.bookPriceLabel.text = (NSString *)content.price;
    bookdetails.owenerSexImageV.image = [UIImage imageNamed:content.sexIMG];
    bookdetails.bookOwnerLabel.text = content.owenerName;
    
    return bookdetails;
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return @"新书上架";
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

@end
