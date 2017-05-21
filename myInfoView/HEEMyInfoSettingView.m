//
//  HEEMyInfoSettingView.m
//  taoBook
//
//  Created by apple7 on 17/3/25.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEMyInfoSettingView.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>

@interface HEEMyInfoSettingView ()

@end

@implementation HEEMyInfoSettingView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"F1F1F1"];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                                                      NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"ffffff"]];
    
    [self layoutSettingSubviews];
}

- (void)layoutSettingSubviews {
    UIView *settingContain = [[UIView alloc] init];
    settingContain.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    UIView *settingContain2 = [[UIView alloc] init];
    settingContain2.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
    
    UILabel *messageRemind = [[UILabel alloc] init];//消息提醒
    messageRemind.text = @"消息提醒";
    messageRemind.textColor = [UIColor colorWithHexString:@"333333"];
    messageRemind.textAlignment = NSTextAlignmentLeft;
    messageRemind.font = [UIFont systemFontOfSize:14];
    UISwitch *remindSwitch = [[UISwitch alloc] init];
    remindSwitch.on = YES;
    [remindSwitch addTarget:self action:@selector(remindMSG:) forControlEvents:UIControlEventValueChanged];
    
    UIButton *personalSettings = [[UIButton alloc] init];//个人设置
    personalSettings.titleLabel.text = @"个人设置";
    [personalSettings setTitle:@"个人设置" forState:UIControlStateNormal];
    [personalSettings setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    personalSettings.titleLabel.textAlignment = NSTextAlignmentLeft;
    personalSettings.titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
    personalSettings.titleLabel.font = [UIFont systemFontOfSize:14];
    personalSettings.tag = 1001;
    [personalSettings addTarget:self action:@selector(myinfoSeetingViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *accountSetting = [[UIButton alloc] init];//帐号设置
    accountSetting.titleLabel.text = @"帐号设置";
    [accountSetting setTitle:@"帐号设置" forState:UIControlStateNormal];
    [accountSetting setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    accountSetting.titleLabel.textAlignment = NSTextAlignmentLeft;
    accountSetting.titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
    accountSetting.titleLabel.font = [UIFont systemFontOfSize:14];
    accountSetting.tag = 1002;
    [accountSetting addTarget:self action:@selector(myinfoSeetingViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *aboutUs = [[UIButton alloc] init];//关于我们
    aboutUs.titleLabel.text = @"关于我们";
    [aboutUs setTitle:@"关于我们" forState:UIControlStateNormal];
    [aboutUs setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    aboutUs.titleLabel.textAlignment = NSTextAlignmentLeft;
    aboutUs.titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
    aboutUs.titleLabel.font = [UIFont systemFontOfSize:14];
    aboutUs.tag = 1003;
    [aboutUs addTarget:self action:@selector(myinfoSeetingViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *clearCache = [[UIButton alloc] init];//清楚缓存
    clearCache.titleLabel.text = @"清除缓存";
    [clearCache setTitle:@"清除缓存" forState:UIControlStateNormal];
    [clearCache setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    clearCache.titleLabel.textAlignment = NSTextAlignmentLeft;
    clearCache.titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
    clearCache.titleLabel.font = [UIFont systemFontOfSize:14];
    clearCache.tag = 1004;
    [clearCache addTarget:self action:@selector(myinfoSeetingViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *logout = [[UIButton alloc] init];//退出登录
    logout.titleLabel.text = @"退出登录";
    [logout setTitle:@"退出登录" forState:UIControlStateNormal];
    logout.titleLabel.textAlignment = NSTextAlignmentLeft;
    [logout setTitleColor:[UIColor colorWithHexString:@"de6f32"] forState:UIControlStateNormal];
    logout.titleLabel.textColor = [UIColor colorWithHexString:@"de6f32"];
    logout.titleLabel.font = [UIFont systemFontOfSize:14];
    logout.tag = 1005;
    [logout addTarget:self action:@selector(myinfoSeetingViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    UIView *line2 = [[UIView alloc] init];
    line2.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    UIView *line3 = [[UIView alloc] init];
    line3.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    UIView *line4 = [[UIView alloc] init];
    line4.backgroundColor = [UIColor colorWithHexString:@"999999"];
    
    [self.view sd_addSubviews:@[settingContain,settingContain2]];
    [settingContain sd_addSubviews:@[messageRemind,remindSwitch,personalSettings,accountSetting,aboutUs,line1,line2,line3]];
    [settingContain2 sd_addSubviews:@[clearCache,logout,line4]];
    
    settingContain.sd_layout
    .topSpaceToView(self.view,16)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(44*4+1.5);
    
    messageRemind.sd_layout
    .topSpaceToView(settingContain,15)
    .leftSpaceToView(settingContain,18)
    .widthIs(80)
    .heightIs(14);
    
    remindSwitch.sd_layout
    .topSpaceToView(settingContain,7)
    .rightSpaceToView(settingContain,18)
    .widthIs(38)
    .heightIs(20);
    
    line1.sd_layout
    .topSpaceToView(messageRemind,15)
    .leftSpaceToView(settingContain, 8)
    .rightSpaceToView(settingContain, 8)
    .heightIs(0.5);
    
    personalSettings.sd_layout
    .topSpaceToView(line1,15)
    .leftSpaceToView(settingContain,8)
    .widthIs(80)
    .heightIs(20);
    
    line2.sd_layout
    .topSpaceToView(personalSettings,15)
    .leftSpaceToView(settingContain,8)
    .rightSpaceToView(settingContain,8)
    .heightIs(0.5);
    
    accountSetting.sd_layout
    .topSpaceToView(line2,15)
    .leftEqualToView(personalSettings)
    .heightIs(14)
    .widthIs(80);
    
    line3.sd_layout
    .topSpaceToView(accountSetting,15)
    .leftSpaceToView(settingContain,8)
    .rightSpaceToView(settingContain,8)
    .heightIs(0.5);
    
    aboutUs.sd_layout
    .topSpaceToView(line3,15)
    .leftEqualToView(accountSetting)
    .widthIs(80)
    .heightIs(14);
    
    settingContain2.sd_layout
    .topSpaceToView(settingContain,16)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(88+1.5);
    
    clearCache.sd_layout
    .topSpaceToView(settingContain2,15)
    .leftEqualToView(aboutUs)
    .widthIs(80)
    .heightIs(14);
    
    line4.sd_layout
    .topSpaceToView(clearCache,15)
    .leftSpaceToView(settingContain2,8)
    .rightSpaceToView(settingContain2,8)
    .heightIs(0.5);
    
    logout.sd_layout
    .topSpaceToView(line4,15)
    .leftEqualToView(clearCache)
    .widthIs(80)
    .heightIs(14);
    
}
- (void)remindMSG: (id)sender {
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        NSLog(@"开启消息提醒");
    }else {
        NSLog(@"关闭消息提醒");
    }
}

- (void)myinfoSeetingViewBtnClick: (NSInteger)tag {
    switch (tag) {
        case 1001:
            NSLog(@"点击了个人设置");
            break;
        case 1002:
            NSLog(@"点击了账号设置");
            break;
        case 1003:
            NSLog(@"点击了关于我们");
            break;
        case 1004:
            NSLog(@"点击了清除缓存");
            break;
        case 1005:
            NSLog(@"点击了退出登录");
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
