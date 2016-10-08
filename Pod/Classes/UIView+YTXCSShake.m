//
//  UIView+YTXCSShake.m
//  Pods
//
//  Created by CaoJun on 16/4/19.
//
//

#import "UIView+YTXCSShake.h"
#import "YTXAnimationsUtil.h"

#define YTXSHAREKEYTIMES1 @[@0,@0.2,@0.4,@0.6,@0.8,@0.10,@0.12,@0.14,@0.16,@0.18,@0.20,@0.22,@0.24,@0.26,@0.28,@0.30,@0.32,@0.34,@0.36,@0.38,@0.40,@0.42,@0.44,@0.46,@0.48,@0.50,@0.52,@0.54,@0.56,@0.58,@0.60,@0.62,@0.64,@0.66,@0.68,@0.70,@0.72,@0.74,@0.76,@0.78,@0.80,@0.82,@0.84,@0.86,@0.88,@0.90,@0.92,@0.94,@0.96,@0.98,@1]

#define YTXSHAREKEYTIMES2 @[@0,@0.1,@0.2,@0.3,@0.4,@0.5,@0.6,@0.7,@0.8,@0.9,@1]

#define YTXSHAREKEYTIMES3 @[@0.1,@0.2,@0.3,@0.4,@0.5,@0.6,@0.7,@0.8,@0.9]

@implementation UIView (YTXCSShake)

