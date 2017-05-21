//
//  AllBookVC.m
//  taoBook
//
//  Created by apple7 on 17/3/16.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "AllBookVC.h"
#import "HEETableViewCell.h"
#import <UIView+SDAutoLayout.h>

static CGFloat const OffsetY = 190;
static NSString *const oneCell = @"HEEOneCell";

@interface AllBookVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AllBookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self setupConfigures];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.contentSize = CGSizeMake(self.view.width, 0);
    self.tableView = tableView;
}

- (void)setupConfigures{
    // 修改tableView的样式
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:oneCell];
    tableView.rowHeight = 134;
    self.tableView = tableView;
    self.tableView.contentInset = UIEdgeInsetsMake(OffsetY - 25, 0, -35, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HEETableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:oneCell];
    
    if (!cell) {
        cell = [[HEETableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:oneCell];
    }
    
//    cell.bookImageView.image = [UIImage imageNamed:@"defaultIMG"];
//    cell.bookNameLabel.text = @"2017年版全国计算机等级考试二级教程MS Office高级应用";
//    cell.bookClassificationLabel.text = @"分类: 计算机";
//    cell.bookPriceLabel.text = @"10元";
//    cell.bookOwnerLabel.text = @"###";
//    cell.owenerSexImageV.image = [UIImage imageNamed:@"sex_woman"];
//    cell.imageView.image = [UIImage imageNamed:@"defaultIMG"];
//    cell.textLabel.text = @"测试-全部-测试";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 134;
}

#pragma mark- scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.delegate respondsToSelector:@selector(AllBookVCDidScroll:)]) {
        [self.delegate AllBookVCDidScroll:scrollView.contentOffset.y];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
