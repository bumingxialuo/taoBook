//
//  HEEWishScrollView.m
//  taoBook
//
//  Created by apple7 on 17/3/21.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEWishScrollView.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>

@interface HEEWishScrollView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *wishPageCtr;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HEEWishScrollView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.bounces = NO;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        
        self.backgroundColor = [UIColor colorWithHexString:@"d9d9d9"];
        self.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 233.);
        self.delegate = self;
        [self handleView];
    }
    return self;
}

- (void)handleView {
    CGFloat SCREENW = [UIScreen mainScreen].bounds.size.width;
    
    UIImage *image1 = [UIImage imageNamed:@"sjxq_img_book"];
    UIImage *image2 = [UIImage imageNamed:@"image2"];
    UIImage *image3 = [UIImage imageNamed:@"image3"];
    UIImageView *imageview1 = [[UIImageView alloc] initWithImage:image1];
    UIImageView *imageview2 = [[UIImageView alloc] initWithImage:image2];
    UIImageView *imageview3 = [[UIImageView alloc] initWithImage:image3];
    
    
    
    [self sd_addSubviews:@[imageview1, imageview2, imageview3]];
    
    imageview1.sd_layout
    .leftEqualToView(self)
    .heightIs(233.)
    .widthIs(SCREENW);
    
    imageview2.sd_layout
    .leftSpaceToView(self, SCREENW)
    .heightIs(233.)
    .widthIs(SCREENW);
    
    imageview3.sd_layout
    .leftSpaceToView(self, 2 * SCREENW)
    .heightIs(233.)
    .widthIs(SCREENW);
    self.wishPageCtr.currentPage = 0;
    [self setupTimer];
}

- (UIPageControl *)wishPageCtr {
    if (_wishPageCtr == nil) {
        _wishPageCtr = [[UIPageControl alloc] init];
        _wishPageCtr.numberOfPages = 3;
        CGSize size = [_wishPageCtr sizeForNumberOfPages:3];
        _wishPageCtr.bounds = CGRectMake(0, 0, size.width, size.height);
        _wishPageCtr.center = CGPointMake(self.center.x, 233 - 20);
        _wishPageCtr.currentPageIndicatorTintColor = [UIColor colorWithWhite:1 alpha:1.0];
        _wishPageCtr.pageIndicatorTintColor = [UIColor colorWithHexString:@"#43c248"];
        [self addSubview:_wishPageCtr];
        [_wishPageCtr addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _wishPageCtr;
}

//初始化定时器
- (void)setupTimer {
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(timerChanged) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

//定时器生效
- (void)timerChanged {
    int page = (self.wishPageCtr.currentPage + 1) % 3;//一直轮播
    self.wishPageCtr.currentPage = page;
    [self pageChanged:self.wishPageCtr];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    double page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    self.wishPageCtr.currentPage = page;
}

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
}

//移动完毕
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self setupTimer];
}

- (void)pageChanged : (UIPageControl *)pageControl{
    CGFloat x = (pageControl.currentPage) * self.width;
    [self setContentOffset:CGPointMake(x, 0) animated:YES];
}


@end