- (nonnull CAAnimation *)ytx_basicShakeAnimation
{
    NSArray<NSNumber *> * keyTimes = YTXSHAREKEYTIMES1;
    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0)    , @(0)  , @(0)],
                                                        @[@(1.5)  , @(2.5)  , @(-0.5)],
                                                        @[@(1.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(1.5)  , @(-1.5) , @(-0.5)],
                                                        @[@(0.5)  , @(2.5)  , @( 0.5)],
                                                        @[@(-0.5) , @(-0.5) , @( 1.5)],
                                                        @[@(-0.5) , @(-0.5) , @(-0.5)],
                                                        @[@(2.5)  , @(0.5)  , @(-0.5)],
                                                        @[@(-1.5) , @(1.5)  , @( 0.5)],
                                                        @[@(2.5)  , @(0.5)  , @(-0.5)],
                                                        @[@(-1.5) , @(0.5)  , @(-0.5)],
                                                        @[@(2.5)  , @(-1.5) , @(-0.5)],
                                                        @[@(1.5)  , @(2.5)  , @( 1.5)],
                                                        @[@(-1.5) , @(-0.5) , @( 0.5)],
                                                        @[@(1.5)  , @(1.5)  , @(-0.5)],
                                                        @[@(2.5)  , @(-1.5) , @(-0.5)],
                                                        @[@(0.5)  , @(2.5)  , @(-0.5)],
                                                        @[@(-0.5) , @(1.5)  , @( 1.5)],
                                                        @[@(0.5)  , @(1.5)  , @( 1.5)],
                                                        @[@(1.5)  , @(1.5)  , @( 0.5)],
                                                        @[@(-0.5) , @(1.5)  , @( 0.5)],
                                                        @[@(-0.5) , @(0.5)  , @( 1.5)],
                                                        @[@(-1.5) , @(-1.5) , @( 1.5)],
                                                        @[@(0.5)  , @(-0.5) , @( 0.5)],
                                                        @[@(-0.5) , @(1.5)  , @(-0.5)],
                                                        @[@(2.5)  , @(-0.5) , @(-0.5)],
                                                        @[@(0.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(2.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(-1.5) , @(-0.5) , @( 0.5)],
                                                        @[@(-1.5) , @(2.5)  , @( 1.5)],
                                                        @[@(0.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(-0.5) , @(2.5)  , @( 1.5)],
                                                        @[@(0.5)  , @(0.5)  , @(-0.5)],
                                                        @[@(1.5)  , @(-0.5) , @( 1.5)],
                                                        @[@(-1.5) , @(-0.5) , @( 0.5)],
                                                        @[@(-0.5) , @(2.5)  , @( 1.5)],
                                                        @[@(1.5)  , @(0.5)  , @( 0.5)],
                                                        @[@(0.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(1.5)  , @(1.5)  , @(-0.5)],
                                                        @[@(2.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(-1.5) , @(1.5)  , @( 0.5)],
                                                        @[@(-0.5) , @(2.5)  , @( 1.5)],
                                                        @[@(1.5)  , @(1.5)  , @(-0.5)],
                                                        @[@(2.5)  , @(0.5)  , @( 1.5)],
                                                        @[@(-0.5) , @(-1.5) , @(-0.5)],
                                                        @[@(1.5)  , @(-0.5) , @(-0.5)],
                                                        @[@(0.5)  , @(-1.5) , @( 1.5)],
                                                        @[@(-0.5) , @(-0.5) , @( 0.5)],
                                                        @[@(-0.5) , @(-1.5) , @(-0.5)],
                                                        @[@(-0.5) , @(-1.5) , @(1.5)],
                                                        @[@(0)    , @(0)    , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimationWithKeyTimes:keyTimes transformArray:transformArray];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_basicShakeAnimation"];
    });
    
    shackAnimation.duration = 0.1;
    shackAnimation.repeatCount = CGFLOAT_MAX;
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_littleShakeAnimation
{
    NSArray<NSNumber *> * keyTimes = YTXSHAREKEYTIMES1;
    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0), @(0) , @(0)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimationWithKeyTimes:keyTimes transformArray:transformArray];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_littleShakeAnimation"];
    });
    
    shackAnimation.duration = 0.1;
    shackAnimation.repeatCount = CGFLOAT_MAX;
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_slowShakeAnimation
{
    NSArray<NSNumber *> * keyTimes = YTXSHAREKEYTIMES1;
    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0), @(0) , @(0)],
                                                        @[@(6) , @(-5) , @(2.5)],
                                                        @[@(10), @(-6) , @(2.5)],
                                                        @[@(-2), @(-2) , @(-2.5)],
                                                        @[@(6) , @(-3) , @(-1.5)],
                                                        @[@(8) , @(1)  , @(-2.5)],
                                                        @[@(2) , @(-2) , @(-1.5)],
                                                        @[@(-4), @(7)  , @(-1.5)],
                                                        @[@(-9), @(9)  , @(-0.5)],
                                                        @[@(8) , @(9)  , @(-0.5)],
                                                        @[@(9) , @(-8) , @(-0.5)],
                                                        @[@(3) , @(-8) , @(3.5)],
                                                        @[@(0) , @(0)  , @(1.5)],
                                                        @[@(10), @(-7) , @(1.5)],
                                                        @[@(3) , @(6)  , @(2.5)],
                                                        @[@(-3), @(3)  , @(0.5)],
                                                        @[@(-4), @(9)  , @(0.5)],
                                                        @[@(10), @(0)  , @(1.5)],
                                                        @[@(-4), @(9)  , @(0.5)],
                                                        @[@(-1), @(10) , @(-0.5)],
                                                        @[@(3) , @(-3) , @(2.5)],
                                                        @[@(-2), @(5)  , @(3.5)],
                                                        @[@(7) , @(-2) , @(-0.5)],
                                                        @[@(5) , @(4)  , @(-2.5)],
                                                        @[@(-9), @(8)  , @(2.5)],
                                                        @[@(-3), @(-7) , @(-1.5)],
                                                        @[@(-1), @(1)  , @(-2.5)],
                                                        @[@(-3), @(-7) , @(-2.5)],
                                                        @[@(9) , @(-5) , @(3.5)],
                                                        @[@(-6), @(4)  , @(-2.5)],
                                                        @[@(4) , @(5)  , @(-0.5)],
                                                        @[@(5) , @(-9) , @(0.5)],
                                                        @[@(-4), @(-4) , @(1.5)],
                                                        @[@(1) , @(-8) , @(0.5)],
                                                        @[@(-6), @(-7) , @(1.5)],
                                                        @[@(-5), @(4)  , @(-2.5)],
                                                        @[@(5) , @(-3) , @(0.5)],
                                                        @[@(7) , @(6)  , @(1.5)],
                                                        @[@(-5), @(6)  , @(-1.5)],
                                                        @[@(10), @(6)  , @(3.5)],
                                                        @[@(3) , @(10) , @(-1.5)],
                                                        @[@(-2), @(5)  , @(3.5)],
                                                        @[@(8) , @(-1) , @(-0.5)],
                                                        @[@(-6), @(5)  , @(3.5)],
                                                        @[@(5) , @(5)  , @(0.5)],
                                                        @[@(2) , @(-3) , @(-0.5)],
                                                        @[@(-6), @(1)  , @(-1.5)],
                                                        @[@(10), @(4)  , @(1.5)],
                                                        @[@(3) , @(5)  , @(1.5)],
                                                        @[@(7) , @(1)  , @(-2.5)],
                                                        @[@(0), @(0) , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimationWithKeyTimes:keyTimes transformArray:transformArray];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_slowShakeAnimation"];
    });
    
    shackAnimation.duration = 5.0;
    shackAnimation.repeatCount = CGFLOAT_MAX;
    
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_hardShakeAnimation
{
    NSArray<NSNumber *> * keyTimes = YTXSHAREKEYTIMES1;
    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0), @(0) , @(0)],
                                                        @[@(9) , @(8), @(-1.5)],
                                                        @[@(-4), @(7), @(1.5)],
                                                        @[@(-3), @(-5), @(2.5)],
                                                        @[@(7) , @(-7), @(1.5)],
                                                        @[@(8) , @(6), @(1.5)],
                                                        @[@(9) , @(-2), @(1.5)],
                                                        @[@(8) , @(4), @(-2.5)],
                                                        @[@(1) , @(7), @(1.5)],
                                                        @[@(-9), @(6), @(-1.5)],
                                                        @[@(-6), @(-8), @(1.5)],
                                                        @[@(-3), @(7), @(0.5)],
                                                        @[@(8) , @(-4), @(2.5)],
                                                        @[@(-5), @(-9), @(1.5)],
                                                        @[@(10), @(3), @(2.5)],
                                                        @[@(0) , @(8), @(0.5)],
                                                        @[@(-9), @(-2), @(0.5)],
                                                        @[@(-4), @(-1), @(-1.5)],
                                                        @[@(-2), @(-2), @(-0.5)],
                                                        @[@(6) , @(8), @(3.5)],
                                                        @[@(6) , @(0), @(0.5)],
                                                        @[@(-8), @(8), @(0.5)],
                                                        @[@(9) , @(-9), @(-1.5)],
                                                        @[@(-8), @(-9), @(-2.5)],
                                                        @[@(5) , @(4), @(1.5)],
                                                        @[@(-7), @(-8), @(1.5)],
                                                        @[@(1) , @(8), @(0.5)],
                                                        @[@(9) , @(3), @(-1.5)],
                                                        @[@(6) , @(-5), @(3.5)],
                                                        @[@(1) , @(7), @(-1.5)],
                                                        @[@(-1), @(7), @(1.5)],
                                                        @[@(8) , @(-6), @(-1.5)],
                                                        @[@(5) , @(4), @(-0.5)],
                                                        @[@(6) , @(2), @(-0.5)],
                                                        @[@(2) , @(-3), @(1.5)],
                                                        @[@(-2), @(8), @(-2.5)],
                                                        @[@(10), @(-1), @(-1.5)],
                                                        @[@(4), @(-2), @(1.5)],
                                                        @[@(10), @(-5), @(1.5)],
                                                        @[@(0), @(9), @(0.5)],
                                                        @[@(-9), @(1), @(-0.5)],
                                                        @[@(-6), @(-7), @(1.5)],
                                                        @[@(-2), @(-7), @(3.5)],
                                                        @[@(4), @(-4), @(-1.5)],
                                                        @[@(5), @(4), @(0.5)],
                                                        @[@(-1), @(-1), @(-0.5)],
                                                        @[@(-4), @(-7), @(0.5)],
                                                        @[@(1), @(7), @(2.5)],
                                                        @[@(8), @(9), @(-2.5)],
                                                        @[@(6), @(-5), @(3.5)],
                                                        @[@(0), @(0) , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimationWithKeyTimes:keyTimes transformArray:transformArray];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_hardShakeAnimation"];
    });
    
    shackAnimation.duration = 0.1;
    shackAnimation.repeatCount = CGFLOAT_MAX;
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_horizontalShakeAnimation
{
    NSArray<NSNumber *> * keyTimes = YTXSHAREKEYTIMES1;
    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0), @(0) , @(0)],
                                                        @[@(-1), @(0), @(0)],
                                                        @[@(6), @(0), @(0)],
                                                        @[@(-8), @(0), @(0)],
                                                        @[@(8), @(0), @(0)],
                                                        @[@(5), @(0), @(0)],
                                                        @[@(0), @(0), @(0)],
                                                        @[@(7), @(0), @(0)],
                                                        @[@(-6), @(0), @(0)],
                                                        @[@(2), @(0), @(0)],
                                                        @[@(-1), @(0), @(0)],
                                                        @[@(3), @(0), @(0)],
                                                        @[@(-9), @(0), @(0)],
                                                        @[@(-8), @(0), @(0)],
                                                        @[@(8), @(0), @(0)],
                                                        @[@(-2), @(0), @(0)],
                                                        @[@(0), @(0), @(0)],
                                                        @[@(0), @(0), @(0)],
                                                        @[@(9), @(0), @(0)],
                                                        @[@(4), @(0), @(0)],
                                                        @[@(0), @(0), @(0)],
                                                        @[@(-3), @(0), @(0)],
                                                        @[@(3), @(0), @(0)],
                                                        @[@(-7), @(0), @(0)],
                                                        @[@(3), @(0), @(0)],
                                                        @[@(10), @(0), @(0)],
                                                        @[@(7), @(0), @(0)],
                                                        @[@(4), @(0), @(0)],
                                                        @[@(-4), @(0), @(0)],
                                                        @[@(-4), @(0), @(0)],
                                                        @[@(10), @(0), @(0)],
                                                        @[@(-6), @(0), @(0)],
                                                        @[@(-9), @(0), @(0)],
                                                        @[@(1), @(0), @(0)],
                                                        @[@(-7), @(0), @(0)],
                                                        @[@(-4), @(0), @(0)],
                                                        @[@(6), @(0), @(0)],
                                                        @[@(0), @(0), @(0)],
                                                        @[@(6), @(0), @(0)],
                                                        @[@(10), @(0), @(0)],
                                                        @[@(6), @(0), @(0)],
                                                        @[@(0), @(0), @(0)],
                                                        @[@(-3), @(0), @(0)],
                                                        @[@(-4), @(0), @(0)],
                                                        @[@(-3), @(0), @(0)],
                                                        @[@(-6), @(0), @(0)],
                                                        @[@(-5), @(0), @(0)],
                                                        @[@(0), @(0), @(0)],
                                                        @[@(9), @(0), @(0)],
                                                        @[@(4), @(0), @(0)],
                                                        @[@(0), @(0) , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimationWithKeyTimes:keyTimes transformArray:transformArray];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_horizontalShakeAnimation"];
    });
    
    shackAnimation.duration = 0.1;
    shackAnimation.repeatCount = CGFLOAT_MAX;
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_verticalShakeAnimation
{
    NSArray<NSNumber *> * keyTimes = YTXSHAREKEYTIMES1;
    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0), @(0) , @(0)],
                                                        @[@(0), @(5), @(0)],
                                                        @[@(0), @(1), @(0)],
                                                        @[@(0), @(5), @(0)],
                                                        @[@(0), @(2), @(0)],
                                                        @[@(0), @(8), @(0)],
                                                        @[@(0), @(6), @(0)],
                                                        @[@(0), @(3), @(0)],
                                                        @[@(0), @(-4), @(0)],
                                                        @[@(0), @(9), @(0)],
                                                        @[@(0), @(-6), @(0)],
                                                        @[@(0), @(-5), @(0)],
                                                        @[@(0), @(-8), @(0)],
                                                        @[@(0), @(-7), @(0)],
                                                        @[@(0), @(1), @(0)],
                                                        @[@(0), @(7), @(0)],
                                                        @[@(0), @(1), @(0)],
                                                        @[@(0), @(-7), @(0)],
                                                        @[@(0), @(6), @(0)],
                                                        @[@(0), @(8), @(0)],
                                                        @[@(0), @(4), @(0)],
                                                        @[@(0), @(-5), @(0)],
                                                        @[@(0), @(2), @(0)],
                                                        @[@(0), @(-6), @(0)],
                                                        @[@(0), @(-5), @(0)],
                                                        @[@(0), @(-1), @(0)],
                                                        @[@(0), @(-4), @(0)],
                                                        @[@(0), @(6), @(0)],
                                                        @[@(0), @(-6), @(0)],
                                                        @[@(0), @(6), @(0)],
                                                        @[@(0), @(-4), @(0)],
                                                        @[@(0), @(-9), @(0)],
                                                        @[@(0), @(-2), @(0)],
                                                        @[@(0), @(3), @(0)],
                                                        @[@(0), @(3), @(0)],
                                                        @[@(0), @(8), @(0)],
                                                        @[@(0), @(-7), @(0)],
                                                        @[@(0), @(0), @(0)],
                                                        @[@(0), @(-7), @(0)],
                                                        @[@(0), @(2), @(0)],
                                                        @[@(0), @(9), @(0)],
                                                        @[@(0), @(-6), @(0)],
                                                        @[@(0), @(1), @(0)],
                                                        @[@(0), @(-3), @(0)],
                                                        @[@(0), @(1), @(0)],
                                                        @[@(0), @(4), @(0)],
                                                        @[@(0), @(-2), @(0)],
                                                        @[@(0), @(5), @(0)],
                                                        @[@(0), @(2), @(0)],
                                                        @[@(0), @(7), @(0)],
                                                        @[@(0), @(0) , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimationWithKeyTimes:keyTimes transformArray:transformArray];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_verticalShakeAnimation"];
    });
    
    shackAnimation.duration = 0.1;
    shackAnimation.repeatCount = CGFLOAT_MAX;
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_rotateShakeAnimation
{
    NSArray<NSNumber *> * keyTimes = YTXSHAREKEYTIMES1;
    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0), @(0) , @(0)],
                                                        @[@(0), @(0), @(-1.5)],
                                                        @[@(0), @(0), @(-2.5)],
                                                        @[@(0), @(0), @(-6.5)],
                                                        @[@(0), @(0), @(-6.5)],
                                                        @[@(0), @(0), @(5.5)],
                                                        @[@(0), @(0), @(-2.5)],
                                                        @[@(0), @(0), @(-1.5)],
                                                        @[@(0), @(0), @(-2.5)],
                                                        @[@(0), @(0), @(5.5)],
                                                        @[@(0), @(0), @(1.5)],
                                                        @[@(0), @(0), @(-6.5)],
                                                        @[@(0), @(0), @(-6.5)],
                                                        @[@(0), @(0), @(4.5)],
                                                        @[@(0), @(0), @(0.5)],
                                                        @[@(0), @(0), @(7.5)],
                                                        @[@(0), @(0), @(7.5)],
                                                        @[@(0), @(0), @(3.5)],
                                                        @[@(0), @(0), @(6.5)],
                                                        @[@(0), @(0), @(7.5)],
                                                        @[@(0), @(0), @(-5.5)],
                                                        @[@(0), @(0), @(-6.5)],
                                                        @[@(0), @(0), @(1.5)],
                                                        @[@(0), @(0), @(-4.5)],
                                                        @[@(0), @(0), @(1.5)],
                                                        @[@(0), @(0), @(3.5)],
                                                        @[@(0), @(0), @(-0.5)],
                                                        @[@(0), @(0), @(-1.5)],
                                                        @[@(0), @(0), @(-5.5)],
                                                        @[@(0), @(0), @(-5.5)],
                                                        @[@(0), @(0), @(5.5)],
                                                        @[@(0), @(0), @(-5.5)],
                                                        @[@(0), @(0), @(1.5)],
                                                        @[@(0), @(0), @(6.5)],
                                                        @[@(0), @(0), @(-2.5)],
                                                        @[@(0), @(0), @(6.5)],
                                                        @[@(0), @(0), @(4.5)],
                                                        @[@(0), @(0), @(-4.5)],
                                                        @[@(0), @(0), @(-0.5)],
                                                        @[@(0), @(0), @(0.5)],
                                                        @[@(0), @(0), @(-2.5)],
                                                        @[@(0), @(0), @(6.5)],
                                                        @[@(0), @(0), @(-3.5)],
                                                        @[@(0), @(0), @(6.5)],
                                                        @[@(0), @(0), @(5.5)],
                                                        @[@(0), @(0), @(-6.5)],
                                                        @[@(0), @(0), @(-6.5)],
                                                        @[@(0), @(0), @(-4.5)],
                                                        @[@(0), @(0), @(4.5)],
                                                        @[@(0), @(0), @(-2.5)],
                                                        @[@(0), @(0) , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimationWithKeyTimes:keyTimes transformArray:transformArray];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_rotateShakeAnimation"];
    });
    
    shackAnimation.duration = 0.1;
    shackAnimation.repeatCount = CGFLOAT_MAX;
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_opacityShakeAnimation
{
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[
                                @0.99,
                                @0.38,
                                @0.34,
                                @0.24,
                                @0.55,
                                @0.72,
                                @0.26,
                                @0.7,
                                @0.32];
    
    opacityAnimation.keyTimes = YTXSHAREKEYTIMES3;

    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0), @(0) , @(0)],
                                                        @[@(-1), @(5), @(-1.5)],
                                                        @[@(-2), @(-1), @(0.5)],
                                                        @[@(1), @(-4), @(0.5)],
                                                        @[@(1), @(-4), @(2.5)],
                                                        @[@(1), @(-2), @(0.5)],
                                                        @[@(2), @(1), @(-0.5)],
                                                        @[@(-3), @(5), @(0.5)],
                                                        @[@(4), @(3), @(2.5)],
                                                        @[@(0), @(3), @(-1.5)],
                                                        @[@(0), @(0) , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimationWithKeyTimes:YTXSHAREKEYTIMES2 transformArray:transformArray];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacityAnimation, shackAnimation]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_opacityShakeAnimation"];
    });
    
    group.duration = 0.5;
    group.repeatCount = CGFLOAT_MAX;
    return group;
}

