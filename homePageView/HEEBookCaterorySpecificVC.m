//
//  HEEBookCaterorySpecificVC.m
//  taoBook
//
//  Created by apple7 on 17/3/18.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEBookCaterorySpecificVC.h"
#import <Chameleon.h>

@interface HEEBookCaterorySpecificVC ()

@end

@implementation HEEBookCaterorySpecificVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)layoutNav {
//    self.title = [NSString stringWithFormat:@""];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"ffffff"]];
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
