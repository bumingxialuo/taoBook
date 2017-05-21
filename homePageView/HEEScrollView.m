//
//  HEEScrollView.m
//  taoBook
//
//  Created by apple7 on 17/3/13.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEScrollView.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>

#define imageCount 3
#define imageHeight 130

@interface HEEScrollView()<UIScrollViewDelegate>
@property(nonatomic, strong) UIPageControl *pageCrl;
@property(nonatomic, strong) NSTimer *timer;
@end

@implementation HEEScrollView

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    
//    if (self) {
//        self.bounces = NO;
//        self.showsVerticalScrollIndicator = NO;
//        self.showsHorizontalScrollIndicator = NO;
//        self.pagingEnabled = YES;
//        
//        self.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
//        
//        self.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, self.HEEScrollViewHEIGHT);
//        self.delegate = self;
//        
//        
//    }
//    
//    return self;
//}


- (instancetype)init {
    if (self = [super init]) {
        self.bounces = NO;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        
        self.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
        
        self.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, imageHeight);
        self.delegate = self;
        
        [self handleView];

    }
    return self;
}




//- (instancetype)initWithFrame:(CGRect)frame viewHEIGHT:(CGFloat)viewHEIGHT imageView1:(UIImage *)imageView1 imageView2:(UIImage *)imageView2 imageView3:(UIImage *)imageView3 {
//    
//    self = [self initWithFrame:frame];
//    
//    if (self) {
//        self.HEEScrollViewHEIGHT = viewHEIGHT;
//        self.imageView1.image = imageView1;
//        self.imageView2.image = imageView2;
//        self.imageView3.image = imageView3;
//        [self handleView];
//    }
//    return self;
//}


- (void)handleView {
    
    CGFloat SCREENW = [UIScreen mainScreen].bounds.size.width;
    
    UIImage *image1 = [UIImage imageNamed:@"home_banner1"];
    UIImage *image2 = [UIImage imageNamed:@"image2"];
    UIImage *image3 = [UIImage imageNamed:@"image3"];
    UIImageView *imageview1 = [[UIImageView alloc] initWithImage:image1];
    UIImageView *imageview2 = [[UIImageView alloc] initWithImage:image2];
    UIImageView *imageview3 = [[UIImageView alloc] initWithImage:image3];
    
    
    
    [self sd_addSubviews:@[imageview1, imageview2, imageview3]];
    
    imageview1.sd_layout
    .leftEqualToView(self)
    .heightIs(imageHeight)
    .widthIs(SCREENW);
    
    imageview2.sd_layout
    .leftSpaceToView(self, SCREENW)
    .heightIs(imageHeight)
    .widthIs(SCREENW);
                               
    imageview3.sd_layout
    .leftSpaceToView(self, 2 * SCREENW)
    .heightIs(imageHeight)
    .widthIs(SCREENW);
                               
                               
                               
//    for (int i = 0; i < imageCount; i++) {
//        NSString *imageName = [NSString stringWithFormat:@"image%d",i+1];
//        NSLog(@"%@",imageName);
//        UIImage *image = [UIImage imageNamed:imageName];
//        UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.bounds];
//        imageview.image = image;
//        [self addSubview:imageview];
//        
//    }
//    //枚举器
//    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        CGRect frame = obj.frame;
//        frame.origin.x = idx * frame.size.width;
//        imageview.frame = frame;
//    }];
    self.pageCrl.currentPage = 0;
    [self setupTimer];
}


- (UIPageControl *)pageCrl {
    if (_pageCrl == nil) {
        _pageCrl = [[UIPageControl alloc] init];
        _pageCrl.numberOfPages = imageCount;
        CGSize size = [_pageCrl sizeForNumberOfPages:imageCount];
        _pageCrl.bounds = CGRectMake(0, 0, size.width, size.height);
        _pageCrl.center = CGPointMake(self.center.x, imageHeight - 20);
        _pageCrl.currentPageIndicatorTintColor = [UIColor colorWithWhite:1 alpha:1.0];
        _pageCrl.pageIndicatorTintColor = [UIColor colorWithHexString:@"#43c248"];
        [self addSubview:_pageCrl];
        [_pageCrl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _pageCrl;
}
//初始化定时器
- (void)setupTimer {
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(timerChanged) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)pageChanged : (UIPageControl *)pageControl{
    CGFloat x = (pageControl.currentPage) * self.width;
    [self setContentOffset:CGPointMake(x, 0) animated:YES];
}

//定时器生效
- (void)timerChanged {
    int page = (self.pageCrl.currentPage + 1) % imageCount;//一直轮播
    self.pageCrl.currentPage = page;
    [self pageChanged:self.pageCrl];
}

//停止滚动，更新页数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    double page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    self.pageCrl.currentPage = page;
}
- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
}

//移动完毕
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self setupTimer];
}



@end
