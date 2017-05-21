//
//  HEEWishListTBVC.m
//  taoBook
//
//  Created by apple7 on 17/3/16.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEWishListTBVC.h"
#import "HEEWishListCellTableViewCell.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>
#import "HEEWishListCellDetailView.h"

static CGFloat const OffsetY = 0;
static NSString *const oneCell = @"oneCell";

@interface HEEWishListTBVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *HEEWishTableList;

@end

@implementation HEEWishListTBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor colorWithHexString:@"f1f1f1"];
    self.HEEWishTableList = tableView;
    
    [self.view addSubview:self.HEEWishTableList];
    _HEEWishTableList.sd_layout
    .topSpaceToView(self.view,-36);
//    [self setupConfigures];
}
- (IBAction)editXYD:(id)sender {
    
    NSLog(@"心愿单左上角的item点击事件");
}

- (void)setupConfigures{
    //把UITableView 换成 HEETableView
    // 修改tableView的样式  修改成规定的样式 数据源从网上获取 动态加载。。
    //自定义cell  自适应文本高度／规定的文本高度
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:oneCell];
    tableView.rowHeight = 170;
    tableView.delegate = self;
    tableView.dataSource = self;
    self.HEEWishTableList = tableView;
    self.HEEWishTableList.contentInset = UIEdgeInsetsMake(OffsetY - 25, 0, -35, 0);
    self.HEEWishTableList.scrollIndicatorInsets = self.HEEWishTableList.contentInset;
    [self.view addSubview:self.HEEWishTableList];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *iden = @"wishlistcell";
    HEEWishListCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    
    if (!cell) {
        cell = [[HEEWishListCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    
    cell.userNameL.text = @"小明";
    cell.userHeadIMG.image = [UIImage imageNamed:@"-xyd_img_headphoto"];
    
    cell.userSexIMG.image = [UIImage imageNamed:@"home_icon_boy"];
    cell.bookNameL.text = @"高等数学（一）";
    cell.sellTypeL.text = @"加急！开价10元";
    cell.phoneNumberL.text = @"18888888888";
    cell.instructionsL.text = @"求购一本高等数学（一），由于马上要准备考研，可两年前的高数早就不翼而飞，有不用的可以联系我，谢谢！";
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.hidesBottomBarWhenPushed=YES;
    
    HEEWishListCellDetailView *detailVC = [[HEEWishListCellDetailView alloc] init];
    
    [self.navigationController pushViewController:detailVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
    
    //2.如果在push跳转时需要隐藏tabBar，设置self.hidesBottomBarWhenPushed=YES;
   //    [self.navigationController pushViewController: detailVC animated:YES];
}

#pragma mark- scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.delegate respondsToSelector:@selector(HEEWishListTBVCDidScroll:)]) {
        [self.delegate HEEWishListTBVCDidScroll:scrollView.contentOffset.y];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
