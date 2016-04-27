//
//  UIView+YTXAnimateCSS.m
//  p4
//
//  Created by YTX on 12 * rotate/4/7.
//  Copyright © 2012 * rotate年 com.baidao. All rights reserved.
//

#import "UIView+YTXAnimateCSS.h"
#import "YTXAnimationsUtil.h"

@implementation UIView (YTXAnimateCSS)

#pragma mark - Attention Seekers

- (nonnull CAAnimation *)ytx_bounceAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAMediaTimingFunction *time_1 = YTXCAMEDIATIMINGFUNCTION (0.215, 0.610, 0.355, 1);
    CAMediaTimingFunction *time_2 = YTXCAMEDIATIMINGFUNCTION (0.755, 0.050, 0.855, 0.060);
    
    CGFloat y = self.center.y;
    NSNumber *value_0 = @(0 + y);
    NSNumber *value_1 = @(-15 + y);
    NSNumber *value_2 = @(-8 + y);
    NSNumber *value_3 = @(-2 + y);
    
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITIONY];
    [bounce setValues  :@[value_0, value_1, value_1, value_0, value_2, value_0, value_3]];
    [bounce setKeyTimes:@[@(0.2) , @(0.4) , @(0.43), @(.53) , @(.7)  , @(.8)  , @(.9)]];
    [bounce setTimingFunctions:@[time_1, time_2, time_2, time_1, time_2, time_1, time_1, time_2]];
    
    bounce.duration = durationTime;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:bounce forKey:@"ytx_bounceAnimtionWithDurationTime:"];
    });
    return bounce;
}

- (nonnull CAAnimation *)ytx_flashAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *flashAnimation = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [flashAnimation setValues  :@[@(0)   , @(1)  , @(0)  , @(1)]];
    [flashAnimation setKeyTimes:@[@(0.25), @(0.5), @(.75), @(1)]];
    [flashAnimation setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:flashAnimation forKey:@"ytx_flashAnimtionWithDurationTime:"];
    });
    return flashAnimation;
}

- (nonnull CAAnimation *)ytx_pluseAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float smallScaleValue = 1.f;
    float lagerScaleValue = 1.05;
    NSValue *smallScale = YTXSCALEVALUE(smallScaleValue, smallScaleValue, smallScaleValue);
    NSValue *lagerScale = YTXSCALEVALUE(lagerScaleValue, lagerScaleValue, lagerScaleValue);
    
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation  animationWithKeyPath:YTXTRANSFORM];
    shackAnimation.duration = durationTime;
    [shackAnimation setValues:@[smallScale, lagerScale, smallScale]];
    [shackAnimation setKeyTimes:@[@(0), @(.5), @(1)]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_pluseAnimtionWithDurationTime:"];
    });
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_rubberBandAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float smallScaleValue        = 0.75;
    float smallMidScaleValue     = 0.85;
    float defaultsmallScaleValue = 0.95;
    float defaultScaleValue      = 1.f;
    float defaultlagerScaleValue = 1.05;
    float lagerMidScaleValue     = 1.15;
    float lagerScaleValue        = 1.25;
    
    NSValue *norScale = YTXSCALEVALUE(defaultScaleValue, defaultScaleValue, defaultScaleValue);
    
    CAKeyframeAnimation *rubberBand = [CAKeyframeAnimation  animationWithKeyPath:YTXTRANSFORM];
    rubberBand.duration = durationTime;
    [rubberBand setValues:@[norScale,
                            YTXSCALEVALUE(lagerScaleValue, smallScaleValue, defaultScaleValue),
                            YTXSCALEVALUE(smallScaleValue, lagerScaleValue, defaultScaleValue),
                            YTXSCALEVALUE(lagerMidScaleValue, smallMidScaleValue, defaultScaleValue),
                            YTXSCALEVALUE(defaultsmallScaleValue, defaultlagerScaleValue, defaultScaleValue),
                            YTXSCALEVALUE(defaultlagerScaleValue, defaultsmallScaleValue, defaultScaleValue),
                            norScale
                            ]];
    [rubberBand setKeyTimes:@[@(0), @(.3), @(.4), @(.5), @(.65), @(.75), @(1)]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:rubberBand forKey:@"ytx_rubberBandAnimtionWithDurationTime:"];
    });
    return rubberBand;
}

- (nonnull CAAnimation *)ytx_shakeAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGPoint center   = self.center;
    float moveXLeft  = center.x - 5;
    float moveXRight = center.x + 5;
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITIONX];
    shackAnimation.duration = durationTime;
    
    [shackAnimation setValues:@[@(center.x)  , @(moveXLeft) , @(moveXRight),
                                @(moveXLeft) , @(moveXRight), @(moveXLeft) ,
                                @(moveXRight), @(moveXLeft) , @(moveXRight),
                                @(moveXLeft) , @(moveXRight), @(center.x)]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_shakeAnimtionWithDurationTime:"];
    });
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_swingAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotateF = [YTXAnimationsUtil radianWithDegree:15];
    float rotateS = [YTXAnimationsUtil radianWithDegree:10];
    float rotateT = [YTXAnimationsUtil radianWithDegree:5];
    
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    shackAnimation.duration = durationTime;
    
    [shackAnimation setValues:@[YTXROTATEVALUE(.0,       .0, .0, .0),
                                YTXROTATEVALUE(rotateF,  .0, .0, 1.0),
                                YTXROTATEVALUE(-rotateS, .0, .0, 1.0),
                                YTXROTATEVALUE(rotateT,  .0, .0, 1.0),
                                YTXROTATEVALUE(-rotateT, .0, .0, 1.0),
                                YTXROTATEVALUE(0,        .0, .0, 1.0)]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_swingAnimtionWithDurationTime:"];
    });
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_tadaAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate = [YTXAnimationsUtil radianWithDegree:3];
    float smallScaleValue = 0.9;
    float lagerScaleValue = 1.1;
    
    NSValue *defultScale = YTXSCALEVALUE(1, 1, 1);
    NSValue *smallScale  = YTXSCALEVALUE(smallScaleValue, smallScaleValue, smallScaleValue);
    NSValue *lagerScale  = YTXSCALEVALUE(lagerScaleValue, lagerScaleValue, lagerScaleValue);
    NSValue *leftValue   = YTXROTATEVALUE(-rotate, .0, .0, 1.0);
    NSValue *rightValue  = YTXROTATEVALUE(rotate , .0, .0, 1.0);
    
    CAKeyframeAnimation *tadaAnimation = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    tadaAnimation.duration = durationTime;
    
    [tadaAnimation setValues:@[defultScale, smallScale, lagerScale,
                               leftValue  , rightValue, leftValue,
                               rightValue , leftValue , rightValue,
                               leftValue  , rightValue]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:tadaAnimation forKey:@"ytx_tadaAnimtionWithDurationTime:"];
    });
    
    return tadaAnimation;
}

