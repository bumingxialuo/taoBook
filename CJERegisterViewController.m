//
//  RegisterViewController.m
//
//
//  Created by iPhone8s on 17/3/23.
//
//

#import "CJERegisterViewController.h"
#import <UIView+SDAutoLayout.h>

@interface CJERegisterViewController ()

@end

@implementation CJERegisterViewController

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
    
    UILabel *labelA = [[UILabel alloc]init];
    [self.view sd_addSubviews:@[labelA]];
    labelA.text = @"手机号:";
    labelA.font = [UIFont systemFontOfSize:20];
    labelA.textColor = [UIColor whiteColor];
    
    labelA.sd_layout
    .leftSpaceToView(self.view,55)
    .topSpaceToView(self.view,225)
    .widthIs(80)
    .heightIs(20);
    
    UILabel *labelA_1 = [[UILabel alloc]init];
    [self.view sd_addSubviews:@[labelA_1]];
    labelA_1.backgroundColor = [UIColor whiteColor];
    
    labelA_1.sd_layout
    .leftSpaceToView(self.view,35)
    .topSpaceToView(labelA,16)
    .widthIs(302)
    .heightIs(1);
    
    UILabel *labelB = [[UILabel alloc]init];
    [self.view sd_addSubviews:@[labelB]];
    labelB.text = @"验证码:";
    labelB.font = [UIFont systemFontOfSize:20];
    labelB.textColor = [UIColor whiteColor];
    
    labelB.sd_layout
    .leftSpaceToView(self.view,55)
    .topSpaceToView(labelA_1,32)
    .widthIs(80)
    .heightIs(20);
    
    UILabel *labelB_1 = [[UILabel alloc]init];
    [self.view sd_addSubviews:@[labelB_1]];
    labelB_1.backgroundColor = [UIColor whiteColor];
    
    labelB_1.sd_layout
    .leftSpaceToView(self.view,35)
    .topSpaceToView(labelB,16)
    .widthIs(302)
    .heightIs(1);
    
    UIButton *button_1 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[button_1]];
    [button_1 setTitle:@"发送验证码" forState:UIControlStateNormal];
    [button_1 setTitleColor:[UIColor colorWithRed:62.0/255.0 green:261.0/255.0 blue:72.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    
    button_1.sd_layout
    .leftSpaceToView(labelB,86)
    .topSpaceToView(labelA_1,32)
    .widthIs(100)
    .heightIs(20);
    
    UILabel *labelC = [[UILabel alloc]init];
    [self.view sd_addSubviews:@[labelC]];
    labelC.text = @"登录密码:";
    labelC.font = [UIFont systemFontOfSize:20];
    labelC.textColor = [UIColor whiteColor];
    
    labelC.sd_layout
    .leftSpaceToView(self.view,55)
    .topSpaceToView(labelB_1,32)
    .widthIs(100)
    .heightIs(20);
    
    UILabel *labelC_1 = [[UILabel alloc]init];
    [self.view sd_addSubviews:@[labelC_1]];
    labelC_1.backgroundColor = [UIColor whiteColor];
    
    labelC_1.sd_layout
    .leftSpaceToView(self.view,35)
    .topSpaceToView(labelC,16)
    .widthIs(302)
    .heightIs(1);
    
    UIButton *button_2 = [[UIButton alloc]init];
    [self.view sd_addSubviews:@[button_2]];
    button_2.backgroundColor = [UIColor whiteColor];
    
    
    button_2.sd_layout
    .leftSpaceToView(self.view,65)
    .topSpaceToView(labelC_1,92)
    .widthIs(18)
    .heightIs(18);
    
    UILabel *labelD = [[UILabel alloc]init];
    [self.view sd_addSubviews:@[labelD]];
    labelD.text = @"我已阅读并同意";
    //字体自适应
    labelD.adjustsFontSizeToFitWidth = YES;
    labelD.font = [UIFont systemFontOfSize:19];
    labelD.textColor = [UIColor whiteColor];
    
    labelD.sd_layout
    .leftSpaceToView(button_2,10)
    .topSpaceToView(labelC_1,90)
    .widthIs(106)
    .heightIs(20);
    
    UILabel *labelD_1 = [[UILabel alloc]init];
    [self.view sd_addSubviews:@[labelD_1]];
    labelD_1.text = @"《用户注册协议》";
    //字体自适应
    labelD_1.adjustsFontSizeToFitWidth = YES;
    labelD_1.font = [UIFont systemFontOfSize:19];
    labelD_1.textColor = [UIColor colorWithRed:62.0/255.0 green:281.0/255.0 blue:72.0/255.0 alpha:1];
    
    labelD_1.sd_layout
    .leftSpaceToView(labelD,10)
    .topSpaceToView(labelC_1,90)
    .widthIs(116)
    .heightIs(20);
    
    UIButton *registerBtn = [[UIButton alloc] init];
    [self.view sd_addSubviews:@[registerBtn]];
    registerBtn.backgroundColor = [UIColor colorWithRed:67.0/255.0 green:281.0/255.0 blue:72.0/255.0 alpha:1];
    [registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置圆角  22.0为圆角弧度
    registerBtn.layer.cornerRadius = 22.0;
    
    registerBtn.sd_layout
    .leftSpaceToView(self.view,48)
    .topSpaceToView(labelD,15)
    .widthIs(280)
    .heightIs(45);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
