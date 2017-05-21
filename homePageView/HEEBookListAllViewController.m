//
//  HEEBookListAllViewController.m
//  taoBook
//
//  Created by apple7 on 17/3/17.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEBookListAllViewController.h"
#import "AllBookVC.h"
#import "TeachingMaterialVC.h"
#import "EnglishBookVC.h"
#import "DeceasedFatherGrindVC.h"
#import "OthersBookVC.h"
#import "titleViewsScroll.h"
#import "HEEScrollView.h"
#import <UIView+SDAutoLayout.h>
#import <Chameleon.h>

static CGFloat const TitleViewH = 40;
static CGFloat const UnderLineH = 3;
static CGFloat const OffsetY = -200;

@interface HEEBookListAllViewController ()<UIScrollViewDelegate, AllBookVCDelegate, TeachingMaterialVCDelegate, DeceasedFatherGrindVCDelegate, OthersBookVCDelegate, EnglishBookVCDelegate>

@property (strong, nonatomic) UIScrollView *titleView;                      //标题栏
@property (strong, nonatomic) titleViewsScroll *tableContain;               //内容的view
@property (strong, nonatomic) UIButton *currentSelectedBtn;                 //选中的按钮
@property (strong, nonatomic) UIView *selectedUnderLine ;                    //按钮选中时的下划线
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, weak) AllBookVC *allBookVC;                           //全部
@property (nonatomic, weak) TeachingMaterialVC *teachingMaterialVC;         //教材
@property (nonatomic, weak) EnglishBookVC *englishBookVC;                   //英语
@property (nonatomic, weak) DeceasedFatherGrindVC *deceasedFatherGrindVC;   //考研
@property (nonatomic, weak) OthersBookVC *othersBookVC;                     //其它


@end

@implementation HEEBookListAllViewController

//懒加载属性
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"全部", @"教材", @"英语", @"考研", @"其它"];
    }
    return  _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutSubViews];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupChildViewController];//添加子控制器
    
    [self setUpTitleView];//添加标题栏内容
    
    [self addChildViewInContentView:0];
    
    [self setupUnderLine];//添加标题栏下划线
    
}

- (void)settingNavContr {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"ffffff"]];

}

- (void)layoutSubViews {
    
    [self.view layoutSubviews];
    
    [self settingNavContr];
    
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
    AllBookVC *allbookVC = [[AllBookVC alloc] init];
    self.allBookVC = allbookVC;
    allbookVC.delegate = self;
    [self addChildViewController:allbookVC];
    
    TeachingMaterialVC *teachingMaterialVC = [[TeachingMaterialVC alloc] init];
    self.teachingMaterialVC = teachingMaterialVC;
    teachingMaterialVC.delegate = self;
    [self addChildViewController:teachingMaterialVC];
    
    EnglishBookVC *englishBookVC = [[EnglishBookVC alloc] init];
    self.englishBookVC = englishBookVC;
    englishBookVC.delegate = self;
    [self addChildViewController:englishBookVC];
    
    DeceasedFatherGrindVC *deceasedFatherGrindVC = [[DeceasedFatherGrindVC alloc] init];
    self.deceasedFatherGrindVC = deceasedFatherGrindVC;
    deceasedFatherGrindVC.delegate = self;
    [self addChildViewController:deceasedFatherGrindVC];
    
    OthersBookVC *othersBookVC = [[OthersBookVC alloc] init];
    self.othersBookVC = othersBookVC;
    othersBookVC.delegate = self;
    [self addChildViewController:othersBookVC];

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
    TeachingMaterialVC *teachingMaterialVC = (TeachingMaterialVC *)childView;
    
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
    _teachingMaterialVC.tableView.scrollEnabled = YES;
    _englishBookVC.tableView.scrollEnabled = YES;
    _deceasedFatherGrindVC.tableView.scrollEnabled = YES;
    _othersBookVC.tableView.scrollEnabled = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableContain) {
        _allBookVC.tableView.scrollEnabled = NO;
        _teachingMaterialVC.tableView.scrollEnabled = NO;
        _englishBookVC.tableView.scrollEnabled = NO;
        _deceasedFatherGrindVC.tableView.scrollEnabled = NO;
        _othersBookVC.tableView.scrollEnabled = NO;
    }
}

//滚动切换控制器
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.tableContain) {
        _allBookVC.tableView.scrollEnabled = YES;
        _teachingMaterialVC.tableView.scrollEnabled = YES;
        _englishBookVC.tableView.scrollEnabled = YES;
        _deceasedFatherGrindVC.tableView.scrollEnabled = YES;
        _othersBookVC.tableView.scrollEnabled = YES;
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