- (nonnull CAAnimation *)ytx_wobbleAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate_1 = [YTXAnimationsUtil radianWithDegree:5];
    float rotate_2 = [YTXAnimationsUtil radianWithDegree:3];
    float rotate_3 = [YTXAnimationsUtil radianWithDegree:2];
    float rotate_4 = [YTXAnimationsUtil radianWithDegree:1];
    
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation  animationWithKeyPath:YTXTRANSFORM];
    [rotateAnimation setKeyTimes:@[@(0), @(.15), @(.3), @(.45), @(.6), @(.75), @(1)]];
    [rotateAnimation setValues:@[YTXROTATEVALUE(0        , .0, .0, 1.0),
                                 YTXROTATEVALUE(-rotate_1, .0, .0, 1.0),
                                 YTXROTATEVALUE(rotate_2 , .0, .0, 1.0),
                                 YTXROTATEVALUE(-rotate_2, .0, .0, 1.0),
                                 YTXROTATEVALUE(rotate_3 , .0, .0, 1.0),
                                 YTXROTATEVALUE(-rotate_4, .0, .0, 1.0),
                                 YTXROTATEVALUE(0        , .0, .0, 1.0)]];
    
    CGFloat x = self.center.x;
    CGFloat width = YTXSELFWIDTH;
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation  animationWithKeyPath:YTXPOSITIONX];
    [shakeAnimation setKeyTimes:@[@(0), @(.15), @(.3), @(.45), @(.6), @(.75), @(1)]];
    [shakeAnimation setValues:@[@(x),
                                @((-.25  * width) + x),
                                @((.2 * width) + x),
                                @((-.15 * width) + x),
                                @((.1 * width) + x),
                                @((-.05 * width) + x),
                                @(x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[rotateAnimation,shakeAnimation]];
    [group setDuration:durationTime*.5];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_wobbleAnimtionWithDurationTime:"];
    });
    return group;
}

- (nonnull CAAnimation *)ytx_jelloAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate_1 = tan([YTXAnimationsUtil radianWithDegree:-12.5]);
    float rotate_2 = tan([YTXAnimationsUtil radianWithDegree: 6.25]);
    float rotate_3 = tan([YTXAnimationsUtil radianWithDegree:-3.125]);
    float rotate_4 = tan([YTXAnimationsUtil radianWithDegree: 1.5625]);
    float rotate_5 = tan([YTXAnimationsUtil radianWithDegree:-0.78125]);
    float rotate_6 = tan([YTXAnimationsUtil radianWithDegree: 0.390625]);
    float rotate_7 = tan([YTXAnimationsUtil radianWithDegree:-0.1953125]);
    
    CGAffineTransform transform_111 = CGAffineTransformIdentity;
    transform_111.c = rotate_1;
    transform_111.b = rotate_1;
    
    CGAffineTransform transform_222 = CGAffineTransformIdentity;
    transform_222.c = rotate_2;
    transform_222.b = rotate_2;
    
    CGAffineTransform transform_333 = CGAffineTransformIdentity;
    transform_333.c = rotate_3;
    transform_333.b = rotate_3;
    
    CGAffineTransform transform_444 = CGAffineTransformIdentity;
    transform_444.c = rotate_4;
    transform_444.b = rotate_4;
    
    CGAffineTransform transform_555 = CGAffineTransformIdentity;
    transform_555.c = rotate_5;
    transform_555.b = rotate_5;
    
    CGAffineTransform transform_666 = CGAffineTransformIdentity;
    transform_666.c = rotate_6;
    transform_666.b = rotate_6;
    
    CGAffineTransform transform_777 = CGAffineTransformIdentity;
    transform_777.c = rotate_7;
    transform_777.b = rotate_7;
    
    CGAffineTransform transform_10 = CGAffineTransformIdentity;
    transform_10.c = 0;
    transform_10.b = 0;
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:YTXTRANSFORM];
    animation.duration = durationTime;
    animation.calculationMode = kCAAnimationCubic;
    
    
    [animation setKeyTimes:@[@(.111), @(.222), @(.333), @(.444), @(.555), @(.666), @(.777), @(.888), @(1)]];
    [animation setValues:@[
                           [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform_10)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform_111)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform_222)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform_333)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform_444)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform_555)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform_666)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform_777)],
                           [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(transform_10)]]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:animation forKey:@"ytx_jelloAnimtionWithDurationTime:"];
    });
    return animation;
}

#pragma mark - Bouncing Entrances
- (nonnull CAAnimation *)ytx_bounceInAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *bounceln = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [bounceln setValues:@[YTXSCALEVALUE(0.3 , 0.3 , 0.3),
                          YTXSCALEVALUE(1.1 , 1.1 , 1.1),
                          YTXSCALEVALUE(0.9 , 0.9 , 0.9),
                          YTXSCALEVALUE(1.03, 1.03, 1.03),
                          YTXSCALEVALUE(0.97, 0.97, 0.97),
                          YTXSCALEVALUE(1.0 , 1.0 , 1.0)]];
    CAMediaTimingFunction *time = YTXCAMEDIATIMINGFUNCTION (0.215, 0.610, 0.355, 1.000);
    [bounceln setKeyTimes:@[@0, @(0.2), @(0.4), @(.6), @(.8), @1]];
    [bounceln setTimingFunction:time];
    bounceln.duration = durationTime;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:bounceln forKey:@"ytx_bounceInAnimtionWithDurationTime:"];
    });
    return bounceln;
}

