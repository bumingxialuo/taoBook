//
//  DeceasedFatherGrindVC.m
//  taoBook
//
//  Created by apple7 on 17/3/16.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "DeceasedFatherGrindVC.h"
#import "HEETableViewCell.h"

static CGFloat const OffsetY = 190;
static NSString *const oneCell = @"HEEOneCell";

@interface DeceasedFatherGrindVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DeceasedFatherGrindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupConfigures];
}

- (void)setupConfigures{
    // 修改tableView的样式
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:oneCell];
    tableView.rowHeight = 134;
    self.tableView = tableView;
    self.tableView.contentInset = UIEdgeInsetsMake(OffsetY - 25, 0, -35, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
//    self.tableView.contentSize.width = [UIScreen mainScreen].bounds.size.width;
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
//    cell.imageView.image = [UIImage imageNamed:@"defaultIMG"];
//    cell.textLabel.text = @"测试-考研-测试";
    return cell;
}

#pragma mark- scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.delegate respondsToSelector:@selector(DeceasedFatherGrindVCDidScroll:)]) {
        [self.delegate DeceasedFatherGrindVCDidScroll:scrollView.contentOffset.y];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

