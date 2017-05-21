//
//  HEEMyInfoViewController.m
//  taoBook
//
//  Created by apple7 on 17/3/19.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEMyInfoViewController.h"
#import "HEEWaterWaveView.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>
#import "HEEMyInfoSettingView.h"

@interface HEEMyInfoViewController()

@end

@implementation HEEMyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layOutWaveWaterView];
    
    [self layoutSettingView];
}

- (void)layOutWaveWaterView {
    HEEWaterWaveView *waterWaveView = [[HEEWaterWaveView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 170)];
    [self.view addSubview:waterWaveView];
    
    UIImageView *headIMG = [[UIImageView alloc] init];
    headIMG.layer.cornerRadius = 52/2;
    headIMG.layer.masksToBounds = YES;
    headIMG.layer.borderWidth = 1.0;
    headIMG.layer.borderColor = [UIColor colorWithHexString:@"43c248"].CGColor;
    headIMG.backgroundColor = [UIColor colorWithHexString:@"9a9a9a"];
    headIMG.image = [UIImage imageNamed:@"-xyd_img_headphoto"];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"小明";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor colorWithHexString:@"43c248"];
    nameLabel.font = [UIFont systemFontOfSize:18];
    
    UIImageView *sexIMG = [[UIImageView alloc] init];
    sexIMG.image = [UIImage imageNamed:@"home_icon_boy"];
    
    UIButton *editBtn = [[UIButton alloc] init];
    editBtn.titleLabel.text = @"编辑";
//    editBtn.backgroundColor = [UIColor colorWithHexString:@"979797"];
    
    [editBtn setImage:[UIImage imageNamed:@"my_icon_edit"] forState:UIControlStateNormal];
    
    [editBtn addTarget:self action:@selector(editSelfInfo) forControlEvents:UIControlEventTouchUpInside];
    
    [waterWaveView sd_addSubviews:@[headIMG, nameLabel, sexIMG, editBtn]];
    
    headIMG.sd_layout
    .topSpaceToView(waterWaveView, 40)
    .leftSpaceToView(waterWaveView, 42)
    .widthIs(52)
    .heightIs(52);
    
    nameLabel.sd_layout
    .centerYEqualToView(headIMG)
    .leftSpaceToView(headIMG, 10)
    .widthIs(50)
    .heightIs(18);
    
    sexIMG.sd_layout
    .centerYEqualToView(headIMG)
    .leftSpaceToView(nameLabel, 0)
    .widthIs(10)
    .heightIs(10);
    
    editBtn.sd_layout
    .centerYEqualToView(headIMG)
    .leftSpaceToView(sexIMG, 5)
    .heightIs(20)
    .widthIs(20);
}