- (nonnull CAAnimation *)ytx_bounceInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_bounceInAnimtionWithSelectName:@"ytx_bounceInDownAnimtionWithDurationTime:"
                                          isForward:NO
                                         isVertical:YES
                                       durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_bounceInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_bounceInAnimtionWithSelectName:@"ytx_bounceInLeftAnimtionWithDurationTime:"
                                          isForward:NO
                                         isVertical:NO
                                       durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_bounceInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_bounceInAnimtionWithSelectName:@"ytx_bounceInRightAnimtionWithDurationTime:"
                                          isForward:YES
                                         isVertical:NO
                                       durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_bounceInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_bounceInAnimtionWithSelectName:@"ytx_bounceInUpAnimtionWithDurationTime:"
                                          isForward:YES
                                         isVertical:YES
                                       durationTime:durationTime];
}


- (nonnull CAAnimation *)ytx_bounceInAnimtionWithSelectName:(NSString *)selectName isForward:(BOOL)isForward isVertical:(BOOL)isVertical durationTime:(NSTimeInterval)durationTime
{
    // isForward 是否up或right
    CGFloat centerValue = isVertical ? self.center.y : self.center.x;
    NSString *keyPath   = isVertical ? YTXPOSITIONY : YTXPOSITIONX;
    float forwardNum    = isForward  ? 1 : -1;
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    
    NSNumber *value_0 = @( forwardNum * 1500 + centerValue);
    NSNumber *value_1 = @(-forwardNum * 12.5 + centerValue);
    NSNumber *value_2 = @( forwardNum * 5    + centerValue);
    NSNumber *value_3 = @(-forwardNum * 2.5  + centerValue);
    [bounce setValues:@[value_0, value_1, value_2, value_3, @(centerValue)]];
    [bounce setKeyTimes:@[@0, @(0.6), @(0.75), @(.9), @1]];
    
    CAMediaTimingFunction *time = YTXCAMEDIATIMINGFUNCTION (0.215, 0.610, 0.355, 1.000);
    [bounce setTimingFunction:time];
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@0, @1]];
    [opacity setKeyTimes:@[@(0), @.6]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity, bounce]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:selectName];
    });
    return group;
}

#pragma mark - Bouncing Exits
- (nonnull CAAnimation *)ytx_bounceOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [bounce setValues:@[YTXSCALEVALUE(1.0, 1.0, 1.0),
                        YTXSCALEVALUE(0.9, 0.9, 0.9),
                        YTXSCALEVALUE(1.1, 1.1, 1.1),
                        YTXSCALEVALUE(1.1, 1.1, 1.1),
                        YTXSCALEVALUE(0.3, 0.3, 0.3)]];
    [bounce setKeyTimes:@[@0, @(0.2), @(0.5), @(.55), @1]];
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@1, @0]];
    [opacity setKeyTimes:@[@(.55), @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity, bounce]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_bounceOutAnimtionWithDurationTime:"];
    });
    return group;
}

- (nonnull CAAnimation *)ytx_bounceOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_bounceOutAnimtionWithSelectName:@"ytx_bounceOutDownAnimtionWithDurationTime:"
                                           isForward:NO
                                          isVertical:YES
                                        durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_bounceOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_bounceOutAnimtionWithSelectName:@"ytx_bounceOutLeftAnimtionWithDurationTime:"
                                           isForward:NO
                                          isVertical:NO
                                        durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_bounceOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_bounceOutAnimtionWithSelectName:@"ytx_bounceOutRightAnimtionWithDurationTime:"
                                           isForward:YES
                                          isVertical:NO
                                        durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_bounceOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_bounceOutAnimtionWithSelectName:@"ytx_bounceOutUpAnimtionWithDurationTime:"
                                           isForward:YES
                                          isVertical:YES
                                        durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_bounceOutAnimtionWithSelectName:(NSString *)selectName isForward:(BOOL)isForward isVertical:(BOOL)isVertical durationTime:(NSTimeInterval)durationTime
{
    // isForward 是否up或right
    float    forwardNum  = isForward  ? 1 : -1;
    CGFloat  centerValue = isVertical ? self.center.y : self.center.x;
    NSString *keyPath    = isVertical ? YTXPOSITIONY : YTXPOSITIONX;
    
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    NSNumber *value_0 = @( forwardNum * 5    + centerValue);
    NSNumber *value_1 = @(-forwardNum * 10   + centerValue);
    NSNumber *value_2 = @( forwardNum * 1000 + centerValue);
    
    [bounce setKeyTimes:@[@.2, @(0.4), @(0.45), @(1)]];
    [bounce setValues:@[value_0, value_1, value_2, @(centerValue)]];
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@1, @0]];
    [opacity setKeyTimes:@[@(.45), @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity, bounce]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:selectName];
    });
    return group;
}

#pragma mark - Fading Entrances

- (nonnull CAAnimation *)ytx_fadeInAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeInAnimtionWithDurationTime:"
                                           isIn:YES
                                    isTransform:NO
                                          isBig:NO
                                      isForward:NO
                                     isVertical:NO
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeInDownAnimtionWithDurationTime:"
                                           isIn:YES
                                    isTransform:YES
                                          isBig:NO
                                      isForward:NO
                                     isVertical:YES
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeInDownBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeInDownBigAnimtionWithDurationTime:"
                                           isIn:YES
                                    isTransform:YES
                                          isBig:YES
                                      isForward:NO
                                     isVertical:YES
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeInLeftAnimtionWithDurationTime:"
                                           isIn:YES
                                    isTransform:YES
                                          isBig:NO
                                      isForward:NO
                                     isVertical:NO
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeInLeftBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeInLeftBigAnimtionWithDurationTime:"
                                           isIn:YES
                                    isTransform:YES
                                          isBig:YES
                                      isForward:NO
                                     isVertical:NO
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeInRightAnimtionWithDurationTime:"
                                           isIn:YES
                                    isTransform:YES
                                          isBig:NO
                                      isForward:YES
                                     isVertical:NO
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeInRightBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeInRightBigAnimtionWithDurationTime:"
                                           isIn:YES
                                    isTransform:YES
                                          isBig:YES
                                      isForward:YES
                                     isVertical:NO
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeInUpAnimtionWithDurationTime:"
                                           isIn:YES
                                    isTransform:YES
                                          isBig:NO
                                      isForward:YES
                                     isVertical:YES
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeInUpBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeInUpBigAnimtionWithDurationTime:"
                                           isIn:YES
                                    isTransform:YES
                                          isBig:YES
                                      isForward:YES
                                     isVertical:YES
                                   durationTime:durationTime];
}

