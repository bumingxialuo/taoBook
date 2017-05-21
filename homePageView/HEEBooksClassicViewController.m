//
//  HEEBooksClassicViewController.m
//  taoBook
//
//  Created by apple7 on 17/3/15.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEBooksClassicViewController.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>
#import "titleViewsScroll.h"
#import "AllBookVC.h"
#import "TeachingMaterialVC.h"
#import "HEEScreenContainView.h"
#import "HEENavSeachVC.h"

static CGFloat const TitleViewH = 40;
static CGFloat const UnderLineH = 3;
static CGFloat const OffsetY = -200;

@interface HEEBooksClassicViewController ()<UIScrollViewDelegate,TeachingMaterialVCDelegate>

@property (strong, nonatomic) UIScrollView *titleView;                      //标题栏
@property (strong, nonatomic) titleViewsScroll *tableContain;               //内容的view
@property (strong, nonatomic) UIButton *currentSelectedBtn;                 //选中的按钮
@property (strong, nonatomic) UIView *selectedUnderLine ;                    //按钮选中时的下划线
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, weak) TeachingMaterialVC *allBookVC;                           //全部
@property (nonatomic, weak) TeachingMaterialVC *rekeaseLatestVC;                     //最新发布
@property (nonatomic, weak) TeachingMaterialVC *precedenceLowVC;                     //低价优先

@end

@implementation HEEBooksClassicViewController

//懒加载属性
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"全部", @"最新发布", @"低价优先"];
    }
    return  _titleArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    
    [self layoutSubViews];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupChildViewController];//添加子控制器
    
    [self setUpTitleView];//添加标题栏内容
    
    [self addChildViewInContentView:0];
    
    [self setupUnderLine];//添加标题栏下划线

}

- (void)layoutNav {
    self.title = [NSString stringWithFormat:@"书籍市场"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
    
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"ffffff"]];
//
//    UIBarButtonItem *screeningBarBtn = [[UIBarButtonItem alloc] init];
//    [screeningBarBtn setImage:[UIImage imageNamed:@"sjsc_icon_screen"]];
//    
//    UIBarButtonItem *seachBarBtn = [[UIBarButtonItem alloc] init];
//    [seachBarBtn setImage:[UIImage imageNamed:@"home_icon_sreach"]];
    
    //为导航栏添加右侧按钮1
    UIBarButtonItem *screeningBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"sjsc_icon_screen"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(screeningBarBtnAction)];
    
    //为导航栏添加右侧按钮2
    UIBarButtonItem *seachBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"home_icon_sreach"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(seachBarBtnAction)];
    
//    UIButton *screeningBarBtn = [[UIButton alloc] init];
//    [screeningBarBtn setImage:[UIImage imageNamed:@"sjsc_icon_screen"] forState:UIControlStateNormal];
//    [screeningBarBtn addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
//    [screeningBarBtn addTarget:self action:@se forControlEvents:<#(UIControlEvents)#>]
    
    NSArray *arr=[[NSArray alloc]initWithObjects:screeningBarBtn, seachBarBtn, nil];
    
    self.navigationItem.rightBarButtonItems=arr;

}

