//
//  LoginViewController.m
//  taoBook
//
//  Created by iPhone8s on 17/3/23.
//  Copyright © 2017年 iPhone8s. All rights reserved.
//

#import "CJELogInViewController.h"
#import <UIView+SDAutoLayout.h>

@interface CJELogInViewController ()

@end

@implementation CJELogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加View背景图片
    UIImage *bgImage = [UIImage imageNamed:@"login_bg.png"];
    UIImageView *myImage = [[UIImageView alloc]initWithImage:bgImage];
    //将图片与屏幕自动适配
    self.view.layer.contents = (id)bgImage.CGImage;
    [self.view addSubview:myImage];
    
    UIButton *logoButton = [[UIButton alloc]init];
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [self.view sd_addSubviews:@[logoButton]];
    [logoButton setImage:logoImage forState:UIControlStateNormal];
    
    logoButton.sd_layout
    .leftSpaceToView(self.view,146)
    .topSpaceToView(self.view,59)
    .widthIs(68)
    .heightIs(70);
    
    UIButton *peopleBtn = [[UIButton alloc]init];
    UIImage *peopleImage = [UIImage imageNamed:@"login_icon_username.png"];
    [self.view sd_addSubviews:@[peopleBtn]];
    [peopleBtn setImage:peopleImage forState:UIControlStateNormal];
    
    peopleBtn.sd_layout
    .leftSpaceToView(self.view,42)
    .topSpaceToView(self.view,225)
    .widthIs(40)
    .heightIs(30);
    
    UILabel *labelA_1 = [[UILabel alloc]init];
    [self.view sd_addSubviews:@[labelA_1]];
    labelA_1.backgroundColor = [UIColor whiteColor];
    
    labelA_1.sd_layout
    .leftSpaceToView(self.view,35)
    .topSpaceToView(peopleBtn,10)
    .widthIs(302)
    .heightIs(1);
    
    UIButton *keyBtn = [[UIButton alloc]init];
    UIImage *keyImage = [UIImage imageNamed:@"login_icon_pwd.png"];
    [self.view sd_addSubviews:@[keyBtn]];
    [keyBtn setImage:keyImage forState:UIControlStateNormal];
    
    keyBtn.sd_layout
    .leftSpaceToView(self.view,42)
    .topSpaceToView(labelA_1,12)
    .widthIs(30)
    .heightIs(40);
    
    UILabel *labelB_1 = [[UILabel alloc]init];
    [self.view sd_addSubviews:@[labelB_1]];
    labelB_1.backgroundColor = [UIColor whiteColor];
    
    labelB_1.sd_layout
    .leftSpaceToView(self.view,35)
    .topSpaceToView(keyBtn,12)
    .widthIs(302)
    .heightIs(1);
    
    UIButton *forgetBtn = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[forgetBtn]];
    
    [forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    forgetBtn.sd_layout
    .leftSpaceToView(self.view,242)
    .topSpaceToView(labelB_1,5)
    .widthIs(100)
    .heightIs(30);
    
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[loginBtn]];
    loginBtn.backgroundColor = [UIColor colorWithRed:67.0/255.0 green:281.0/255.0 blue:72.0/255.0 alpha:1];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置圆角  22.0为圆角弧度
    loginBtn.layer.cornerRadius = 22.0;
    
    loginBtn.sd_layout
    .leftSpaceToView(self.view,40)
    .topSpaceToView(forgetBtn,30)
    .widthIs(300)
    .heightIs(45);
    
    UIButton *registerBtn = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[registerBtn]];
    registerBtn.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.32];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor colorWithRed:67.0/255.0 green:178.0/255.0 blue:72.0/255.0 alpha:1] forState:UIControlStateNormal];
    //设置圆角  22.0为圆角弧度
    registerBtn.layer.cornerRadius = 22.0;
    
    registerBtn.sd_layout
    .leftSpaceToView(self.view,40)
    .topSpaceToView(loginBtn,35)
    .widthIs(300)
    .heightIs(45);
    
    UIButton *otherBtn = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[otherBtn]];
    
    [otherBtn setTitle:@"其他账号" forState:UIControlStateNormal];
    [otherBtn setTitleColor:[UIColor colorWithRed:154.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    
    otherBtn.sd_layout
    .leftSpaceToView(self.view,40)
    .topSpaceToView(registerBtn,18)
    .widthIs(100)
    .heightIs(40);
    
    UILabel *labelC_1 = [[UILabel alloc]init];
    [self.view sd_addSubviews:@[labelC_1]];
    labelC_1.backgroundColor = [UIColor colorWithRed:154.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
    
    labelC_1.sd_layout
    .leftSpaceToView(self.view,35)
    .topSpaceToView(otherBtn,2)
    .widthIs(302)
    .heightIs(1);
    
    UIButton *qqBtn = [[UIButton alloc]init];
    UIImage *qqImage = [UIImage imageNamed:@"login_icon_qq.png"];
    [self.view sd_addSubviews:@[qqBtn]];
    [qqBtn setImage:qqImage forState:UIControlStateNormal];
    
    qqBtn.sd_layout
    .leftSpaceToView(self.view,65)
    .topSpaceToView(labelC_1,6)
    .widthIs(30)
    .heightIs(40);
    
    UIButton *weixinBtn = [[UIButton alloc]init];
    UIImage *weixinImage = [UIImage imageNamed:@"login_icon_weixin.png"];
    [self.view sd_addSubviews:@[weixinBtn]];
    [weixinBtn setImage:weixinImage forState:UIControlStateNormal];
    
    weixinBtn.sd_layout
    .leftSpaceToView(qqBtn,77)
    .topSpaceToView(labelC_1,6)
    .widthIs(30)
    .heightIs(40);
    
    UIButton *weiboBtn = [[UIButton alloc]init];
    UIImage *weiboImage = [UIImage imageNamed:@"login_icon_weibo.png"];
    [self.view sd_addSubviews:@[weiboBtn]];
    [weiboBtn setImage:weiboImage forState:UIControlStateNormal];
    
    weiboBtn.sd_layout
    .leftSpaceToView(weixinBtn,77)
    .topSpaceToView(labelC_1,6)
    .widthIs(30)
    .heightIs(40);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