#pragma mark - Fading Exits
- (nonnull CAAnimation *)ytx_fadeOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeOutAnimtionWithDurationTime:"
                                           isIn:NO
                                    isTransform:NO
                                          isBig:NO
                                      isForward:NO
                                     isVertical:NO
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeOutDownAnimtionWithDurationTime:"
                                           isIn:NO
                                    isTransform:YES
                                          isBig:NO
                                      isForward:NO
                                     isVertical:YES
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeOutDownBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeOutDownBigAnimtionWithDurationTime:"
                                           isIn:NO
                                    isTransform:YES
                                          isBig:YES
                                      isForward:NO
                                     isVertical:YES
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeOutLeftAnimtionWithDurationTime:"
                                           isIn:NO
                                    isTransform:YES
                                          isBig:NO
                                      isForward:NO
                                     isVertical:NO
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeOutLeftBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeOutLeftBigAnimtionWithDurationTime:"
                                           isIn:NO
                                    isTransform:YES
                                          isBig:YES
                                      isForward:NO
                                     isVertical:NO
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeOutRightAnimtionWithDurationTime:"
                                           isIn:NO
                                    isTransform:YES
                                          isBig:NO
                                      isForward:YES
                                     isVertical:NO
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeOutRightBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeOutRightBigAnimtionWithDurationTime:"
                                           isIn:NO
                                    isTransform:YES
                                          isBig:YES
                                      isForward:YES
                                     isVertical:NO
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeOutUpAnimtionWithDurationTime:"
                                           isIn:NO
                                    isTransform:YES
                                          isBig:NO
                                      isForward:YES
                                     isVertical:YES
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeOutUpBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_fadeAnimtionWithSelectName:@"ytx_fadeOutUpBigAnimtionWithDurationTime:"
                                           isIn:NO
                                    isTransform:YES
                                          isBig:YES
                                      isForward:YES
                                     isVertical:YES
                                   durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_fadeAnimtionWithSelectName:(NSString *)name isIn:(BOOL)isIn isTransform:(BOOL)isTransform isBig:(BOOL)isBig isForward:(BOOL)isForward isVertical:(BOOL)isVertical durationTime:(NSTimeInterval)durationTime
{
    NSArray *opacityValues = isIn ? @[@0, @1] : @[@1, @0];
    CAKeyframeAnimation *fadeOpacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [fadeOpacity setValues:opacityValues];
    
    if (!isTransform)
    {
        [fadeOpacity setDuration:durationTime];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.layer addAnimation:fadeOpacity forKey:name];
        });
        return fadeOpacity;
    }
    
    // isForward 是否up或right
    float      forwardNum        = isForward ? 1 : -1;
    float      forwardValue      = isBig ? YTXBIGDISTANCEVALUE : YTXSELFHEIGHT;
    NSString * keyPath           = isVertical ? YTXPOSITIONY : YTXPOSITIONX;
    CGFloat    centerValue       = isVertical ? self.center.y : self.center.x;
    NSArray  * positionValues    = isIn ? @[@(forwardNum * forwardValue + centerValue), @(centerValue)] : @[@(centerValue),@(forwardNum * forwardValue + centerValue)];
    
    CAKeyframeAnimation *fadePosition = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    [fadePosition setValues:positionValues];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeOpacity, fadePosition]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:name];
    });
    return group;
}

#pragma mark - Flippers

- (nonnull CAAnimation *)ytx_flipAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CATransform3D transform         = CATransform3DIdentity;
    transform.m34                   = - 1 / 200.0;
    
    CAKeyframeAnimation *animation  = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    
    CAMediaTimingFunction * easeOut = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    CAMediaTimingFunction * easeIn  = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CATransform3D frame0  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-360], 0, 1, 0);
    CATransform3D frame4  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-190], 0, 1, 0);
    frame4.m43            = 75.0;
    CATransform3D frame5  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-170], 0, 1, 0);
    frame5.m43            = 75.0;
    CATransform3D frame8  = CATransform3DScale (transform,.95, .95, .95);
    CATransform3D frame10 = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-0],   0, 1, 0);
    
    animation.keyTimes        = @[@(0), @(0.4), @(0.5), @(0.8), @(1)];
    animation.timingFunctions = @[easeOut, easeOut, easeIn, easeIn, easeIn];
    
    animation.values = [NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:frame0],
                        [NSValue valueWithCATransform3D:frame4],
                        [NSValue valueWithCATransform3D:frame5],
                        [NSValue valueWithCATransform3D:frame8],
                        [NSValue valueWithCATransform3D:frame10],
                        nil];
    
    animation.duration = durationTime;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:animation forKey:@"ytx_flipAnimtionWithDurationTime:"];
    });
    return animation;
}

- (nonnull CAAnimation *)ytx_flipInXAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    
    CATransform3D transform         = CATransform3DIdentity;
    transform.m34                   = - 1 / 200.0;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    
    CAMediaTimingFunction * easeIn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CATransform3D frame0  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:90],  1, 0, 0);
    CATransform3D frame4  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-20], 1, 0, 0);
    CATransform3D frame6  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:10],  1, 0, 0);
    CATransform3D frame8  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-5],  1, 0, 0);
    CATransform3D frame10 = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:0],   1, 0, 0);
    
    animation.keyTimes = @[@(0), @(0.4), @(0.6), @(0.8), @(1)];
    animation.timingFunctions = @[easeIn, easeIn];
    animation.values   = [NSArray arrayWithObjects:
                          [NSValue valueWithCATransform3D:frame0],
                          [NSValue valueWithCATransform3D:frame4],
                          [NSValue valueWithCATransform3D:frame6],
                          [NSValue valueWithCATransform3D:frame8],
                          [NSValue valueWithCATransform3D:frame10],
                          nil];
    
    CAKeyframeAnimation *animationOpacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [animationOpacity setKeyTimes:@[@(0), @(0.6)]];
    [animationOpacity setValues:@[@(0), @(1)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[animation,animationOpacity]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_flipInXAnimtionWithDurationTime:"];
    });
    return group;
}

