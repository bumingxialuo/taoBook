//
//  ViewController.m
//  taoBook
//
//  Created by iPhone8s on 17/3/20.
//  Copyright © 2017年 iPhone8s. All rights reserved.
//

#import "CJEBookCategoryViewController.h"
#import <UIView+SDAutoLayout.h>
#import <Chameleon.h>

@interface CJEBookCategoryViewController ()

@end

@implementation CJEBookCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    [self layoutView];
    
    self.title = [NSString stringWithFormat:@"书籍分类"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"ffffff"]];
    
}

//封装函数
- (void) layoutView {
    UILabel *labe1 = [[UILabel alloc] init];
    [self.view sd_addSubviews:@[labe1]];
    labe1.backgroundColor = [UIColor colorWithRed:67.0/255.0 green:194.0/255.0 blue:72.0/255.0 alpha:1];
    
    labe1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(self.view,15)
    .widthIs(5)
    .heightIs(18);
    
    
    UILabel *lab1_1 = [[UILabel alloc] init];
    [self.view sd_addSubviews:@[lab1_1]];
    lab1_1.text = @"教材类";
    lab1_1.font = [UIFont systemFontOfSize:20];
    lab1_1.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    lab1_1.textColor = [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1];
    
    lab1_1.sd_layout
    .leftSpaceToView(labe1,8)
    .topSpaceToView(self.view,15)
    .widthIs(80)
    .heightIs(18);
    
    UIButton *A1 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[A1]];
    A1.backgroundColor = [UIColor colorWithRed:67.0/255.0 green:194.0/255.0 blue:72.0/255.0 alpha:1];
    [A1 setTitle:@"必修类" forState:UIControlStateNormal];
    //[A1 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    A1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(labe1,8)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *A1_2 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[A1_2]];
    A1_2.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [A1_2 setTitle:@"财经" forState:UIControlStateNormal];
    [A1_2 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    A1_2.sd_layout
    .leftSpaceToView(A1,21)
    .topSpaceToView(labe1,8)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *A1_3 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[A1_3]];
    A1_3.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [A1_3 setTitle:@"计算机" forState:UIControlStateNormal];
    [A1_3 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    A1_3.sd_layout
    .leftSpaceToView(A1_2,21)
    .topSpaceToView(labe1,8)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *B1 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[B1]];
    B1.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [B1 setTitle:@"经济" forState:UIControlStateNormal];
    [B1 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    B1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(A1,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *B1_2 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[B1_2]];
    B1_2.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [B1_2 setTitle:@"旅管" forState:UIControlStateNormal];
    [B1_2 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    B1_2.sd_layout
    .leftSpaceToView(B1,21)
    .topSpaceToView(A1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *B1_3 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[B1_3]];
    B1_3.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [B1_3 setTitle:@"文教" forState:UIControlStateNormal];
    [B1_3 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    B1_3.sd_layout
    .leftSpaceToView(B1_2,21)
    .topSpaceToView(A1_3,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *C1 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[C1]];
    C1.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [C1 setTitle:@"数学" forState:UIControlStateNormal];
    [C1 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    C1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(B1,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *C1_2 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[C1_2]];
    C1_2.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [C1_2 setTitle:@"艺术" forState:UIControlStateNormal];
    [C1_2 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    C1_2.sd_layout
    .leftSpaceToView(C1,21)
    .topSpaceToView(B1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *C1_3 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[C1_3]];
    C1_3.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [C1_3 setTitle:@"文教" forState:UIControlStateNormal];
    [C1_3 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    C1_3.sd_layout
    .leftSpaceToView(C1_2,21)
    .topSpaceToView(B1_3,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *D1 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[D1]];
    D1.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [D1 setTitle:@"化材" forState:UIControlStateNormal];
    [D1 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    D1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(C1,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *D1_2 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[D1_2]];
    D1_2.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [D1_2 setTitle:@"外语" forState:UIControlStateNormal];
    [D1_2 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    D1_2.sd_layout
    .leftSpaceToView(D1,21)
    .topSpaceToView(C1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *D1_3 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[D1_3]];
    D1_3.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [D1_3 setTitle:@"其他" forState:UIControlStateNormal];
    [D1_3 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    D1_3.sd_layout
    .leftSpaceToView(D1_2,21)
    .topSpaceToView(C1_3,10)
    .widthIs(101)
    .heightIs(28);
    
    UILabel *labe2 = [[UILabel alloc] init];
    [self.view sd_addSubviews:@[labe2]];
    labe2.backgroundColor = [UIColor colorWithRed:67.0/255.0 green:194.0/255.0 blue:72.0/255.0 alpha:1];
    
    labe2.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(D1,20)
    .widthIs(5)
    .heightIs(18);
    
    UILabel *lab2_1 = [[UILabel alloc] init];
    [self.view sd_addSubviews:@[lab2_1]];
    lab2_1.text = @"考试类";
    lab2_1.font = [UIFont systemFontOfSize:20];
    lab2_1.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    lab2_1.textColor = [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1];
    
    lab2_1.sd_layout
    .leftSpaceToView(labe2,8)
    .topSpaceToView(D1,20)
    .widthIs(80)
    .heightIs(18);
    
    UIButton *E1 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[E1]];
    E1.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [E1 setTitle:@"外语" forState:UIControlStateNormal];
    [E1 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    E1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(labe2,8)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *E1_2 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[E1_2]];
    E1_2.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [E1_2 setTitle:@"教师资格证" forState:UIControlStateNormal];
    [E1_2 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    E1_2.sd_layout
    .leftSpaceToView(E1,21)
    .topSpaceToView(labe2,8)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *E1_3 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[E1_3]];
    E1_3.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [E1_3 setTitle:@"计算机等级" forState:UIControlStateNormal];
    [E1_3 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    E1_3.sd_layout
    .leftSpaceToView(E1_2,21)
    .topSpaceToView(labe2,8)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *F1 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[F1]];
    F1.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [F1 setTitle:@"会计" forState:UIControlStateNormal];
    [F1 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    F1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(E1,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *F1_2 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[F1_2]];
    F1_2.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [F1_2 setTitle:@"考研" forState:UIControlStateNormal];
    [F1_2 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    F1_2.sd_layout
    .leftSpaceToView(F1,21)
    .topSpaceToView(E1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *F1_3 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[F1_3]];
    F1_3.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [F1_3 setTitle:@"公务员" forState:UIControlStateNormal];
    [F1_3 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    F1_3.sd_layout
    .leftSpaceToView(F1_2,21)
    .topSpaceToView(E1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *G1 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[G1]];
    G1.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [G1 setTitle:@"导游证" forState:UIControlStateNormal];
    [G1 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    G1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(F1,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *G1_2 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[G1_2]];
    G1_2.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [G1_2 setTitle:@"艺术/体育" forState:UIControlStateNormal];
    [G1_2 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    G1_2.sd_layout
    .leftSpaceToView(G1,21)
    .topSpaceToView(F1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *G1_3 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[G1_3]];
    G1_3.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [G1_3 setTitle:@"医药" forState:UIControlStateNormal];
    [G1_3 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    G1_3.sd_layout
    .leftSpaceToView(G1_2,21)
    .topSpaceToView(F1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *H1 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[H1]];
    H1.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [H1 setTitle:@"普通话" forState:UIControlStateNormal];
    [H1 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    H1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(G1,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *H1_2 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[H1_2]];
    H1_2.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [H1_2 setTitle:@"建筑工程" forState:UIControlStateNormal];
    [H1_2 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    H1_2.sd_layout
    .leftSpaceToView(H1,21)
    .topSpaceToView(G1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *H1_3 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[H1_3]];
    H1_3.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [H1_3 setTitle:@"其他" forState:UIControlStateNormal];
    [H1_3 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    H1_3.sd_layout
    .leftSpaceToView(H1_2,21)
    .topSpaceToView(G1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UILabel *labe3 = [[UILabel alloc] init];
    [self.view sd_addSubviews:@[labe3]];
    labe3.backgroundColor = [UIColor colorWithRed:67.0/255.0 green:194.0/255.0 blue:72.0/255.0 alpha:1];
    
    labe3.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(H1,20)
    .widthIs(5)
    .heightIs(18);
    
    UILabel *lab3_1 = [[UILabel alloc] init];
    //字体自适应
    lab3_1.adjustsFontSizeToFitWidth = YES;
    [self.view sd_addSubviews:@[lab3_1]];
    lab3_1.text = @"课外读物";
    lab3_1.font = [UIFont systemFontOfSize:20];
    //lab3_1.backgroundColor = [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:0.5];
    lab3_1.textColor = [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1];
    
    lab3_1.sd_layout
    .leftSpaceToView(labe3,8)
    .topSpaceToView(H1,20)
    .widthIs(80)
    .heightIs(18);
    
    UIButton *I1 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[I1]];
    I1.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [I1 setTitle:@"文学" forState:UIControlStateNormal];
    [I1 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    I1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(labe3,8)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *I1_2 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[I1_2]];
    I1_2.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [I1_2 setTitle:@"散文/诗集" forState:UIControlStateNormal];
    [I1_2 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    I1_2.sd_layout
    .leftSpaceToView(I1,21)
    .topSpaceToView(labe3,8)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *I1_3 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[I1_3]];
    I1_3.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [I1_3 setTitle:@"小说" forState:UIControlStateNormal];
    [I1_3 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    I1_3.sd_layout
    .leftSpaceToView(I1_2,21)
    .topSpaceToView(labe3,8)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *J1 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[J1]];
    J1.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [J1 setTitle:@"励志/成功" forState:UIControlStateNormal];
    [J1 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    J1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(I1,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *J1_2 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[J1_2]];
    J1_2.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [J1_2 setTitle:@"科技" forState:UIControlStateNormal];
    [J1_2 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    J1_2.sd_layout
    .leftSpaceToView(J1,21)
    .topSpaceToView(I1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *J1_3 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[J1_3]];
    J1_3.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [J1_3 setTitle:@"历史" forState:UIControlStateNormal];
    [J1_3 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    J1_3.sd_layout
    .leftSpaceToView(J1_2,21)
    .topSpaceToView(I1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *K1 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[K1]];
    K1.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [K1 setTitle:@"生活" forState:UIControlStateNormal];
    [K1 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    K1.sd_layout
    .leftSpaceToView(self.view,8)
    .topSpaceToView(J1,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *K1_2 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[K1_2]];
    K1_2.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [K1_2 setTitle:@"文艺" forState:UIControlStateNormal];
    [K1_2 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    K1_2.sd_layout
    .leftSpaceToView(K1,21)
    .topSpaceToView(J1_2,10)
    .widthIs(101)
    .heightIs(28);
    
    UIButton *K1_3 = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[K1_3]];
    K1_3.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1];
    [K1_3 setTitle:@"其他" forState:UIControlStateNormal];
    [K1_3 setTitleColor:[UIColor colorWithRed:145.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1] forState:UIControlStateNormal];
    
    K1_3.sd_layout
    .leftSpaceToView(K1_2,21)
    .topSpaceToView(J1_2,10)
    .widthIs(101)
    .heightIs(28);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