- (void)layoutSettingView {
    
    [self settingNavContr];
    
    UIView *myInfoContain = [[UIView alloc] init];
    myInfoContain.backgroundColor = [UIColor colorWithHexString:@"f1f1f1"];
    
    UIView *listContain1 = [[UIView alloc] init];
    listContain1.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    
    UIView *listLine1 = [[UIView alloc] init];
    listLine1.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    UIImageView *IMG1 = [[UIImageView alloc] init];
//    IMG1.backgroundColor = [UIColor colorWithHexString:@"43c248"];
    IMG1.image = [UIImage imageNamed:@"my_icon_message"];
    UILabel *lable1 = [[UILabel alloc] init];
    lable1.text = @"我的消息";
    lable1.textColor = [UIColor colorWithHexString:@"323232"];
    lable1.textAlignment = NSTextAlignmentLeft;
    lable1.font = [UIFont systemFontOfSize:16];
    UIImageView *dot1 = [[UIImageView alloc] init];
    dot1.backgroundColor = [UIColor colorWithHexString:@"e66e27"];
    dot1.layer.cornerRadius = 9.;
    UIButton *btn1 = [[UIButton alloc] init];
    btn1.tag = 101;
//    btn1.backgroundColor = [UIColor colorWithHexString:@"9a9a9a"];
    [btn1 setImage:[UIImage imageNamed:@"my_icon_go"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(myInfoViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *listContain2 = [[UIView alloc] init];
    listContain2.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    
    UIView *listLine2 = [[UIView alloc] init];
    listLine2.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    UIImageView *IMG2 = [[UIImageView alloc] init];
//    IMG2.backgroundColor = [UIColor colorWithHexString:@"43c248"];
    IMG2.image = [UIImage imageNamed:@"my_icon_book"];
    UILabel *lable2 = [[UILabel alloc] init];
    lable2.text = @"我的商品";
    lable2.textColor = [UIColor colorWithHexString:@"323232"];
    lable2.textAlignment = NSTextAlignmentLeft;
    lable2.font = [UIFont systemFontOfSize:16];
    UIImageView *dot2 = [[UIImageView alloc] init];
    dot2.backgroundColor = [UIColor colorWithHexString:@"e66e27"];
    dot2.layer.cornerRadius = 9.;
    UIButton *btn2 = [[UIButton alloc] init];
//    btn2.backgroundColor = [UIColor colorWithHexString:@"9a9a9a"];
    btn2.tag = 102;
    [btn2 setImage:[UIImage imageNamed:@"my_icon_go"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(myInfoViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *listContain3 = [[UIView alloc] init];
    listContain3.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    
    UIView *listLine3 = [[UIView alloc] init];
    listLine3.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    UIImageView *IMG3 = [[UIImageView alloc] init];
//    IMG3.backgroundColor = [UIColor colorWithHexString:@"43c248"];
    IMG3.image = [UIImage imageNamed:@"my_icon_wishlist"];
    UILabel *lable3 = [[UILabel alloc] init];
    lable3.text = @"我的心愿单";
    lable3.textColor = [UIColor colorWithHexString:@"323232"];
    lable3.textAlignment = NSTextAlignmentLeft;
    lable3.font = [UIFont systemFontOfSize:16];
    UIImageView *dot3 = [[UIImageView alloc] init];
    dot3.backgroundColor = [UIColor colorWithHexString:@"e66e27"];
    dot3.layer.cornerRadius = 9.;
    UIButton *btn3 = [[UIButton alloc] init];
    btn3.tag = 103;
//    btn3.backgroundColor = [UIColor colorWithHexString:@"9a9a9a"];
    [btn3 setImage:[UIImage imageNamed:@"my_icon_go"] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(myInfoViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    UIView *listContain4 = [[UIView alloc] init];
//    listContain4.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
//    
//    UIView *listLine4 = [[UIView alloc] init];
//    listLine4.backgroundColor = [UIColor colorWithHexString:@"999999"];
//    
//    UIImageView *IMG4 = [[UIImageView alloc] init];
////    IMG4.backgroundColor = [UIColor colorWithHexString:@"43c248"];
//    IMG4.image = [UIImage imageNamed:@"my_icon_wishlist"];
//    UILabel *lable4 = [[UILabel alloc] init];
//    lable4.text = @"我的收藏";
//    lable4.textColor = [UIColor colorWithHexString:@"323232"];
//    lable4.textAlignment = NSTextAlignmentLeft;
//    lable4.font = [UIFont systemFontOfSize:16];
//    UIImageView *dot4 = [[UIImageView alloc] init];
//    dot4.backgroundColor = [UIColor colorWithHexString:@"e66e27"];
//    UIButton *btn4 = [[UIButton alloc] init];
////    btn4.backgroundColor = [UIColor colorWithHexString:@"9a9a9a"];
//    [btn4 setImage:[UIImage imageNamed:@"my_icon_go"] forState:UIControlStateNormal];
//    [btn4 addTarget:self action:@selector(myInfoViewBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *listContain5 = [[UIView alloc] init];
    listContain5.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    
    UIView *listLine5 = [[UIView alloc] init];
    listLine5.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    UIImageView *IMG5 = [[UIImageView alloc] init];
//    IMG5.backgroundColor = [UIColor colorWithHexString:@"43c248"];
    IMG5.image = [UIImage imageNamed:@"my_iicon_set"];
    UILabel *lable5 = [[UILabel alloc] init];
    lable5.text = @"设置";
    lable5.textColor = [UIColor colorWithHexString:@"323232"];
    lable5.textAlignment = NSTextAlignmentLeft;
    lable5.font = [UIFont systemFontOfSize:16];
    UIImageView *dot5 = [[UIImageView alloc] init];
    dot5.backgroundColor = [UIColor colorWithHexString:@"e66e27"];
    dot5.layer.cornerRadius = 9.;
    UIButton *btn5 = [[UIButton alloc] init];
//    btn5.backgroundColor = [UIColor colorWithHexString:@"9a9a9a"];
    btn5.tag = 105;
    [btn5 setImage:[UIImage imageNamed:@"my_icon_go"] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(myInfoViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *listContain6 = [[UIView alloc] init];
    listContain6.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    
    UIView *listLine6 = [[UIView alloc] init];
    listLine6.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    UIImageView *IMG6 = [[UIImageView alloc] init];
//    IMG6.backgroundColor = [UIColor colorWithHexString:@"43c248"];
    IMG6.image = [UIImage imageNamed:@"my_icon_opinion"];
    UILabel *lable6 = [[UILabel alloc] init];
    lable6.text = @"意见反馈";
    lable6.textColor = [UIColor colorWithHexString:@"323232"];
    lable6.textAlignment = NSTextAlignmentLeft;
    lable6.font = [UIFont systemFontOfSize:16];
    UIImageView *dot6 = [[UIImageView alloc] init];
    dot6.backgroundColor = [UIColor colorWithHexString:@"e66e27"];
    UIButton *btn6 = [[UIButton alloc] init];
    dot6.layer.cornerRadius = 9.;
//    btn6.backgroundColor = [UIColor colorWithHexString:@"9a9a9a"];
    btn6.tag = 106;
    [btn6 setImage:[UIImage imageNamed:@"my_icon_go"] forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(myInfoViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view sd_addSubviews:@[myInfoContain]];
    [myInfoContain sd_addSubviews:@[listLine1,listLine2,listLine3,listLine5,listLine6,
                                    listContain1,listContain2,listContain3,listContain5,listContain6]];
    
    [listContain1 sd_addSubviews:@[IMG1,lable1,dot1,btn1]];
    [listContain2 sd_addSubviews:@[IMG2,lable2,dot2,btn2]];
    [listContain3 sd_addSubviews:@[IMG3,lable3,dot3,btn3]];
//    [listContain4 sd_addSubviews:@[IMG4,lable4,dot4,btn4]];
    [listContain5 sd_addSubviews:@[IMG5,lable5,dot5,btn5]];
    [listContain6 sd_addSubviews:@[IMG6,lable6,dot6,btn6]];
    
    
    myInfoContain.sd_layout.topSpaceToView(self.view, 170)
                            .leftEqualToView(self.view)
                            .rightEqualToView(self.view)
                            .bottomEqualToView(self.view);
    
    listContain1.sd_layout.topSpaceToView(myInfoContain,10)
                            .rightSpaceToView(myInfoContain,0)
                            .leftSpaceToView(myInfoContain, 0)
                            .heightIs(44);
    listLine1.sd_layout.topSpaceToView(listContain1, 0)
                            .leftSpaceToView(myInfoContain, 8)
                            .rightSpaceToView(myInfoContain, 8)
                            .heightIs(0.5);
    
    listContain2.sd_layout.topSpaceToView(listLine1,0)
                            .rightSpaceToView(myInfoContain,0)
                            .leftSpaceToView(myInfoContain, 0)
                            .heightIs(44);
    listLine2.sd_layout.topSpaceToView(listContain2, 0)
                            .leftSpaceToView(myInfoContain, 8)
                            .rightSpaceToView(myInfoContain, 8)
                            .heightIs(0.5);
    
    listContain3.sd_layout.topSpaceToView(listLine2,0)
                            .rightSpaceToView(myInfoContain,0)
                            .leftSpaceToView(myInfoContain, 0)
                            .heightIs(44);
    listLine3.sd_layout.topSpaceToView(listContain3, 0)
                            .leftSpaceToView(myInfoContain, 8)
                            .rightSpaceToView(myInfoContain, 8)
                            .heightIs(0.5);
    
//    listContain4.sd_layout.topSpaceToView(listLine3,0)
//                            .rightSpaceToView(myInfoContain,0)
//                            .leftSpaceToView(myInfoContain, 0)
//                            .heightIs(44);
//    listLine4.sd_layout.topSpaceToView(listContain4, 0)
//                            .leftSpaceToView(myInfoContain, 8)
//                            .rightSpaceToView(myInfoContain, 8)
//                            .heightIs(0.5);
    
    listContain5.sd_layout.topSpaceToView(listLine3,0)
                            .rightSpaceToView(myInfoContain,0)
                            .leftSpaceToView(myInfoContain, 0)
                            .heightIs(44);
    listLine5.sd_layout.topSpaceToView(listContain5, 0)
                            .leftSpaceToView(myInfoContain, 8)
                            .rightSpaceToView(myInfoContain, 8)
                            .heightIs(0.5);
    
    listContain6.sd_layout.topSpaceToView(listLine5,0)
                            .rightSpaceToView(myInfoContain,0)
                            .leftSpaceToView(myInfoContain, 0)
                            .heightIs(44);
    listLine6.sd_layout.topSpaceToView(listContain6, 0)
                            .leftSpaceToView(myInfoContain, 8)
                            .rightSpaceToView(myInfoContain, 8)
                            .heightIs(0.5);
    
    IMG1.sd_layout.leftSpaceToView(listContain1,20)
                    .topSpaceToView(listContain1,10)
                    .widthIs(24)
                    .heightIs(24);
    lable1.sd_layout.leftSpaceToView(IMG1, 10)
                    .centerYEqualToView(IMG1)
                    .widthIs(80)
                    .heightIs(18);
    dot1.sd_layout.rightSpaceToView(listContain1, 35)
                    .centerYEqualToView(IMG1)
                    .widthIs(18)
                    .heightIs(18);
    btn1.sd_layout.rightSpaceToView(listContain1, 8)
                    .centerYEqualToView(IMG1)
                    .heightIs(20)
                    .widthIs(20);
    
    IMG2.sd_layout.leftSpaceToView(listContain2,20)
                    .topSpaceToView(listContain2,10)
                    .widthIs(24)
                    .heightIs(24);
    lable2.sd_layout.leftSpaceToView(IMG2, 10)
                    .centerYEqualToView(IMG2)
                    .widthIs(80)
                    .heightIs(18);
    dot2.sd_layout.rightSpaceToView(listContain2, 35)
                    .centerYEqualToView(IMG2)
                    .widthIs(18)
                    .heightIs(18);
    btn2.sd_layout.rightSpaceToView(listContain2, 8)
                    .centerYEqualToView(IMG2)
                    .heightIs(20)
                    .widthIs(20);
    
    IMG3.sd_layout.leftSpaceToView(listContain3,20)
                    .topSpaceToView(listContain3,10)
                    .widthIs(24)
                    .heightIs(24);
    lable3.sd_layout.leftSpaceToView(IMG3, 10)
                    .centerYEqualToView(IMG3)
                    .widthIs(100)
                    .heightIs(18);
    dot3.sd_layout.rightSpaceToView(listContain3, 35)
                    .centerYEqualToView(IMG3)
                    .widthIs(18)
                    .heightIs(18);
    btn3.sd_layout.rightSpaceToView(listContain3, 8)
                    .centerYEqualToView(IMG3)
                    .heightIs(20)
                    .widthIs(20);
    
    
//    IMG4.sd_layout.leftSpaceToView(listContain4,20)
//                    .topSpaceToView(listContain4,10)
//                    .widthIs(24)
//                    .heightIs(24);
//    lable4.sd_layout.leftSpaceToView(IMG4, 10)
//                    .centerYEqualToView(IMG4)
//                    .widthIs(80)
//                    .heightIs(18);
//    dot4.sd_layout.rightSpaceToView(listContain4, 35)
//                    .centerYEqualToView(IMG4)
//                    .widthIs(18)
//                    .heightIs(18);
//    btn4.sd_layout.rightSpaceToView(listContain4, 8)
//                    .centerYEqualToView(IMG4)
//                    .heightIs(20)
//                    .widthIs(20);
    
    IMG5.sd_layout.leftSpaceToView(listContain5,20)
                    .topSpaceToView(listContain5,10)
                    .widthIs(24)
                    .heightIs(24);
    lable5.sd_layout.leftSpaceToView(IMG5, 10)
                    .centerYEqualToView(IMG5)
                    .widthIs(80)
                    .heightIs(18);
    dot5.sd_layout.rightSpaceToView(listContain5, 35)
                    .centerYEqualToView(IMG5)
                    .widthIs(18)
                    .heightIs(18);
    btn5.sd_layout.rightSpaceToView(listContain5, 8)
                    .centerYEqualToView(IMG5)
                    .heightIs(20)
                    .widthIs(20);
    
    IMG6.sd_layout.leftSpaceToView(listContain6,20)
                    .topSpaceToView(listContain6,10)
                    .widthIs(24)
                    .heightIs(24);
    lable6.sd_layout.leftSpaceToView(IMG6, 10)
                    .centerYEqualToView(IMG6)
                    .widthIs(80)
                    .heightIs(18);
    dot6.sd_layout.rightSpaceToView(listContain6, 35)
                    .centerYEqualToView(IMG6)
                    .widthIs(18)
                    .heightIs(18);
    btn6.sd_layout.rightSpaceToView(listContain6, 8)
                    .centerYEqualToView(IMG6)
                    .heightIs(20)
                    .widthIs(20);
    
    
}

- (void) settingNavContr {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithHexString:@"43c248"];
}

- (void)editSelfInfo {
    NSLog(@"点击了 编辑个人信息按钮");
}

- (void)myInfoViewBtnClick: (UIButton *)btn {
     HEEMyInfoSettingView *settingVC = [[HEEMyInfoSettingView alloc] init];//swith语句里不能定义对象
    switch (btn.tag) {
        case 101:
            NSLog(@"点击了我的消息");
            break;
        case 102:
            NSLog(@"点击了我的商品");
            break;
        case 103:
            NSLog(@"点击了我的心愿单");
            break;
        case 105:
            NSLog(@"点击了设置");
           
            [self.navigationController pushViewController:settingVC animated:YES];
            break;
        case 106:
            NSLog(@"点击了意见反馈");
            break;
            
        default:
            NSLog(@"default");
            break;
    }
}


@end