- (nonnull CAAnimation *)ytx_flipInYAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CATransform3D transform         = CATransform3DIdentity;
    transform.m34                   = - 1 / 200.0;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    
    CAMediaTimingFunction * easeIn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CATransform3D frame0  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:90],  0, 1, 0);
    CATransform3D frame4  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-20], 0, 1, 0);
    CATransform3D frame6  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:10],  0, 1, 0);
    CATransform3D frame8  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-5],  0, 1, 0);
    CATransform3D frame10 = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:0],   0, 1, 0);
    
    animation.keyTimes = @[@(0), @(0.4), @(0.6), @(0.8), @(1)];
    animation.timingFunctions = @[easeIn, easeIn];
    animation.values = [NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:frame0],
                        [NSValue valueWithCATransform3D:frame4],
                        [NSValue valueWithCATransform3D:frame6],
                        [NSValue valueWithCATransform3D:frame8],
                        [NSValue valueWithCATransform3D:frame10],
                        nil];
    
    CAKeyframeAnimation *animationOpacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [animationOpacity setKeyTimes:@[@(0), @(0.6)]];
    [animationOpacity setValues:@[@(0), @(1)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[animation,animationOpacity]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_flipInYAnimtionWithDurationTime:"];
    });
    return group;
}

- (nonnull CAAnimation *)ytx_flipOutXAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CATransform3D transform         = CATransform3DIdentity;
    transform.m34                   = - 1 / 200.0;
    
    CAKeyframeAnimation *animation  = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    
    CATransform3D frame0  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:0],   1, 0, 0);
    CATransform3D frame3  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-20], 1, 0, 0);
    CATransform3D frame10 = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:90],  1, 0, 0);
    
    animation.keyTimes = @[@(0),@(.3), @(1)];
    animation.values   = [NSArray arrayWithObjects:
                          [NSValue valueWithCATransform3D:frame0],
                          [NSValue valueWithCATransform3D:frame3],
                          [NSValue valueWithCATransform3D:frame10],
                          nil];
    
    CAKeyframeAnimation *animationOpacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [animationOpacity setKeyTimes:@[@(.3), @(1)]];
    [animationOpacity setValues:@[@(1), @(0)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[animation,animationOpacity]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_flipOutXAnimtionWithDurationTime:"];
    });
    return group;
}

- (nonnull CAAnimation *)ytx_flipOutYAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CATransform3D transform         = CATransform3DIdentity;
    transform.m34                   = - 1 / 200.0;
    
    CAKeyframeAnimation *animation  = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    
    CATransform3D frame0  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:0],   0, 1, 0);
    CATransform3D frame3  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-15], 0, 1, 0);
    CATransform3D frame10 = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:90],  0, 1, 0);
    
    animation.keyTimes = @[@(0), @(.3), @(1)];
    animation.values   = [NSArray arrayWithObjects:
                          [NSValue valueWithCATransform3D:frame0],
                          [NSValue valueWithCATransform3D:frame3],
                          [NSValue valueWithCATransform3D:frame10],
                          nil];
    
    CAKeyframeAnimation *animationOpacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [animationOpacity setKeyTimes:@[@(.3), @(1)]];
    animationOpacity.values = @[@(1), @(0)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[animation,animationOpacity]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_flipOutYAnimtionWithDurationTime:"];
    });
    return group;
}

#pragma mark - LightSpeed

- (nonnull CAAnimation *)ytx_lightSpeedInAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    
    // c = tan(45.f / 180.f * M_PI)
    CGAffineTransform transform0 = CGAffineTransformIdentity;
    transform0.c = tan([YTXAnimationsUtil radianWithDegree:-30]);
    CATransform3D frame0  =  CATransform3DMakeAffineTransform(transform0);
    frame0.m41 = YTXSELFWIDTH;
    
    CGAffineTransform transform6 = CGAffineTransformIdentity;
    transform6.c = tan([YTXAnimationsUtil radianWithDegree:20]);
    CATransform3D frame6  =  CATransform3DMakeAffineTransform(transform6);
    
    CGAffineTransform transform8 = CGAffineTransformIdentity;
    transform8.c = tan([YTXAnimationsUtil radianWithDegree:-5]);
    CATransform3D frame8  =  CATransform3DMakeAffineTransform(transform8);
    
    CGAffineTransform transform10 = CGAffineTransformIdentity;
    transform10.c = 0.0;
    CATransform3D frame10  = CATransform3DMakeAffineTransform(transform10);
    
    animation.keyTimes = @[@(0),@(.6), @(.8), @(1)];
    animation.values =  [NSArray arrayWithObjects:
                         [NSValue valueWithCATransform3D:frame0],
                         [NSValue valueWithCATransform3D:frame6],
                         [NSValue valueWithCATransform3D:frame8],
                         [NSValue valueWithCATransform3D:frame10],
                         nil];
    
    
    
    CAKeyframeAnimation *animationOpacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [animationOpacity setKeyTimes:@[@(0),@(.6), @(.8), @(1)]];
    animationOpacity.values = @[@(0), @(1), @(1), @(1)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[animation,animationOpacity]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_lightSpeedInAnimtionWithDurationTime:"];
    });
    return group;
}

