//
//  homeViewControlerViewController.m
//  taoBook
//
//  Created by apple7 on 17/3/13.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "homeViewControler.h"
#import "HEEScrollView.h"
#import <UIView+SDAutoLayout.h>
#import <Chameleon.h>
#import "HEETableView.h"
#import "HEEBookCategoryViewController.h"
#import "HEESellBookViewController.h"
#import "HEEBookRankingViewController.h"
#import "HEEBooksClassicViewController.h"
#import "CJEBookCategoryViewController.h"
#import "AllBookVC.h"
#import "TeachingMaterialVC.h"
#import "EnglishBookVC.h"
#import "DeceasedFatherGrindVC.h"
#import "OthersBookVC.h"
#import "titleViewsScroll.h"
#import "HEEBookListAllViewController.h"
#import "HEENavSeachVC.h"

#define scrollowViewHeight 130

static CGFloat const HeaderH = 300;
static CGFloat const TitleViewH = 40;
static CGFloat const OffsetY = -134;

@interface homeViewControler ()<UIScrollViewDelegate, AllBookVCDelegate, TeachingMaterialVCDelegate, DeceasedFatherGrindVCDelegate, OthersBookVCDelegate, EnglishBookVCDelegate>

@property (strong, nonatomic) UIView *containView;                          //中间小标题底层的view
@property (strong, nonatomic) UIScrollView *homeViewScrollView;             //轮播图
@property (strong, nonatomic) UIButton *bookCategory;                       //书籍分类
@property (strong, nonatomic) UIButton *sellBook;                           //我要卖书
@property (strong, nonatomic) UIButton *bookRanking;                        //好书榜
@property (strong, nonatomic) UIButton *booksClassic;                       //精品书评

@property (strong, nonatomic) UIView *headView;                             //轮播图＋containview(for button) 的底层view方便滑动

@property (strong, nonatomic) UIView *titleView;                      //标题栏
@property (strong, nonatomic) titleViewsScroll *tableContain;               //内容的view
//@property (strong, nonatomic) UIButton *currentSelectedBtn;                 //选中的按钮
//@property (strong, nonatomic) UIView *selectedUnderLine ;                    //按钮选中时的下划线

@property (strong, nonatomic) HEETableView *bookListTableView;              //新书上架

//@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, weak) AllBookVC *allBookVC;                           //全部
//@property (nonatomic, weak) TeachingMaterialVC *teachingMaterialVC;         //教材
//@property (nonatomic, weak) EnglishBookVC *englishBookVC;                   //英语
//@property (nonatomic, weak) DeceasedFatherGrindVC *deceasedFatherGrindVC;   //考研
//@property (nonatomic, weak) OthersBookVC *othersBookVC;                     //其它

@end

@implementation homeViewControler

//- (NSArray *)titleArray {
//    if (!_titleArray) {
//        _titleArray = @[@"全部", @"教材", @"英语", @"考研", @"其它"];
//    }
//    return  _titleArray;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutSubViews];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupChildViewController];//添加子控制器
    
//    [self setUpTitleView];//添加标题栏内容
    
    [self addChildViewInContentView:0];
    
//    [self setupUnderLine];//添加标题栏下划线
    
}
- (IBAction)homePageSeachShow:(id)sender {
    HEENavSeachVC *homeSeachShowVC = [[HEENavSeachVC alloc] init];
    [self.navigationController pushViewController:homeSeachShowVC animated:YES];
}

- (void) settingNavContr {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithHexString:@"43c248"];
}

