//
//  HEEWaterWaveView.m
//  taoBook
//
//  Created by apple7 on 17/3/19.
//  Copyright © 2017年 apple7. All rights reserved.
//

#import "HEEWaterWaveView.h"
#import <Chameleon.h>
#import <UIView+SDAutoLayout.h>

@interface HEEWaterWaveView()

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, strong) CAShapeLayer *firstWaveLayer;
@property (nonatomic, strong) CAShapeLayer *secondeWaveLayer;
@property (nonatomic, strong) CAShapeLayer *thirdWaveLayer;


@end

@implementation HEEWaterWaveView
{
    CGFloat _waveAmplitude;             //!< 振幅
    CGFloat _waveCycle;                 //!< 周期
    CGFloat _waveSpeed;                 //!< 速度
    CGFloat _waterWaveHeight;
    CGFloat _waterWaveWidth;
    CGFloat _wavePointY;
    CGFloat _waveOffsetX;               //!< 波浪x位移
    UIColor *_waveColor;
    
    CGFloat _waveSpeed2;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1. alpha:1.];
        self.layer.masksToBounds = YES;
        
        [self ConfigParams];
        [self startWave];
    }
    return self;
}

//配置参数
- (void)ConfigParams {
    _waterWaveWidth = self.width;
    _waterWaveHeight = 150;
    _waveColor = [UIColor colorWithHexString:@"43c248" withAlpha:0.35];
    _waveSpeed = 0.35/M_PI;
    _waveSpeed2 = 0.85/M_PI;
    _waveOffsetX = 0;
    _wavePointY = _waterWaveHeight - 10;
    _waveAmplitude = 10;
    _waveCycle = 1.79 * M_PI / _waterWaveWidth;
}


//加载layer 绑定runloop帧刷新
- (void)startWave {
    
    [self.layer addSublayer: self.firstWaveLayer];
    [self.layer addSublayer: self.secondeWaveLayer];
    [self.layer addSublayer: self.thirdWaveLayer];
    
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

//帧刷新事件
- (void)getCurrentWave {
    _waveOffsetX += _waveSpeed;
    
    [self setFirstWaveLayerPath];
    [self setSecondWaveLayerPath];
    [self setThirdWaveLayerPath];
}



//三个shapelayer动画
- (void)setFirstWaveLayerPath
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _wavePointY;
    CGPathMoveToPoint(path, nil, 0, y);
    for (float x = 0.0f; x <= _waterWaveWidth; x ++) {
        y = _waveAmplitude * sin(_waveCycle * x + _waveOffsetX - 10) + _wavePointY + 10;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, _waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    
    _firstWaveLayer.path = path;
    
    CGPathRelease(path);
}

- (void)setSecondWaveLayerPath
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _wavePointY;
    CGPathMoveToPoint(path, nil, 0, y);
    for (float x = 0.0f; x <= _waterWaveWidth; x ++) {
        y = (_waveAmplitude -2) * sin(_waveCycle * x + _waveOffsetX ) + _wavePointY ;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, _waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    
    _secondeWaveLayer.path = path;
    
    CGPathRelease(path);
}

- (void)setThirdWaveLayerPath
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _wavePointY;
    CGPathMoveToPoint(path, nil, 0, y);
    for (float x = 0.0f; x <= _waterWaveWidth; x ++) {
        y = (_waveAmplitude +2)* sin(_waveCycle * x + _waveOffsetX + 20) + _wavePointY -10;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, _waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    
    _thirdWaveLayer.path = path;
    
    CGPathRelease(path);
}



//get方法
- (CAShapeLayer *)firstWaveLayer
{
    if (!_firstWaveLayer) {
        _firstWaveLayer = [CAShapeLayer layer];
        _firstWaveLayer.fillColor = [_waveColor CGColor];
    }
    return _firstWaveLayer;
}

- (CAShapeLayer *)secondeWaveLayer
{
    if (!_secondeWaveLayer) {
        _secondeWaveLayer = [CAShapeLayer layer];
        _secondeWaveLayer.fillColor = [_waveColor CGColor];
    }
    return _secondeWaveLayer;
}

- (CAShapeLayer *)thirdWaveLayer
{
    if (!_thirdWaveLayer) {
        _thirdWaveLayer = [CAShapeLayer layer];
        _thirdWaveLayer.fillColor = [_waveColor CGColor];
    }
    return _thirdWaveLayer;
}

- (CADisplayLink *)displayLink
{
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    }
    return _displayLink;
}

@end
