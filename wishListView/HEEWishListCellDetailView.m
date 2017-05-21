//
//  HEEWishListCellDetailView.m
//  taoBook
//
//  Created by apple7 on 17/3/20.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEWishListCellDetailView.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>
#import "HEEWishScrollView.h"
#import "HEEWishListCommentCell.h"

@interface HEEWishListCellDetailView ()<UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) HEEWishScrollView *wishListDetailScroll;
@property (nonatomic, strong) UIView *headViewContain;
@property (nonatomic, strong) UIScrollView *detailScrollView;

@property (nonatomic, strong) NSString *wishListBook;               //书本名
@property (nonatomic, strong) NSString *degreeOfNew;                 //新旧程度
@property (nonatomic, strong) NSString *dateOfReleaseList;           //发布时间
@property (nonatomic, strong) NSString *browseTime;                  //浏览次数
@property (nonatomic, strong) NSString *replyType;                   //酬谢方式


@end

@implementation HEEWishListCellDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    self.wishListBook = @"考研英语词汇";
    self.degreeOfNew = @"8";
    self.dateOfReleaseList = @"1";
    self.browseTime = @"80";
    self.replyType = @"10元";

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self layoutSubViews];
    
}

- (void) settingNavContr {
    
    //1.设置self.tabBarController.tabBar.hidden=YES;
    
//    self.tabBarController.tabBar.hidden=YES;
    
    
    
    //并在push后设置self.hidesBottomBarWhenPushed=NO;
    //这样back回来的时候，tabBar会恢复正常显示。
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithHexString:@"43c248"];
    
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"ffffff"]];
}

