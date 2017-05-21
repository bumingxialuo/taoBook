//
//  HEENavSeachVC.m
//  taoBook
//
//  Created by apple7 on 17/3/24.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEENavSeachVC.h"

@interface HEENavSeachVC ()<UISearchResultsUpdating, UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *seachC;

@end

@implementation HEENavSeachVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    
    [self setNavStyle];
}

- (void)setNavStyle {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
    CGRect mainViewBounds = self.navigationController.view.bounds;
    UISearchBar *seachC = [[UISearchBar alloc] initWithFrame:CGRectMake(CGRectGetWidth(mainViewBounds)/2-((CGRectGetWidth(mainViewBounds)-120)/2), CGRectGetMinY(mainViewBounds)+22, CGRectGetWidth(mainViewBounds)-120, 40)];
    self.seachC = seachC;
    seachC.delegate = self;
    seachC.showsCancelButton = NO;
    seachC.searchBarStyle = UISearchBarStyleMinimal;
    [self.navigationController.view addSubview: seachC];
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