- (nonnull CAAnimation *)ytx_crazyShakeAnimation
{
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[
                                @0.03,
                                @0.74,
                                @0.84,
                                @0.99,
                                @0.79,
                                @0.05,
                                @0.81,
                                @0.83,
                                @0.99
                                ];
    
    opacityAnimation.keyTimes = YTXSHAREKEYTIMES3;
    
    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0), @(0) , @(0)],
                                                        @[@(-19), @(-10), @(-2)],
                                                        @[@(-13), @(5), @(-5)],
                                                        @[@(-17), @(9), @(-1)],
                                                        @[@(-17), @(17), @(7)],
                                                        @[@(-10), @(-9), @(-5)],
                                                        @[@(-9), @(-8), @(-3)],
                                                        @[@(-10), @(7), @(-5)],
                                                        @[@(14), @(3), @(2)],
                                                        @[@(9), @(-6), @(-7)],
                                                        @[@(0), @(0) , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimationWithKeyTimes:YTXSHAREKEYTIMES2 transformArray:transformArray];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacityAnimation, shackAnimation]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_crazyShakeAnimation"];
    });
    
    group.duration = 0.1;
    group.repeatCount = CGFLOAT_MAX;
    return group;
}

- (nonnull CAAnimation *)ytx_chunkShakeAnimation
{
    NSArray<NSNumber *> * keyTimes = @[@0,@0.2,@0.4,@0.6,@0.8,@0.10,@0.12,@0.14,@0.16,@0.18,@0.20,@0.22,@0.24,@0.26,@0.28,@0.30,@0.32,@0.34,@0.36,@0.38,@0.40,@1];
    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0), @(0) , @(0)],
                                                        @[@(5), @(-8), @(-2)],
                                                        @[@(14), @(-2), @(13)],
                                                        @[@(-14), @(-4), @(-4)],
                                                        @[@(12), @(8), @(0)],
                                                        @[@(-8), @(12), @(-8)],
                                                        @[@(13), @(-12), @(2)],
                                                        @[@(-4), @(0), @(9)],
                                                        @[@(-11), @(-4), @(-14)],
                                                        @[@(2), @(-7), @(-11)],
                                                        @[@(-8), @(-14), @(13)],
                                                        @[@(15), @(-11), @(-2)],
                                                        @[@(13), @(-9), @(-4)],
                                                        @[@(-2), @(-6), @(-3)],
                                                        @[@(-5), @(6), @(13)],
                                                        @[@(-7), @(-8), @(11)],
                                                        @[@(10), @(3), @(0)],
                                                        @[@(-9), @(-13), @(-3)],
                                                        @[@(-10), @(1), @(1)],
                                                        @[@(0), @(-10), @(13)],
                                                        @[@(0), @(0), @(0)],
                                                        @[@(0), @(0) , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimationWithKeyTimes:keyTimes transformArray:transformArray];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_chunkShakeAnimation"];
    });
    
    shackAnimation.duration = 4.0;
    shackAnimation.repeatCount = CGFLOAT_MAX;
    return shackAnimation;
}


- (nonnull CAKeyframeAnimation *)ytx_CSShakeAnimationWithKeyTimes:(nonnull NSArray<NSNumber *> *) keyTimes transformArray:(nonnull NSArray<NSArray<NSNumber *> *> *) transformArray
{

    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation  animationWithKeyPath:YTXTRANSFORM];
    
    shackAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    shackAnimation.keyTimes = keyTimes;
    NSMutableArray<NSValue *> * values = [NSMutableArray array];
    
    CATransform3D transform = CATransform3DIdentity;
    
    for (NSArray * transformValues in transformArray) {
        //[translateX,translateY,rorateX]
        CGFloat translateX = [transformValues[0] floatValue];
        CGFloat translateY = [transformValues[1] floatValue];
        CGFloat rotateZ = [transformValues[2] floatValue];
        CATransform3D currentTransform = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:rotateZ], 0, 0, 1);
        currentTransform.m41 = translateX;
        currentTransform.m42 = translateY;

        NSValue * value = [NSValue valueWithCATransform3D:currentTransform];
        
        [values addObject:value];
    }
    
    [shackAnimation setValues:values];
    
    return shackAnimation;
}

@end