- (void)layoutSubViews {
    [self settingNavContr];
    
    [self.view layoutIfNeeded];
    
    UIView *headViewContain = [[UIView alloc] init];
    self.headViewContain = headViewContain;
    headViewContain.backgroundColor = [UIColor colorWithHexString:@"f1f1f1"];
    
    UIScrollView *detailScrollView = [[UIScrollView alloc] init];
    self.detailScrollView = detailScrollView;
    detailScrollView.delegate = self;
    detailScrollView.backgroundColor = [UIColor colorWithHexString:@"f1f1f1"];
    detailScrollView.contentSize = CGSizeMake(self.view.width, 0);
    detailScrollView.bounces = self;
    detailScrollView.pagingEnabled = YES;
    
    HEEWishScrollView *wishListDetailScroll = [[HEEWishScrollView alloc] init];
    self.wishListDetailScroll = wishListDetailScroll;
    
    UIView *wishListDetailContain1 = [[UIView alloc] init];
    wishListDetailContain1.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    
    UILabel *wishListBookL = [[UILabel alloc] init];
    wishListBookL.text = self.wishListBook;
    wishListBookL.textColor = [UIColor colorWithHexString:@"353535"];
    wishListBookL.font = [UIFont systemFontOfSize:16];
    wishListBookL.textAlignment = NSTextAlignmentLeft;
    
    
    UILabel *degreeOfNewL = [[UILabel alloc] init];
    degreeOfNewL.backgroundColor = [UIColor colorWithHexString:@"43c248"];
    degreeOfNewL.textAlignment = NSTextAlignmentCenter;
    degreeOfNewL.textColor = [UIColor colorWithWhite:1. alpha:1.];
    degreeOfNewL.font = [UIFont systemFontOfSize:10];
    degreeOfNewL.text = [NSString stringWithFormat:@"%@成新",self.degreeOfNew];
    degreeOfNewL.layer.cornerRadius = 5.0;
    degreeOfNewL.clipsToBounds = YES;
    
    UILabel *dateOfReleaseListL = [[UILabel alloc] init];
    dateOfReleaseListL.text = [NSString stringWithFormat:@"%@天前发布", self.dateOfReleaseList];
    dateOfReleaseListL.textAlignment = NSTextAlignmentLeft;
    dateOfReleaseListL.textColor = [UIColor colorWithHexString:@"999999"];
    dateOfReleaseListL.font = [UIFont systemFontOfSize:12];
    
    
    UILabel *browseTimeL = [[UILabel alloc] init];
    browseTimeL.text = [NSString stringWithFormat:@"浏览：%@次",self.browseTime];
    browseTimeL.textColor = [UIColor colorWithHexString:@"999999"];
    browseTimeL.textAlignment = NSTextAlignmentRight;
    browseTimeL.font = [UIFont systemFontOfSize:12];
    
    UILabel *replyTypeL = [[UILabel alloc] init];
    replyTypeL.text = self.replyType;
    replyTypeL.textAlignment = NSTextAlignmentLeft;
    replyTypeL.textColor = [UIColor colorWithHexString:@"ea672a"];
    replyTypeL.font = [UIFont systemFontOfSize:14];
    
    UIView *wishListDetailLine = [[UIView alloc] init];
    wishListDetailLine.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    UILabel *replyTypeTitle = [[UILabel alloc] init];
    replyTypeTitle.text = @"原价：30元";
    replyTypeTitle.textAlignment = NSTextAlignmentLeft;
    replyTypeTitle.font = [UIFont systemFontOfSize:12];
    replyTypeTitle.textColor = [UIColor colorWithHexString:@"626262"];
    
    UIView *wishListDetailContain2 = [[UIView alloc] init];
    wishListDetailContain2.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    
    UIImageView *wishListDetailIMG = [[UIImageView alloc] init];
    wishListDetailIMG.image = [UIImage imageNamed:@"-xyd_img_headphoto"];
    wishListDetailIMG.layer.cornerRadius = 37/2;
    wishListDetailIMG.layer.masksToBounds = YES;
    wishListDetailIMG.layer.borderColor = [UIColor colorWithHexString:@"43c248"].CGColor;
    wishListDetailIMG.layer.borderWidth = 0.5;
    
    UILabel *userNameL = [[UILabel alloc] init];
    userNameL.text = @"小明";
    userNameL.textColor = [UIColor colorWithHexString:@"626262"];
    userNameL.font = [UIFont systemFontOfSize:12];
    userNameL.textAlignment = NSTextAlignmentLeft;
    
    UIImageView *userSexIMG = [[UIImageView alloc] init];
    userSexIMG.image = [UIImage imageNamed:@"home_icon_boy"];
    userSexIMG.layer.masksToBounds = YES;
    
    UILabel *phoneNumber1 = [[UILabel alloc] init];
    UILabel *phoneNumber2 = [[UILabel alloc] init];
    phoneNumber1.text = @"手机号:";
    phoneNumber1.textAlignment = NSTextAlignmentLeft;
    phoneNumber1.textColor = [UIColor colorWithHexString:@"626262"];
    phoneNumber1.font = [UIFont systemFontOfSize:12];
    phoneNumber2.text = @"18888888888";
    phoneNumber2.textAlignment = NSTextAlignmentLeft;
    phoneNumber2.textColor = [UIColor colorWithHexString:@"43c248"];
    phoneNumber2.font = [UIFont systemFontOfSize:12];
    
    UILabel *QQNumber1 = [[UILabel alloc] init];
    UILabel *QQNumber2 = [[UILabel alloc] init];
    QQNumber1.text = @"QQ:";
    QQNumber1.textAlignment = NSTextAlignmentLeft;
    QQNumber1.textColor = [UIColor colorWithHexString:@"626262"];
    QQNumber1.font = [UIFont systemFontOfSize:12];
    QQNumber2.text = @"1234567890";
    QQNumber2.textAlignment = NSTextAlignmentLeft;
    QQNumber2.textColor = [UIColor colorWithHexString:@"626262"];
    QQNumber2.font = [UIFont systemFontOfSize:12];
    
    UILabel *weChatNumber1 = [[UILabel alloc] init];
    UILabel *weChatNumber2 = [[UILabel alloc] init];
    weChatNumber1.text = @"微信:";
    weChatNumber1.textAlignment = NSTextAlignmentLeft;
    weChatNumber1.textColor = [UIColor colorWithHexString:@"626262"];
    weChatNumber1.font = [UIFont systemFontOfSize:12];
    weChatNumber2.text = @"Xiao_ming";
    weChatNumber2.textAlignment = NSTextAlignmentLeft;
    weChatNumber2.textColor = [UIColor colorWithHexString:@"626262"];
    weChatNumber2.font = [UIFont systemFontOfSize:12];
    
    UIView *wishListDetailContain3 = [[UIView alloc] init];
    wishListDetailContain3.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    UILabel *saySomethingL = [[UILabel alloc] init];
    saySomethingL.text = @"求购一本高等数学（一），由于马上要准备考研，可两年前的高数早就不翼而飞，有不用的可以联系我，谢谢！";
    saySomethingL.textColor = [UIColor colorWithHexString:@"626262"];
    saySomethingL.textAlignment = NSTextAlignmentLeft;
    saySomethingL.font = [UIFont systemFontOfSize:12];
    saySomethingL.numberOfLines = 3;
    
    UIView *commentAndContanctView = [[UIView alloc] init];
    commentAndContanctView.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    
    UIView *commentView = [[UIView alloc] init];
    commentView.backgroundColor = [UIColor colorWithHexString:@"e46720"];
    UIImageView *commentIMG = [[UIImageView alloc] init];
    commentIMG.image = [UIImage imageNamed:@"sjxq_icon_comment"];
    commentIMG.layer.masksToBounds = YES;
    UIButton *commentBtn = [[UIButton alloc] init];
//    commentBtn.titleLabel.text = @"评论";
    [commentBtn setTitle:@"评论" forState:UIControlStateNormal];
    commentBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    commentBtn.backgroundColor = [UIColor colorWithHexString:@"e46720"];
    [commentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    commentBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [commentBtn addTarget:self action:@selector(commentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *contanctView = [[UIView alloc] init];
    contanctView.backgroundColor = [UIColor colorWithHexString:@"43c248"];
    UIImageView *contanctIMG = [[UIImageView alloc] init];
    contanctIMG.image = [UIImage imageNamed:@"sjxq_icon_cell"];
    contanctIMG.layer.masksToBounds = YES;
    UIButton *contanctBtn = [[UIButton alloc] init];
//    contanctBtn.titleLabel.text = @"联系卖家";
    [contanctBtn setTitle:@"联系卖家" forState:UIControlStateNormal];
    contanctBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    contanctBtn.backgroundColor = [UIColor colorWithHexString:@"43c248"];
    [contanctBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    contanctBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [contanctBtn addTarget:self action:@selector(contanctBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UITableView *commentTable = [[UITableView alloc] init];
    commentTable.dataSource = self;
    commentTable.delegate = self;
    commentTable.rowHeight = 72;
    
    
    [self.view sd_addSubviews:@[headViewContain,detailScrollView,commentAndContanctView]];
    
    
    [headViewContain sd_addSubviews:@[wishListDetailScroll,wishListDetailContain1,wishListDetailContain2,wishListDetailContain3]];
    
    [wishListDetailContain1 sd_addSubviews:@[wishListBookL,degreeOfNewL,dateOfReleaseListL,browseTimeL,wishListDetailLine,replyTypeTitle,replyTypeL]];
    
    [wishListDetailContain2 sd_addSubviews:@[wishListDetailIMG,userNameL,userSexIMG,phoneNumber1, phoneNumber2,QQNumber1,QQNumber2,weChatNumber1,weChatNumber2]];
    
    [wishListDetailContain3 sd_addSubviews:@[saySomethingL]];
    
    [detailScrollView sd_addSubviews:@[commentTable]];
    
    [commentAndContanctView sd_addSubviews:@[commentView,contanctView]];
    [commentView sd_addSubviews:@[commentIMG,commentBtn]];
    [contanctView sd_addSubviews:@[contanctIMG,contanctBtn]];
    
    headViewContain.sd_layout
    .topSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(520);
    
    wishListDetailScroll.sd_layout
    .topSpaceToView(headViewContain, 0)
    .leftSpaceToView(headViewContain, 0)
    .rightSpaceToView(headViewContain, 0)
    .heightIs(233);
    
    wishListDetailContain1.sd_layout
    .topSpaceToView(wishListDetailScroll,5)
    .leftSpaceToView(headViewContain,0)
    .rightSpaceToView(headViewContain,0)
    .heightIs(54);
    
    wishListBookL.sd_layout
    .topSpaceToView(wishListDetailContain1,10)
    .leftSpaceToView(wishListDetailContain1, 15)
    .widthIs(110)
    .heightIs(16);
    
    degreeOfNewL.sd_layout
    .centerYEqualToView(wishListBookL)
    .leftSpaceToView(wishListBookL,0)
    .widthIs(38)
    .heightIs(13);
    
    dateOfReleaseListL.sd_layout
    .leftEqualToView(wishListBookL)
    .topSpaceToView(wishListBookL,10)
    .widthIs(100)
    .heightIs(10);
    
    wishListDetailLine.sd_layout
    .topSpaceToView(wishListDetailContain1,10)
    .bottomSpaceToView(wishListDetailContain1,10)
    .rightSpaceToView(wishListDetailContain1,130)
    .widthIs(1.);
    
    browseTimeL.sd_layout
    .rightSpaceToView(wishListDetailLine, 10)
    .bottomSpaceToView(wishListDetailContain1,10)
    .heightIs(12)
    .widthIs(80);
    
    replyTypeTitle.sd_layout
    .topSpaceToView(wishListDetailContain1, 10)
    .leftSpaceToView(wishListDetailLine, 10)
    .heightIs(12)
    .widthIs(80);
    
    replyTypeL.sd_layout
    .topSpaceToView(replyTypeTitle,10)
    .leftEqualToView(replyTypeTitle)
    .heightIs(12)
    .widthIs(80);
    
    wishListDetailContain2.sd_layout
    .topSpaceToView(wishListDetailContain1, 22)
    .leftEqualToView(headViewContain)
    .rightEqualToView(headViewContain)
    .heightIs(68);
    
    wishListDetailIMG.sd_layout
    .topSpaceToView(wishListDetailContain2, 8)
    .leftSpaceToView(wishListDetailContain2,8)
    .widthIs(37)
    .heightIs(37);
    
    userNameL.sd_layout
    .topSpaceToView(wishListDetailIMG, 8)
    .centerXEqualToView(wishListDetailIMG)
    .heightIs(12)
    .widthIs(26);
    
    userSexIMG.sd_layout
    .centerYEqualToView(userNameL)
    .leftSpaceToView(userNameL,0)
    .widthIs(12)
    .heightIs(12);
    
    phoneNumber1.sd_layout
    .topSpaceToView(wishListDetailContain2, 8)
    .leftSpaceToView(wishListDetailIMG,30)
    .widthIs(44)
    .heightIs(12);
    
    phoneNumber2.sd_layout
    .centerYEqualToView(phoneNumber1)
    .leftSpaceToView(phoneNumber1, 10)
    .heightIs(12)
    .widthIs(100);
    
    QQNumber1.sd_layout
    .topSpaceToView(phoneNumber1, 8)
    .leftSpaceToView(wishListDetailIMG,30)
    .widthIs(44)
    .heightIs(10);
    
    QQNumber2.sd_layout
    .centerYEqualToView(QQNumber1)
    .leftSpaceToView(phoneNumber1, 10)
    .heightIs(12)
    .widthIs(80);
    
    weChatNumber1.sd_layout
    .topSpaceToView(QQNumber1, 8)
    .leftSpaceToView(wishListDetailIMG,30)
    .widthIs(44)
    .heightIs(12);
    
    weChatNumber2.sd_layout
    .centerYEqualToView(weChatNumber1)
    .leftSpaceToView(phoneNumber1, 10)
    .heightIs(12)
    .widthIs(80);
    
    wishListDetailContain3.sd_layout
    .topSpaceToView(wishListDetailContain2, 22)
    .leftSpaceToView(headViewContain,0)
    .rightSpaceToView(headViewContain,0)
    .heightIs(94);
    
    saySomethingL.sd_layout
    .topSpaceToView(wishListDetailContain3, 8)
    .leftSpaceToView(wishListDetailContain3, 10)
    .rightSpaceToView(wishListDetailContain3, 10)
    .heightIs(50);
    
    
    detailScrollView.sd_layout
    .topSpaceToView(self.view, 520)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(self.view.height);
    
    commentTable.sd_layout
    .topSpaceToView(detailScrollView,0)
    .leftSpaceToView(detailScrollView,0)
    .rightSpaceToView(detailScrollView,0);
    
    commentAndContanctView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view, 0)
    .heightIs(36);
    
    commentView.sd_layout
    .topSpaceToView(commentAndContanctView,0)
    .leftSpaceToView(commentAndContanctView,0)
    .widthIs(self.view.width/2)
    .heightIs(36);
    
    commentIMG.sd_layout
    .topSpaceToView(commentView,0)
    .leftSpaceToView(commentView,48)
    .heightIs(36)
    .heightIs(36);
    commentBtn.sd_layout
    .centerYEqualToView(commentIMG)
    .leftSpaceToView(commentIMG,0)
    .heightIs(36)
    .widthIs(60);
    
    contanctView.sd_layout
    .topSpaceToView(commentAndContanctView,0)
    .rightSpaceToView(commentAndContanctView,0)
    .widthIs(self.view.width/2)
    .heightIs(36);
    
    contanctIMG.sd_layout
    .topSpaceToView(contanctView,0)
    .leftSpaceToView(contanctView,33)
    .heightIs(36)
    .heightIs(36);
    contanctBtn.sd_layout
    .centerYEqualToView(contanctIMG)
    .leftSpaceToView(contanctIMG,0)
    .heightIs(36)
    .widthIs(90);
}

- (void)commentBtnClick {
    NSLog(@"commentBtnClick");
    //添加数据到数据库 更新评论列表
}

- (void)contanctBtnClick {
    NSLog(@"contanctBtnClick");
    //拨打电话 调用电话库函数
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *commentIden = @"commentCell";
    
    HEEWishListCommentCell *commentCell = [tableView dequeueReusableCellWithIdentifier:commentIden];;
    
    if (!commentCell) {
        commentCell = [[HEEWishListCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentIden];
    }
    
    commentCell.commentUserHeadIMG.image = [UIImage imageNamed:@"home_icon_boy"];
    commentCell.commentUserNameL.text = @"小红";
    commentCell.commentDateL.text = @"今天12:00";
    commentCell.commentInfoL.text = @"这本书我有，可以免费送你哦！";
    return commentCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 72;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return @"评论";
//}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //计算高度
    [self HEEScrollToChangeHeaderViewHeight:scrollView.contentOffset.y];
}

// 动态计算滚动的Y值  使视图整体往上滑   [已经约束过的变量布局不再变化]
- (void)HEEScrollToChangeHeaderViewHeight:(CGFloat)scrollY{
    //        NSLog(@"%f",scrollY);
    [self.view layoutSubviews];
    
    CGFloat HeadH = 520;
    CGFloat OffsetY = -75;
    
    CGFloat offsetY = scrollY - OffsetY;
    CGFloat height = HeadH - offsetY;
    
    if (height > HeadH) {
        height = HeadH;
    }
    
    if (height < 0) {
        height = 0;
    }
    
    self.headViewContain.sd_layout
    .bottomSpaceToView(self.detailScrollView,0)
    .leftSpaceToView(self.view,0)
    .rightEqualToView(self.view)
    .heightIs(HeadH);
    
    //    NSLog(@"%f",height);
    
//    self.titleView.sd_layout
//    .topSpaceToView(self.view, height)
//    .leftSpaceToView(self.view, 0)
//    .rightSpaceToView(self.view, 0)
//    .heightIs(TitleViewH);
    
    //    NSLog(@"%f--%f--%f--%f",offsetY, height, self.titleView.frame.origin.y, self.titleView.height);
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
