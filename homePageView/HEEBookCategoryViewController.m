//
//  HEEBookCategoryViewController.m
//  taoBook
//
//  Created by apple7 on 17/3/15.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEBookCategoryViewController.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>
#import "HEEBookCaterorySpecificVC.h"
#import "HEECategoryContain.h"
#import "HEECategoryButton.h"

#define buttonW ([UIScreen mainScreen].bounds.size.width - 56) / 3
static CGFloat const buttonH = 32.;

@interface HEEBookCategoryViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *bookCategoryContain;        //所有子视图的底层视图
@property (nonatomic, strong) NSArray<HEECategoryContain *> *cateContainArray;

@property (nonatomic, strong) NSDictionary *categoryDic;                //数据源 可能静态，可能动态获取 ［考虑json解析情况］
@property (nonatomic, strong) NSMutableArray *categoryTitleMArray;              //分类标题
@property (nonatomic, strong) NSMutableArray *categorySpecificMArray;             //具体的分类


@end

@implementation HEEBookCategoryViewController


//懒加载，不会出现视图
//- (NSDictionary *)categoryDic {
//    if (!_categoryDic) {
//        _categoryDic = @{@"教材类":@[@"必修类",@"财经",@"计算机",@"经济",
//                                  @"旅馆",@"文教",@"数学",@"艺术",
//                                  @"机电",@"化材",@"外语",@"其它"],
//                         @"考试类":@[@"外语",@"教师资格证",@"计算机等级",@"会计",
//                                  @"考研",@"公务员",@"导游证",@"艺术/体育",
//                                  @"医药",@"普通话",@"建筑工程",@"其它"],
//                         @"课外读物":@[@"文学",@"散文/诗集",@"小说",@"励志/成功",
//                                   @"科技",@"历史",@"生活",@"文艺",
//                                   @"其它"],
//                         @"测试":@[@"万一",@"这是",@"动态",@"变化",
//                               @"从",@"数据库",@"获取",@"方便",
//                               @"修改"],
//                         @"滑动视图":@[@"外语",@"教师资格证",@"计算机等级",@"测试",
//                               @"测试",@"测试",@"测试",@"测试",
//                               @"测试"]
//                         };
//    }
//    return _categoryDic;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithWhite:1. alpha:1.0];
    [self categoryHandleData];
    
    [self layoutSubViews];
    
}

- (void)categoryHandleData {
    if (_categoryDic == NULL) {
        _categoryDic = @{@"教材类":            @[@"必修类",@"财经",@"计算机",@"经济",
                                              @"旅馆",@"文教",@"数学",@"艺术",
                                              @"机电",@"化材",@"外语",@"其它"],
                         @"考试类":            @[@"外语",@"教师资格证",@"计算机等级",@"会计",
                                              @"考研",@"公务员",@"导游证",@"艺术/体育",
                                              @"医药",@"普通话",@"建筑工程",@"其它"],
                         @"课外读物":           @[@"文学",@"散文/诗集",@"小说",@"励志/成功",
                                              @"科技",@"历史",@"生活",@"文艺", @"其它"],
                         @"测试":                 @[@"万一",@"这是",@"动态",@"变化",
                                                  @"从",@"数据库",@"获取",@"方便",@"修改"],
                         @"滑动视图":           @[@"外语",@"教师资格证",@"计算机等级",@"测试",
                                              @"测试",@"测试",@"测试",@"测试",@"测试"]
                         };
    }
    
}

- (void) layoutNav {
    self.title = [NSString stringWithFormat:@"书籍分类"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"ffffff"]];
}