- (nonnull CAAnimation *)ytx_lightSpeedOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    
    // c = tan(45.f / 180.f * M_PI)
    CGAffineTransform transform0 = CGAffineTransformIdentity;
    transform0.c = 0.0;
    CATransform3D frame0  =  CATransform3DMakeAffineTransform(transform0);
    
    CGAffineTransform transform10 = CGAffineTransformIdentity;
    transform10.c = tan([YTXAnimationsUtil radianWithDegree:30]);
    CATransform3D frame10  = CATransform3DMakeAffineTransform(transform10);
    frame10.m41 = YTXSELFWIDTH;
    
    
    animation.keyTimes = @[@(0), @(1)];
    animation.values =  [NSArray arrayWithObjects:
                         [NSValue valueWithCATransform3D:frame0],
                         [NSValue valueWithCATransform3D:frame10],
                         nil];
    
    CAKeyframeAnimation *animationOpacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [animationOpacity setKeyTimes:@[@(0), @(1)]];
    animationOpacity.values = @[@(1), @(0)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[animation,animationOpacity]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_lightSpeedOutAnimtionWithDurationTime:"];
    });
    return group;
}

#pragma mark - Zoom Exits

- (nonnull CAAnimation *)ytx_zoomOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *zoomOutOpacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [zoomOutOpacity setValues:@[@1, @0]];
    
    CAKeyframeAnimation *zoomOutTransform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [zoomOutTransform setValues:@[YTXSCALEVALUE(1.0, 1.0, 1.0),
                                  YTXSCALEVALUE(0.3, 0.3, 0.3)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomOutOpacity, zoomOutTransform]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_zoomOutAnimtionWithDurationTime:"];
    });
    return group;
}

- (nonnull CAAnimation *)ytx_zoomOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_zoomOutAnimtionWithSelectName:@"ytx_zoomOutDownAnimtionWithDurationTime:"
                                       hasFunction:YES
                                     anchorPoint04:CGPointMake(0.5, 1)
                                      positionPath:YTXPOSITIONY
                                   positionValue04:-30
                                   positionValue10:YTXBIGDISTANCEVALUE
                                      durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_zoomOutAnimtionWithSelectName:@"ytx_zoomOutLeftAnimtionWithDurationTime:"
                                       hasFunction:NO
                                       anchorPoint04:CGPointMake(0, .5)
                                      positionPath:YTXPOSITIONX
                                   positionValue04:21
                                   positionValue10:-YTXBIGDISTANCEVALUE
                                      durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_zoomOutAnimtionWithSelectName:@"ytx_zoomOutRightAnimtionWithDurationTime:"
                                       hasFunction:NO
                                     anchorPoint04:CGPointMake(1, .5)
                                      positionPath:YTXPOSITIONX
                                   positionValue04:-21
                                   positionValue10:YTXBIGDISTANCEVALUE
                                      durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_zoomOutAnimtionWithSelectName:@"ytx_zoomOutUpAnimtionWithDurationTime:"
                                       hasFunction:YES
                                     anchorPoint04:CGPointMake(0.5, 0)
                                      positionPath:YTXPOSITIONY
                                   positionValue04:30
                                   positionValue10:-YTXBIGDISTANCEVALUE
                                      durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomOutAnimtionWithSelectName:(NSString *)selectName hasFunction:(BOOL)hasFunction anchorPoint04:(CGPoint)anchorPoint04 positionPath:(NSString *)positionPath positionValue04:(CGFloat)positionValue04 positionValue10:(CGFloat)positionValue10 durationTime:(NSTimeInterval)durationTime
{
    
    CAKeyframeAnimation *zoomOutOpacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [zoomOutOpacity setValues:@[@1.0, @0]];
    [zoomOutOpacity setKeyTimes:@[@.4, @1]];
    
    CAKeyframeAnimation *zoomOutScale = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [zoomOutScale setValues:@[YTXSCALEVALUE(1, 1, 1),
                              YTXSCALEVALUE(.475, .475, .475),
                              YTXSCALEVALUE(.1, .1, .1)]];
    [zoomOutScale setKeyTimes:@[@0, @.4, @1]];
    
    CAKeyframeAnimation *zoomOutAnchorPoint = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    
    CGPoint anchorPoint = CGPointMake(0.5, 0.5);
    
    [zoomOutAnchorPoint setValues:@[YTXCGPOINTVALUE(anchorPoint),
                                    YTXCGPOINTVALUE(anchorPoint04),
                                    YTXCGPOINTVALUE(anchorPoint)]];
    [zoomOutAnchorPoint setKeyTimes:@[@.4, YTXANCHORLASTKEYTIME, @1]];
    
    CGPoint position04 = [YTXAnimationsUtil positionWithAnchorPoint:anchorPoint04 andView:self];
    CGPoint position10 = [YTXAnimationsUtil positionWithAnchorPoint:anchorPoint andView:self];
    
    if ([positionPath isEqualToString:YTXPOSITIONX]) {
        position04.x += positionValue04;
        position10.x += positionValue10;
    }else {
        position04.y += positionValue04;
        position10.y += positionValue10;
    }
    
    CAKeyframeAnimation *zoomOutPosition = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITION];
    [zoomOutPosition setValues:@[
                                 YTXANCHORPOINTVALUE(anchorPoint),
                                 YTXCGPOINTVALUE(position04),
                                 YTXCGPOINTVALUE(position10),
                                 ]];
    [zoomOutPosition setKeyTimes:@[@0, @.4, @1]];
    
    if (hasFunction) {
        CAMediaTimingFunction *function   = YTXCAMEDIATIMINGFUNCTION(.550, .055, .675, .19);
        CAMediaTimingFunction *function_2 = YTXCAMEDIATIMINGFUNCTION(.175, .885, .320, 1);
        CAMediaTimingFunction *liner      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [zoomOutScale setTimingFunctions:@[liner, function, function_2]];
        [zoomOutPosition setTimingFunctions:@[liner, function, function_2]];
    }
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomOutOpacity, zoomOutScale, zoomOutPosition, zoomOutAnchorPoint]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:selectName];
    });
    return group;
}

#pragma mark - Zoom Entrances

- (nonnull CAAnimation *)ytx_zoomInAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *zoomInOpacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [zoomInOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *zoomInTransform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [zoomInTransform setValues:@[YTXSCALEVALUE(.3, .3, .3),
                                 YTXSCALEVALUE(1, 1, 1),]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomInOpacity,zoomInTransform]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_zoomInAnimtionWithDurationTime:"];
    });
    return group;
}

