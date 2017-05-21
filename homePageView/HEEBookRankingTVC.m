//
//  HEEBookRankingTVC.m
//  taoBook
//
//  Created by apple7 on 17/3/26.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEBookRankingTVC.h"
#import "HEEBookRankingCell.h"

static CGFloat const OffsetY = 190;
static NSString *const oneRankingCell = @"HEERankingCell";

@interface HEEBookRankingTVC ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation HEEBookRankingTVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupConfigures];
}

- (void)setupConfigures{
    // 修改tableView的样式
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:oneCell];
    tableView.rowHeight = 112;
    tableView.delegate = self;
    tableView.dataSource = self;
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
    
    HEEBookRankingCell *cell = [tableView dequeueReusableCellWithIdentifier:oneRankingCell];
    
    if (!cell) {
        cell = [[HEEBookRankingCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:oneRankingCell];
    }
    cell.number.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row + 1];
    cell.bookName.text = @"百年孤独";
    cell.browsing.text = @"233";
    cell.deal.text = @"23";
    cell.wantToBy.text = @"23";
    cell.bookIMG.image = [UIImage imageNamed:@"sjsc_img_2"];
    NSLog(@"%@",cell.bookName);
    return cell;
}

#pragma mark- scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.delegate respondsToSelector:@selector(HEEBookRankingTVCDidScroll:)]) {
        [self.delegate HEEBookRankingTVCDidScroll:scrollView.contentOffset.y];
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
