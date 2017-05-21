//
//  HEESellBookViewController.m
//  taoBook
//
//  Created by apple7 on 17/3/15.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEESellBookViewController.h"
#import <Chameleon.h>

@interface HEESellBookViewController ()

@end

@implementation HEESellBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    
    self.title = [NSString stringWithFormat:@"我要卖书"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
}
- (void) settingNavContr {
    
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