- (void)layoutSubViews {
    [self layoutNav];
    
    [self.view layoutSubviews];
    
    //标题栏
    UIScrollView *titleView = [[UIScrollView alloc] init];
    self.titleView = titleView;
    titleView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    
    //内容的view
    titleViewsScroll *tableContain = [[titleViewsScroll alloc] init];
    self.tableContain = tableContain;
    tableContain.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    tableContain.pagingEnabled = YES;
    tableContain.bounces = self;
    tableContain.delegate = self;
    tableContain.contentSize = CGSizeMake(self.titleArray.count * self.view.width, 0);
    
    [self.view sd_addSubviews:@[titleView,tableContain]];
    
    titleView.sd_layout
    .topSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .heightIs(TitleViewH);
    
    tableContain.sd_layout
    .topSpaceToView(titleView, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(self.view.height);
}

- (void)setupChildViewController {
    TeachingMaterialVC *allbookVC = [[TeachingMaterialVC alloc] init];
    self.allBookVC = allbookVC;
    allbookVC.delegate = self;
    [self addChildViewController:allbookVC];
    
    TeachingMaterialVC *rekeaseLatestVC = [[TeachingMaterialVC alloc] init];
    self.rekeaseLatestVC = rekeaseLatestVC;
    rekeaseLatestVC.delegate = self;
    [self addChildViewController:rekeaseLatestVC];
    
    TeachingMaterialVC *precedenceLowVC = [[TeachingMaterialVC alloc] init];
    self.precedenceLowVC = precedenceLowVC;
    precedenceLowVC.delegate = self;
    [self addChildViewController:precedenceLowVC];

}

- (void)setUpTitleView {
    NSInteger count = self.titleArray.count;
    for (NSInteger i = 0; i < count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = [UIFont systemFontOfSize: 15];
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        [btn setTitle:_titleArray[i] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"43c248"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat btnW = self.view.width / _titleArray.count;
        CGFloat btnH = TitleViewH;
        CGFloat btnX = i * btnW;
        btn.tag = i;
        //        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        [self.titleView addSubview:btn];
        
        btn.sd_layout
        .topSpaceToView(_titleView, 0)
        .leftSpaceToView(_titleView, btnX)
        .widthIs(btnW)
        .heightIs(btnH);
        
        
        if (0 == i) {
            [self titleBtnClick:btn];
        }
    }
}

//添加相应的控制器的view到内容视图中
- (void) addChildViewInContentView:(NSInteger)index {
    UIViewController *childView = self.childViewControllers[index];
    [self.tableContain addSubview:childView.view];
    childView.view.frame = CGRectMake(index * self.view.width, OffsetY, self.view.width, self.view.height + 200);
    
    //取出要跳转的view
//    AllBookVC *teachingMaterialVC = (AllBookVC *)childView;
    
    //跳转时滚动到当前view的offsetY的位置
    //    [self HEEScrollToChangeHeaderViewHeight:teachingMaterialVC.tableView.contentOffset.y];
}

- (void)setupUnderLine {
    UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    selectButton = self.titleView.subviews.firstObject;
    UIView *underline = [[UIView alloc] init];
    CGFloat underlineH = 1;
    CGFloat underlineW =  self.view.width / [self titleArray].count;
    CGFloat underlineX = 0;
    CGFloat underlineY = TitleViewH - UnderLineH;
    underline.frame = CGRectMake(underlineX, underlineY, underlineW, underlineH);
    //设置下划线的颜色,根随按钮选中的颜色一致
    underline.backgroundColor = [selectButton titleColorForState:UIControlStateSelected];
    [self.titleView addSubview:underline];
    self.selectedUnderLine = underline;
    
    [selectButton.titleLabel sizeToFit];
    selectButton.selected = YES;
    self.currentSelectedBtn = selectButton;
    
    self.selectedUnderLine.width = selectButton.titleLabel.width + 10;
    self.selectedUnderLine.centerX = selectButton.centerX;

    
}

- (void)titleBtnClick :(UIButton *)button {
    self.currentSelectedBtn.selected = NO;
    button.selected = YES;
    self.currentSelectedBtn = button;
    
    NSInteger index = button.tag;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.selectedUnderLine.width = button.titleLabel.width + 10;
        self.selectedUnderLine.centerX = button.centerX;
    } completion:nil];
    self.tableContain.contentOffset = CGPointMake(index * self.view.width, 0);
    [self addChildViewInContentView:index];
    
    _allBookVC.tableView.scrollEnabled = YES;
    _rekeaseLatestVC.tableView.scrollEnabled = YES;
    _precedenceLowVC.tableView.scrollEnabled = YES;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableContain) {
        _allBookVC.tableView.scrollEnabled = NO;
        _rekeaseLatestVC.tableView.scrollEnabled = NO;
        _precedenceLowVC.tableView.scrollEnabled = NO;
        
    }
}

//滚动切换控制器
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.tableContain) {
        _allBookVC.tableView.scrollEnabled = YES;
        _rekeaseLatestVC.tableView.scrollEnabled = YES;
        _precedenceLowVC.tableView.scrollEnabled = YES;
        
    }
    
    NSInteger index = scrollView.contentOffset.x / self.view.width;
    NSMutableArray *buttonArray = [NSMutableArray array];
    for (NSInteger i = 0; i < self.titleView.subviews.count; i++) {
        UIView *button = self.titleView.subviews[i];
        if (button.class == [UIButton buttonWithType:UIButtonTypeCustom].class) {
            [buttonArray addObject:button];
        }
    }
    
    UIButton *button = buttonArray[index];
    NSLog(@"%ld",(long)button.tag);
    [self titleBtnClick:button];
}


//导航栏筛选按钮
- (void)screeningBarBtnAction {
    [self layoutScreeningView];
}

- (void)layoutScreeningView {
    HEEScreenContainView *contain = [[HEEScreenContainView alloc] init];
    contain.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    [self.view addSubview:contain];
    contain.sd_layout.topSpaceToView(self.view, 0)
    .centerXEqualToView(self.view)
    .widthIs(345)
    .heightIs(154);
    
    //实现当执行三个按钮点击后视图隐藏
    if ([contain respondsToSelector:@selector(bookCateBtnClick:)]
        &&[contain respondsToSelector:@selector(cateSaleBtnClick:)]
        && [contain respondsToSelector:@selector(personSuiteBtnClick)]) {
        
        NSLog(@"方法都执行，隐藏筛选视图");
        [contain isHidden];
    }
}

//导航栏搜索按钮
- (void)seachBarBtnAction {
    HEENavSeachVC *navSeachVC = [[HEENavSeachVC alloc] init];
    [self.navigationController pushViewController:navSeachVC animated:YES];
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