- (nonnull CAAnimation *)ytx_zoomInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat y = self.center.y;
    return [self ytx_zoomInAnimtionWithSelectName:@"ytx_zoomInDownAnimtionWithDurationTime:"
                                     positionPath:YTXPOSITIONY
                                   positionValues:@[@(y - 500), @(y + 5), @(y)]
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat x = self.center.x;
    return [self ytx_zoomInAnimtionWithSelectName:@"ytx_zoomInLeftAnimtionWithDurationTime:"
                                     positionPath:YTXPOSITIONX
                                   positionValues:@[@(x - 500), @(x + 5),@(x)]
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat x = self.center.x;
    return [self ytx_zoomInAnimtionWithSelectName:@"ytx_zoomInRightAnimtionWithDurationTime:"
                                     positionPath:YTXPOSITIONX
                                   positionValues:@[@(x + 500), @(x - 5),@(x)]
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat y = self.center.y;
    return [self ytx_zoomInAnimtionWithSelectName:@"ytx_zoomInUpAnimtionWithDurationTime:"
                                     positionPath:YTXPOSITIONY
                                   positionValues:@[@(y + 500), @(y - 30), @(y)]
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomInAnimtionWithSelectName:(NSString *)selectName positionPath:(NSString *)positionPath positionValues:(NSArray *)positionValues durationTime:(NSTimeInterval)durationTime
{
    CAMediaTimingFunction *function   = YTXCAMEDIATIMINGFUNCTION(.550, .055, .675, .19);
    CAMediaTimingFunction *function_2 = YTXCAMEDIATIMINGFUNCTION(.175, .885, .320, 1);
    CAMediaTimingFunction *liner      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CAKeyframeAnimation *zoomInOpacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [zoomInOpacity setValues:@[@0, @1]];
    [zoomInOpacity setKeyTimes:@[@0, @.6]];
    
    CAKeyframeAnimation *zoomInScale = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [zoomInScale setValues:@[YTXSCALEVALUE(.0, .0, .0),
                             YTXSCALEVALUE(.475, .475, .475),
                             YTXSCALEVALUE(1, 1, 1)]];
    [zoomInScale setKeyTimes:@[@0, @.6, @1]];
    [zoomInScale setTimingFunctions:@[function, function_2]];
    
    CAKeyframeAnimation *zoomInPosition = [CAKeyframeAnimation animationWithKeyPath:positionPath];
    [zoomInPosition setValues:positionValues];
    [zoomInPosition setKeyTimes:@[@0, @.6, @1]];
    [zoomInPosition setTimingFunctions:@[liner, function, function_2]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomInOpacity, zoomInScale, zoomInPosition]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:selectName];
    });
    return group;
}

#pragma mark - Slide Entrances
- (nonnull CAAnimation *)ytx_slideInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideInDownAnimtionWithDurationTime:"
                                            isIn:YES
                                 translateValues:@[YTXTRANSLATEVALUE(0, YTXSELFHEIGHT, 0),
                                                   YTXTRANSLATEVALUE(0, 0, 0)]
                                    durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideInLeftAnimtionWithDurationTime:"
                                            isIn:YES
                                 translateValues:@[YTXTRANSLATEVALUE(-YTXSELFWIDTH, 0, 0),
                                                   YTXTRANSLATEVALUE(0, 0, 0)]
                                    durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideInRightAnimtionWithDurationTime:"
                                            isIn:YES
                                 translateValues:@[YTXTRANSLATEVALUE(YTXSELFWIDTH, 0, 0),
                                                   YTXTRANSLATEVALUE(0, 0, 0)]
                                    durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideInUpAnimtionWithDurationTime:"
                                            isIn:YES
                                 translateValues:@[YTXTRANSLATEVALUE(0, -YTXSELFHEIGHT, 0),
                                                   YTXTRANSLATEVALUE(0, 0, 0)]
                                    durationTime:durationTime];
}

#pragma mark - Slide Exits

- (nonnull CAAnimation *)ytx_slideOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutDownAnimtionWithDurationTime:"
                                            isIn:NO
                                 translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                   YTXTRANSLATEVALUE(0, YTXSELFHEIGHT, 0)]
                                    durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutLeftAnimtionWithDurationTime:"
                                            isIn:NO
                                 translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                   YTXTRANSLATEVALUE(-YTXSELFWIDTH, 0, 0)]
                                    durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutRightAnimtionWithDurationTime:"
                                            isIn:NO
                                 translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                   YTXTRANSLATEVALUE(YTXSELFWIDTH, 0, 0)]
                                    durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutUpAnimtionWithDurationTime:"
                                            isIn:NO
                                 translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                   YTXTRANSLATEVALUE(0, -YTXSELFHEIGHT, 0)]
                                    durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideAnimtionWithSelectName:(NSString *)selectName isIn:(BOOL)isIn translateValues:(NSArray *)translateValues durationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues:translateValues];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[transform]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:selectName];
    });
    return group;
}

#pragma mark - Rotating Entrances

- (nonnull CAAnimation *)ytx_rotateInAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateInAnimtionWithDurationTime:"
                                             isIn:YES
                                      rotateValue:[YTXAnimationsUtil radianWithDegree:200]
                                      anchorPoint:CGPointMake(0.5, 0.5)
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_rotateInDownLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    
    
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateInDownLeftAnimtionWithDurationTime:"
                                             isIn:YES
                                      rotateValue:[YTXAnimationsUtil radianWithDegree:-45]
                                      anchorPoint:CGPointMake(0, 1)
                                     durationTime:durationTime];
    
}

- (nonnull CAAnimation *)ytx_rotateInDownRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateInDownRightAnimtionWithDurationTime:"
                                             isIn:YES
                                      rotateValue:[YTXAnimationsUtil radianWithDegree:45]
                                      anchorPoint:CGPointMake(1, 1)
                                     durationTime:durationTime];
    
}