- (void) layoutSubViews {
//    [self.view layoutSubviews];
    [self layoutNav];
    
    UIScrollView *bookCateroryScroll = [[UIScrollView alloc] init];
    self.bookCategoryContain = bookCateroryScroll;
    bookCateroryScroll.backgroundColor = [UIColor yellowColor];
    bookCateroryScroll.pagingEnabled = YES;
    bookCateroryScroll.bounces = self;
    bookCateroryScroll.delegate = self;
    bookCateroryScroll.contentSize = CGSizeMake(self.view.width, self.view.height * _categoryDic.allKeys.count);
    bookCateroryScroll.width = self.view.width;
    bookCateroryScroll.height = self.view.height;
    
    NSMutableArray *categoryTitleMArray = [[NSMutableArray alloc] init];
    self.categoryTitleMArray = categoryTitleMArray;
    NSMutableArray *categorySpecificMArray = [[NSMutableArray alloc] init];
    self.categorySpecificMArray = categorySpecificMArray;
    
    NSArray<HEECategoryContain *> *cateContainArray = @[[[HEECategoryContain alloc] init]];
    self.cateContainArray = cateContainArray;
    
    //从数据源字典中获取值，创建button，
    for (NSString *categoryTitle in [_categoryDic allKeys]) {
        [categoryTitleMArray addObject:categoryTitle];
//        NSLog(@"categoryTitle  %@",categoryTitle);
        
    }
    NSArray *titleArray = categoryTitleMArray;
    for (int i = 0; i < titleArray.count; i ++) {
        
        
        NSString *key = titleArray[i];
        
        HEECategoryContain *cateContain = [[HEECategoryContain alloc] init];
        cateContain.cateTiltleLabel.text = key;
        [cateContainArray arrayByAddingObject:cateContain];
        
        
        NSArray *valueArray = _categoryDic[key];
//        NSLog(@"valueArray %@",valueArray[3]);
        
        NSArray<HEECategoryButton *> *cateBtn = @[[[HEECategoryButton alloc] init]];
        
        
        for (int j = 0; j < valueArray.count; j++) {
            NSLog(@"%@",valueArray[j]);
            [categorySpecificMArray addObject:valueArray[j]];
            HEECategoryButton *button = [[HEECategoryButton alloc] init];
            button.titleLabel.text = valueArray[j];
            button.tag = 100 * i + j;//假定每个大类别里的小类别的个数不超过99；
            
            [button addTarget:self action:@selector(categoryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cateBtn arrayByAddingObject:button];
            [cateContain sd_addSubviews:@[cateBtn]];
            NSLog(@"cateBtn   %lu", cateBtn.count);
            NSLog(@"button height  %f",button.height);
            cateBtn[0].sd_layout
            .topSpaceToView(cateContain, 8 + (buttonH+10) * floor(j/3))
            .leftSpaceToView(cateContain, 8 + (buttonW+20) * (j%3))
            .heightIs(buttonH)
            .widthIs(buttonW);
        }
        NSLog(@"%@",cateContain);
//        [cateContain sd_addSubviews:cateBtn];
        [bookCateroryScroll sd_addSubviews:@[cateContainArray]];
        NSLog(@"cateContainArr  %lu", (unsigned long)cateContainArray.count);
        
        cateContainArray[0].sd_layout
        .topSpaceToView(bookCateroryScroll, 46 + (buttonH + 10) * ceil(valueArray.count / 3))
        .leftSpaceToView(bookCateroryScroll, 0)
        .rightSpaceToView(bookCateroryScroll, 0);
    }
    
    [self.view sd_addSubviews:@[bookCateroryScroll]];
//    [bookCateroryScroll sd_addSubviews: cateContainArray];
    
    bookCateroryScroll.sd_layout
    .topSpaceToView(self.view, 0)
    .rightEqualToView(self.view)
    .leftEqualToView(self.view);
    
//    for (HEECategoryContain *contain in cateContainArray) {
//        contain.sd_layout
//        .leftSpaceToView(bookCateroryScroll, 0)
//        .rightSpaceToView(bookCateroryScroll, 0)
//        .topSpaceToView(bookCateroryScroll, 0);
//        NSLog(@"contain 布局执行");
//        
//        for (HEECategoryButton *cateBtn in contain.subviews) {
//            cateBtn.sd_layout
//            .topSpaceToView(contain, 10)
//            .leftSpaceToView(contain, 8);
//            NSLog(@"cate 布局执行");
//        }
//    }
}


//每个小按钮的点击事件，出现一个新的视图 可以通过button的tag识别不同的类别 传入不同的参数 出现数据不同的相同视图
- (void)categoryBtnClick: (UIButton *)button {
    
    [UIView animateWithDuration:0.25 animations:^{
        
        HEEBookCaterorySpecificVC *bookCaterorySpecific = [[HEEBookCaterorySpecificVC alloc] init];
        
        [self.navigationController pushViewController: bookCaterorySpecific animated:YES];
    }];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.bookCategoryContain) {
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
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