- (void) layoutSubViews {
    
    [self.view layoutIfNeeded];
    
    [self settingNavContr];
    
    UIView *headView = [[UIView alloc] init];
    self.headView = headView;
    headView.backgroundColor = [UIColor redColor];
    
    HEEScrollView *scrollView = [[HEEScrollView alloc] init];
    self.homeViewScrollView = scrollView;
    
    UIView *containView = [[UIView alloc] init];
    self.containView = containView;
    containView.backgroundColor = [UIColor colorWithHexString:@"F1F1F1"];
    
        UIButton *bookCategory = [[UIButton alloc] init];
    self.bookCategory = bookCategory;
    bookCategory.layer.cornerRadius = 5.;
    bookCategory.layer.masksToBounds = YES;
//    bookCategory.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight withFrame:self.view.bounds andColors:@[[UIColor colorWithHexString:@"ffffff"], [UIColor colorWithHexString:@"2499f3"]]];
    [bookCategory setImage:[UIImage imageNamed:@"书籍市场"] forState:UIControlStateNormal];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"书籍分类";
    [bookCategory addSubview: label];
    [bookCategory addTarget:self action:@selector(showBookCategoryView) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *sellBook = [[UIButton alloc] init];
    self.sellBook = sellBook;
//    sellBook.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight withFrame:self.view.bounds andColors:@[[UIColor colorWithHexString:@"ffffff"], [UIColor colorWithHexString:@"de464d"]]];
    [sellBook setImage:[UIImage imageNamed:@"我要卖书"] forState:UIControlStateNormal];
    sellBook.layer.cornerRadius = 5.;
    sellBook.layer.masksToBounds = YES;
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"我要卖书";
    [sellBook sd_addSubviews:@[label2] ];
    [sellBook addTarget:self action:@selector(showSellBookView) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *bookRanking = [[UIButton alloc] init];
    self.bookRanking = bookRanking;
//    bookRanking.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight withFrame:self.view.bounds andColors:@[[UIColor colorWithHexString:@"ffffff"], [UIColor colorWithHexString:@"9099fe"]]];
    [bookRanking setImage:[UIImage imageNamed:@"好书榜"] forState:UIControlStateNormal];
    bookRanking.layer.cornerRadius = 5.;
    bookRanking.layer.masksToBounds = YES;
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = @"好书榜";
    [bookRanking sd_addSubviews:@[label3]];
    [bookRanking addTarget:self action:@selector(showBookRankingView) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *booksClassic = [[UIButton alloc] init];
    self.booksClassic = booksClassic;
//    booksClassic.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight withFrame:self.view.bounds andColors:@[[UIColor colorWithHexString:@"ffffff"], [UIColor colorWithHexString:@"91992f"]]];
    [booksClassic setImage:[UIImage imageNamed:@"书籍分类"] forState:UIControlStateNormal];
    booksClassic.layer.cornerRadius = 5.;
    booksClassic.layer.masksToBounds = YES;
    UILabel *label4 = [[UILabel alloc] init];
    label4.text = @"经典书评";
    [booksClassic sd_addSubviews:@[label4]];
    [booksClassic addTarget:self action:@selector(showBooksClassicView) forControlEvents:UIControlEventTouchUpInside];
    
    //标题栏
    UIView *titleView = [[UIView alloc] init];
    self.titleView = titleView;
    titleView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    
    //内容的view
    titleViewsScroll *tableContain = [[titleViewsScroll alloc] init];
    self.tableContain = tableContain;
    tableContain.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    tableContain.pagingEnabled = YES;
    tableContain.bounces = self;
//    tableContain.contentSize = CGSizeMake(self.titleArray.count * self.view.width, 0);
    tableContain.contentSize = CGSizeMake(self.view.width, 0);
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"新书上架";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.font = [UIFont systemFontOfSize:20.];
    [titleLabel setTextColor:[UIColor colorWithHexString:@"#333333"]];
    
    UIButton *moreBookBtn = [[UIButton alloc] init];
    [moreBookBtn setImage:[UIImage imageNamed:@"home_icon_more"] forState:UIControlStateNormal];
    [moreBookBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *moreLabel = [[UIButton alloc] init];
    [moreLabel setTitle:@"更多" forState:UIControlStateNormal];
    [moreLabel setTitleColor:[UIColor colorWithHexString:@"#43c248"] forState:UIControlStateNormal];
    moreLabel.titleLabel.font = [UIFont systemFontOfSize:16.];
    moreLabel.titleLabel.textAlignment = NSTextAlignmentRight;
    [moreLabel addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [containView sd_addSubviews:@[bookCategory, sellBook, bookRanking, booksClassic]];
    [headView sd_addSubviews:@[scrollView, containView]];
//    [headView addSubview:scrollView];
//    [headView addSubview:containView];
    [titleView sd_addSubviews:@[titleLabel, moreLabel, moreBookBtn]];
    [self.view sd_addSubviews:@[headView, titleView, tableContain]];
    
    headView.sd_layout
    .topSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .heightIs(300);
    
    scrollView.sd_layout
    .topSpaceToView(headView,0)
    .rightSpaceToView(headView,0)
    .leftSpaceToView(headView,0)
    .heightIs(scrollowViewHeight);
    
    containView.sd_layout
    .topSpaceToView(scrollView,0)
    .leftSpaceToView(headView, 0)
    .rightSpaceToView(headView, 0)
    .heightIs(scrollowViewHeight + 40);
    
    CGFloat LHEIGHT = (containView.height - 24) / 2;
    CGFloat LWIDTH = (self.view.width - 24) / 2;

    
    bookCategory.sd_layout
    .topSpaceToView(containView, 8)
    .leftSpaceToView(containView, 8)
    .widthIs(LWIDTH)
    .heightIs(LHEIGHT);
    label.sd_layout
    .centerXEqualToView(bookCategory)
    .centerYEqualToView(bookCategory);
    
    sellBook.sd_layout
    .topSpaceToView(containView, 8)
    .rightSpaceToView(containView, 8)
    .heightIs(LHEIGHT)
    .widthIs(LWIDTH);
    label.sd_layout
    .centerXEqualToView(sellBook)
    .centerYEqualToView(sellBook);

    
    bookRanking.sd_layout
    .bottomSpaceToView(containView, 8)
    .leftSpaceToView(containView, 8)
    .widthIs(LWIDTH)
    .heightIs(LHEIGHT);
    label.sd_layout
    .centerXEqualToView(bookRanking)
    .centerYEqualToView(bookRanking);

    
    booksClassic.sd_layout
    .topEqualToView(bookRanking)
    .rightEqualToView(sellBook)
    .heightIs(LHEIGHT)
    .widthIs(LWIDTH);
    label.sd_layout
    .centerXEqualToView(booksClassic)
    .centerYEqualToView(booksClassic);
    
    titleView.sd_layout
    .topSpaceToView(headView, 0)
    .rightSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .heightIs(TitleViewH);
    
    tableContain.sd_layout
    .topSpaceToView(titleView, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(self.view.height);
    
    
    titleLabel.sd_layout
    .topSpaceToView(titleView,8)
    .leftSpaceToView(titleView, 8)
    .heightIs(25)
    .widthIs(100);
    
    moreBookBtn.sd_layout
    .rightSpaceToView(titleView,8)
    .topSpaceToView(titleView, 8)
    .widthIs(18)
    .heightIs(18);

    moreLabel.sd_layout
    .centerYEqualToView(moreBookBtn)
    .rightSpaceToView(moreBookBtn, 6)
    .widthIs(50)
    .heightIs(20);
    
}


//添加子控制器
- (void)setupChildViewController {
    AllBookVC *allbookVC = [[AllBookVC alloc] init];
    self.allBookVC = allbookVC;
    allbookVC.delegate = self;
    [self addChildViewController:allbookVC];
    
}


- (void)moreBtnClick {
    
    _allBookVC.tableView.scrollEnabled = YES;
    
    HEEBookListAllViewController *bookListAllVC = [[HEEBookListAllViewController alloc] init];
    [self.navigationController pushViewController: bookListAllVC animated:YES];
}

//添加相应的控制器的view到内容视图中
- (void) addChildViewInContentView:(NSInteger)index {
    UIViewController *childView = self.childViewControllers[index];
    [self.tableContain addSubview:childView.view];
    childView.view.frame = CGRectMake(index * self.view.width, OffsetY, self.view.width, self.view.height+85);
    
//    //取出要跳转的view
//    TeachingMaterialVC *teachingMaterialVC = (TeachingMaterialVC *)childView;
//    
//    //跳转时滚动到当前view的offsetY的位置
//    [self HEEScrollToChangeHeaderViewHeight:teachingMaterialVC.tableView.contentOffset.y];
}


- (void)showBookCategoryView {
    
    //书籍市场
    HEEBooksClassicViewController *booksClassicView = [[HEEBooksClassicViewController alloc] init];
    [self.navigationController pushViewController:booksClassicView animated:YES];
    
}

- (void)showSellBookView {
    //我要卖书
    HEESellBookViewController *sellBookView = [[HEESellBookViewController alloc] init];
    [self.navigationController pushViewController:sellBookView animated:YES];
}

- (void)showBookRankingView {
    //好书榜
    HEEBookRankingViewController *bookRankingView = [[HEEBookRankingViewController alloc] init];
    [self.navigationController pushViewController:bookRankingView animated:YES];
}

- (void)showBooksClassicView {
    //页面跳转 －－  书籍分类
    
    CJEBookCategoryViewController *bookCateGory = [[CJEBookCategoryViewController alloc] init];
    
    [self.navigationController pushViewController:bookCateGory animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)AllBookVCDidScroll:(CGFloat)scrollY {
//    [self HEEScrollToChangeHeaderViewHeight:scrollY];
}



// 动态计算滚动的Y值  使视图整体往上滑   [已经约束过的变量布局不再变化]
- (void)HEEScrollToChangeHeaderViewHeight:(CGFloat)scrollY{
//        NSLog(@"%f",scrollY);
    [self.view layoutIfNeeded];
    
    CGFloat offsetY = scrollY - OffsetY;
    CGFloat height = HeaderH - offsetY;
    
    if (height > HeaderH) {
        height = HeaderH;
    }
    
    if (height < 0) {
        height = 0;
        [self moreBtnClick];
    }
    
    self.headView.sd_layout
    .bottomSpaceToView(self.titleView,0)
    .leftSpaceToView(self.view,0)
    .rightEqualToView(self.view)
    .heightIs(HeaderH);
    
//    NSLog(@"%f",height);
    
    self.titleView.sd_layout
    .topSpaceToView(self.view, height)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .heightIs(TitleViewH);
    
//    NSLog(@"%f--%f--%f--%f",offsetY, height, self.titleView.frame.origin.y, self.titleView.height);
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableContain) {
        _allBookVC.tableView.scrollEnabled = NO;

    }
}

//滚动切换控制器
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.tableContain) {
        _allBookVC.tableView.scrollEnabled = YES;

    }
    
    NSInteger index = scrollView.contentOffset.x / self.view.width;
    NSMutableArray *buttonArray = [NSMutableArray array];
    for (NSInteger i = 0; i < self.titleView.subviews.count; i++) {
        UIView *button = self.titleView.subviews[i];
        if (button.class == [UIButton buttonWithType:UIButtonTypeCustom].class) {
            [buttonArray addObject:button];
        }
    }
}

@end