- (nonnull CAAnimation *)ytx_rotateInUpLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateInUpLeftAnimtionWithDurationTime:"
                                             isIn:YES
                                      rotateValue:[YTXAnimationsUtil radianWithDegree:45]
                                      anchorPoint:CGPointMake(0, 0)
                                     durationTime:durationTime];
    
}

- (nonnull CAAnimation *)ytx_rotateInUpRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateInUpRightAnimtionWithDurationTime:"
                                             isIn:YES
                                      rotateValue:[YTXAnimationsUtil radianWithDegree:-45]
                                      anchorPoint:CGPointMake(1, 0)
                                     durationTime:durationTime];
    
}

#pragma mark - Rotating Exits

- (nonnull CAAnimation *)ytx_rotateOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateOutAnimtionWithDurationTime:"
                                             isIn:NO
                                      rotateValue:[YTXAnimationsUtil radianWithDegree:200]
                                      anchorPoint:CGPointMake(.5,.5)
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_rotateOutDownLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateOutDownLeftAnimtionWithDurationTime:"
                                             isIn:NO
                                      rotateValue:[YTXAnimationsUtil radianWithDegree:45]
                                      anchorPoint:CGPointMake(0, 1)
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_rotateOutDownRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateOutDownRightAnimtionWithDurationTime:"
                                             isIn:NO
                                      rotateValue:[YTXAnimationsUtil radianWithDegree:-45]
                                      anchorPoint:CGPointMake(1, 1)
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_rotateOutUpLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateOutUpLeftAnimtionWithDurationTime:"
                                             isIn:NO
                                      rotateValue:[YTXAnimationsUtil radianWithDegree:-90]
                                      anchorPoint:CGPointMake(0, 1)
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_rotateOutUpRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return  [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateOutUpRightAnimtionWithDurationTime:"
                                              isIn:NO
                                       rotateValue:[YTXAnimationsUtil radianWithDegree:90]
                                       anchorPoint:CGPointMake(1, 1)
                                      durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_rotateAnimtionWithSelectName:(NSString *)name isIn:(BOOL)isIn rotateValue:(float)rotate anchorPoint:(CGPoint)point durationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:isIn ? @[@0, @1] : @[@1, @0]];
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues:isIn ?
     @[YTXROTATEVALUE(rotate, 0, 0, 1),YTXROTATEVALUE(0, 0, 0, 0)] :
     @[YTXROTATEVALUE(0, 0, 0, 0)     ,YTXROTATEVALUE(rotate, 0, 0, 1)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
   
        CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
        [anchor setValues:@[YTXCGPOINTVALUE(point),
                            YTXCGPOINTVALUE(point),
                            YTXPOINTVALUE(0.5, 0.5)]];
        [anchor setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
        
        
        CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITION];
        [position setValues:@[YTXANCHORPOINTVALUE(point),
                              YTXANCHORPOINTVALUE(point)]];
        [anchor setKeyTimes:@[@0, YTXANCHORLASTKEYTIME]];
        
        [group setAnimations:@[opacity, transform, anchor, position]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:name];
    });
    return group;
}

#pragma mark - Special

- (nonnull CAAnimation *)ytx_hingeAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate_1 = [YTXAnimationsUtil radianWithDegree:80];
    float rotate_2 = [YTXAnimationsUtil radianWithDegree:60];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:YTXTRANSFORM];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [animation setValues:@[YTXROTATEVALUE(0, 0, 0, 1),
                           YTXROTATEVALUE(rotate_1, 0, 0, 1),
                           YTXROTATEVALUE(rotate_2, 0, 0, 1),
                           YTXROTATEVALUE(rotate_1, 0, 0, 1),
                           YTXROTATEVALUE(rotate_2, 0, 0, 1),
                           ]];
    
    CAKeyframeAnimation *anchorAnimation = [CAKeyframeAnimation  animationWithKeyPath:YTXANCHORPOINT];
    
    [anchorAnimation setValues:@[YTXPOINTVALUE(0, 0),
                                 YTXPOINTVALUE(0, 0),
                                 YTXPOINTVALUE(0.5, 0.5)]];
    [anchorAnimation setKeyTimes:@[@(0), @(.99), @(1)]];
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@1, @0]];
    [opacity setKeyTimes:@[@(.8), @1]];
    
    CGPoint point = [YTXAnimationsUtil positionWithAnchorPoint:CGPointMake(0, 0) andView:self];
    point.y += 350;
    CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [position setValues:@[YTXANCHORPOINTVALUE(CGPointMake(0, 0)),
                          YTXCGPOINTVALUE(point),
                          YTXANCHORPOINTVALUE(CGPointMake(0.5, 0.5))]];
    [position setKeyTimes:@[@(.8), @.99, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[anchorAnimation, animation, opacity, position]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_hingeAnimtionWithDurationTime:"];
    });
    return group;
}

- (nonnull CAAnimation *)ytx_rollInAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rollAnimationWithSelectName:@"ytx_rollInAnimationWithDurationTime:" isIn:YES durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_rollOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rollAnimationWithSelectName:@"ytx_rollInAnimationWithDurationTime:" isIn:NO durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_rollAnimationWithSelectName:(NSString *)name isIn:(BOOL)isIn durationTime:(NSTimeInterval)durationTime
{
    float rotate_1 = [YTXAnimationsUtil radianWithDegree:120];
    CGFloat width  = [UIScreen mainScreen].bounds.size.width;
    CGFloat x      = self.center.x;
    NSArray *animationValues = isIn? @[YTXROTATEVALUE(-rotate_1, 0, 0, 1), YTXROTATEVALUE(0, 0, 0, 1)] : @[YTXROTATEVALUE(0, 0, 0, 1), YTXROTATEVALUE(rotate_1, 0, 0, 1)];
    NSArray *positionValues  = isIn? @[@(-width + x), @(x)] : @[@(x), @(width+x)];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [animation setValues:animationValues];
    
    
    CAKeyframeAnimation *position  = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITIONX];
    [position setValues:positionValues];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[position, animation]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:name];
    });
    return group;
}

@end
