//
//  UIView+YTXAnimation.m
//  p4
//
//  Created by 李龙龙 on 12 * rotate/4/7.
//  Copyright © 2012 * rotate年 com.baidao. All rights reserved.
//

#import "UIView+YTXAnimation.h"

// 转化为NSValue
#define YTXScaleValue(x,y,z)     [NSValue valueWithCATransform3D:CATransform3DScale(self.layer.transform, (x), (y), (z))]

#define YTXRotateValue(d,x,y,z)  [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, (d), (x), (y), (z))]

#define YTXTranslateValue(x,y,z) [NSValue valueWithCATransform3D:CATransform3DTranslate(self.layer.transform, (x), (y), (z))]

#define YTXPointValue(x,y)       [NSValue valueWithCGPoint:CGPointMake((x), (y))]

//屏幕宽度
#define SELF_WIDTH              (self.frame.size.width)
#define SELF_HEIGHT             (self.frame.size.height)

#define YTX_RADIAN(x)             ((x) * M_PI / 180.0)

//获取YTXCAMediaTimingFunction
#define YTXCAMediaTimingFunction(x1,y1,x2,y2) [CAMediaTimingFunction functionWithControlPoints:x1 :y1 :x2 :y2]

#define BIG_DISTANCE_VALUE 1000 

#define OPACITY @"opacity"
#define POSITION @"position"
#define POSITION_X @"position.x"
#define POSITION_Y @"position.y"
#define TRANSFORM @"transform"
#define ANCHORPOINT @"anchorPoint"

@implementation UIView (YTXAnimation)

#pragma mark - Attention Seekers

- (nonnull CAAnimation *)ytx_bounceAnimtionWithDurationTime:(NSTimeInterval)durationTime
{

    CAMediaTimingFunction *time_1 = YTXCAMediaTimingFunction (0.215, 0.610, 0.355, 1);
    CAMediaTimingFunction *time_2 = YTXCAMediaTimingFunction (0.755, 0.050, 0.855, 0.060);
    
    CGFloat y = self.center.y;
    NSNumber *value_0 = @(0 + y);
    NSNumber *value_1 = @(-15 + y);
    NSNumber *value_2 = @(-8 + y);
    NSNumber *value_3 = @(-2 + y);
    
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [bounce setValues:@[value_0,value_1,value_1,value_0,value_2,value_0,value_3]];
    [bounce setKeyTimes:@[@(0.2),@(0.4),@(0.43),@(.53),@(.7),@(.8),@(.9)]];
    [bounce setTimingFunctions:@[time_1,time_2,time_2,time_1,time_2,time_1,time_1,time_2]];
    bounce.duration = durationTime;
    [self.layer addAnimation:bounce forKey:@"ytx_bounceAnimtionWithDurationTime:"];
    return bounce;
}

- (nonnull CAAnimation *)ytx_flashAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
 
    CAKeyframeAnimation *flashAnimation = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [flashAnimation setValues:@[@(0),@(1),@(0),@(1)]];
    [flashAnimation setKeyTimes:@[@(0.25),@(0.5),@(.75),@(1)]];
    flashAnimation.duration = durationTime;
    [self.layer addAnimation:flashAnimation forKey:@"ytx_flashAnimtionWithDurationTime:"];
    return flashAnimation;
}

- (nonnull CAAnimation *)ytx_pluseAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    
    float smallScaleValue = 1;
    float lagerScaleValue = 1.05;
    
    NSValue *smallScale = YTXScaleValue(smallScaleValue, smallScaleValue, smallScaleValue);
    NSValue *lagerScale = YTXScaleValue(lagerScaleValue, lagerScaleValue, lagerScaleValue);
    
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation  animationWithKeyPath:TRANSFORM];
    shackAnimation.duration = durationTime;
    [shackAnimation setValues:@[smallScale,lagerScale,smallScale]];
    [shackAnimation setKeyTimes:@[@(0),@(.5),@(1)]];
    [self.layer addAnimation:shackAnimation forKey:@"ytx_pluseAnimtionWithDurationTime:"];
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_rubberBandAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    
    float smallScaleValue = 0.75;
    float smallMidScaleValue = 0.85;
    float defaultsmallScaleValue = 0.95;
    float defaultScaleValue = 1;
    float defaultlagerScaleValue = 1.05;
    float lagerMidScaleValue = 1.15;
    float lagerScaleValue = 1.25;
    
    NSValue *norScale = YTXScaleValue(defaultScaleValue, defaultScaleValue, defaultScaleValue);
    
    CAKeyframeAnimation *rubberBand = [CAKeyframeAnimation  animationWithKeyPath:TRANSFORM];
    rubberBand.duration = durationTime;
    [rubberBand setValues:@[norScale,
                            YTXScaleValue(lagerScaleValue, smallScaleValue, defaultScaleValue),
                            YTXScaleValue(smallScaleValue, lagerScaleValue, defaultScaleValue),
                            YTXScaleValue(lagerMidScaleValue, smallMidScaleValue, defaultScaleValue),
                            YTXScaleValue(defaultsmallScaleValue, defaultlagerScaleValue, defaultScaleValue),
                            YTXScaleValue(defaultlagerScaleValue, defaultsmallScaleValue, defaultScaleValue),
                            norScale
                            ]];
    [rubberBand setKeyTimes:@[@(0),@(0.3),@(0.4),@(.5),@(.65),@(.75),@(1)]];
    [self.layer addAnimation:rubberBand forKey:@"ytx_rubberBandAnimtionWithDurationTime:"];
    return rubberBand;
}

- (nonnull CAAnimation *)ytx_shakeAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    
    CGPoint center = self.center;
    float moveXLeft = center.x - 5;
    float moveXRight = center.x + 5;
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    shackAnimation.duration = durationTime;
    
    [shackAnimation setValues:@[@(center.x),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(center.x)]];
    [self.layer addAnimation:shackAnimation forKey:@"ytx_shakeAnimtionWithDurationTime:"];
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_swingAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotateF = YTX_RADIAN(15);
    float rotateS = YTX_RADIAN(10);
    float rotateT = YTX_RADIAN(5);
    
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    shackAnimation.duration = durationTime;
    
    [shackAnimation setValues:@[YTXRotateValue(0, 0.0 ,0.0 ,1.0),
                                YTXRotateValue(rotateF, 0.0 ,0.0 ,1.0),
                                YTXRotateValue(-rotateS, 0.0 ,0.0 ,1.0),
                                YTXRotateValue(rotateT, 0.0 ,0.0 ,1.0),
                                YTXRotateValue(-rotateT, 0.0 ,0.0 ,1.0),
                                YTXRotateValue(0, 0.0 ,0.0 ,1.0)]];
    
    [self.layer addAnimation:shackAnimation forKey:@"ytx_swingAnimtionWithDurationTime:"];
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_tadaAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate = YTX_RADIAN(3);
    float smallScaleValue = 0.9;
    float lagerScaleValue = 1.1;
    
    NSValue *defultScale = YTXScaleValue(1, 1, 1);
    NSValue *smallScale = YTXScaleValue(smallScaleValue, smallScaleValue, smallScaleValue);
    NSValue *lagerScale = YTXScaleValue(lagerScaleValue, lagerScaleValue, lagerScaleValue);
    NSValue *leftValue = YTXRotateValue(-rotate, 0.0 ,0.0 ,1.0);
    NSValue *rightValue = YTXRotateValue(rotate, 0.0 ,0.0 ,1.0);
    
    CAKeyframeAnimation *tadaAnimation = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    tadaAnimation.duration = durationTime;
    
    [tadaAnimation setValues:@[defultScale,smallScale,lagerScale,leftValue,rightValue,leftValue,rightValue,leftValue,rightValue,leftValue,rightValue,]];
    
    [self.layer addAnimation:tadaAnimation forKey:@"ytx_tadaAnimtionWithDurationTime:"];
    return tadaAnimation;
}

- (nonnull CAAnimation *)ytx_wobbleAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate_1 = YTX_RADIAN(5);
    float rotate_2 = YTX_RADIAN(3);
    float rotate_3 = YTX_RADIAN(2);
    float rotate_4 = YTX_RADIAN(1);
    
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation  animationWithKeyPath:TRANSFORM];
    [rotateAnimation setKeyTimes:@[@(0), @(.15), @(.3), @(.45), @(.6), @(.75), @(1)]];
    [rotateAnimation setValues:@[YTXRotateValue(0, 0.0 ,0.0 ,1.0),
                                 YTXRotateValue(-rotate_1, 0.0 ,0.0 ,1.0),
                                 YTXRotateValue(rotate_2 , 0.0 ,0.0 ,1.0),
                                 YTXRotateValue(-rotate_2, 0.0 ,0.0 ,1.0),
                                 YTXRotateValue(rotate_3, 0.0 ,0.0 ,1.0),
                                 YTXRotateValue(-rotate_4, 0.0 ,0.0 ,1.0),
                                 YTXRotateValue(0, 0.0 ,0.0 ,1.0)]];
  
    CGFloat x = self.center.x;
    CGFloat width = SELF_WIDTH;
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation  animationWithKeyPath:POSITION_X];
    [shakeAnimation setKeyTimes:@[@(0), @(.15), @(.3), @(.45), @(.6), @(.75), @(1)]];
    [shakeAnimation setValues:@[ @(x), @((-.25  * width) + x) ,@( (.2 * width) + x),@((-.15 * width) + x),@((.1 * width) + x),@( (-.05 * width) + x),@(x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[rotateAnimation,shakeAnimation]];
    [group setDuration:durationTime*.5];
    [self.layer addAnimation:group forKey:@"ytx_wobbleAnimtionWithDurationTime:"];
    return group;
}

- (nonnull CAAnimation *)ytx_jelloAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    
    float rotate_1 = -12.5       / 45.0;
    float rotate_2 = 6.25       / 45.0;
    float rotate_3 = -3.125      / 45.0;
    float rotate_4 = 1.5625     / 45.0;
    float rotate_5 = -0.78125    / 45.0;
    float rotate_6 = 0.390625   / 45.0;
    float rotate_7 = -0.1953125  / 45.0;
    
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
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:TRANSFORM];
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
                           
    [self.layer addAnimation:animation forKey:@"ytx_jelloAnimtionWithDurationTime:"];
    return animation;
}


#pragma mark - Bouncing Entrances
- (nonnull CAAnimation *)ytx_bounceInAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *bounceln = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [bounceln setValues:@[YTXScaleValue(.3, .3, .3),
                          YTXScaleValue(1.1, 1.1, 1.1),
                          YTXScaleValue(.9, .9, .9),
                          YTXScaleValue(1.03, 1.03, 1.03),
                          YTXScaleValue(0.97, 0.97, 0.97),
                          YTXScaleValue(1, 1, 1)]];
    CAMediaTimingFunction *time = YTXCAMediaTimingFunction (0.215, 0.610, 0.355, 1.000);
    [bounceln setKeyTimes:@[@0, @(0.2),@(0.4),@(.6),@(.8), @1]];
    [bounceln setTimingFunction:time];
    bounceln.duration = durationTime;
    [self.layer addAnimation:bounceln forKey:@"ytx_bounceInAnimtionWithDurationTime:"];
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
    NSString *keyPath = isVertical ? POSITION_Y : POSITION_X;
    float forwardNum = isForward ? 1 : -1;
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    
    NSNumber *value_0 = @(forwardNum * 1500 + centerValue);
    NSNumber *value_1 = @(-forwardNum * 12.5 + centerValue);
    NSNumber *value_2 = @(forwardNum * 5 + centerValue);
    NSNumber *value_3 = @(-forwardNum * 2.5 + centerValue);
    [bounce setValues:@[value_0, value_1, value_2, value_3, @(centerValue)]];
    [bounce setKeyTimes:@[@0, @(0.6),@(0.75),@(.9), @1]];
    
    CAMediaTimingFunction *time = YTXCAMediaTimingFunction (0.215, 0.610, 0.355, 1.000);
    [bounce setTimingFunction:time];
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [opacity setValues:@[@0,@1]];
    [opacity setKeyTimes:@[@(0), @.6]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity,bounce]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:selectName];
    return group;
}


#pragma mark - Bouncing Exits 
- (nonnull CAAnimation *)ytx_bounceOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [bounce setValues:@[YTXScaleValue(1, 1, 1),
                          YTXScaleValue(.9, .9, .9),
                          YTXScaleValue(1.1, 1.1, 1.1),
                          YTXScaleValue(1.1, 1.1, 1.1),
                          YTXScaleValue(.3, .3, .3)]];
    [bounce setKeyTimes:@[@0, @(0.2), @(0.5), @(.55), @1]];
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [opacity setValues:@[@1,@0]];
    [opacity setKeyTimes:@[@(.55), @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity,bounce]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_bounceOutAnimtionWithDurationTime:"];
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
    CGFloat centerValue = isVertical ? self.center.y : self.center.x;
    NSString *keyPath = isVertical ? POSITION_Y : POSITION_X;
    // isForward 是否up或right
    float forwardNum = isForward ? 1 : -1;
    
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    NSNumber *value_0 = @(forwardNum * 5 + centerValue);
    NSNumber *value_1 = @(-forwardNum * 10 + centerValue);
    NSNumber *value_2 = @(forwardNum * 1000 + centerValue);
    [bounce setKeyTimes:@[@.2, @(0.4),@(0.45),@(1)]];
    [bounce setValues:@[value_0, value_1, value_2, @(centerValue)]];
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [opacity setValues:@[@1,@0]];
    [opacity setKeyTimes:@[@(.45), @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity,bounce]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:selectName];
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
    CAKeyframeAnimation *fadeOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeOpacity setValues:opacityValues];
    
    if (!isTransform)
    {
        [fadeOpacity setDuration:durationTime];
        [self.layer addAnimation:fadeOpacity forKey:name];
        return fadeOpacity;
    }
    
    CGFloat centerValue = isVertical ? self.center.y : self.center.x;
    NSString *keyPath = isVertical ? POSITION_Y : POSITION_X;
    // isForward 是否up或right
    float forwardNum = isForward ? 1 : -1;
    float forwardValue = isBig ? BIG_DISTANCE_VALUE : SELF_HEIGHT;
    NSArray *positionValues = isIn ? @[@(forwardNum * forwardValue + centerValue), @(centerValue)] : @[@(centerValue),@(forwardNum * forwardValue + centerValue)];
    
    CAKeyframeAnimation *fadePosition = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    [fadePosition setValues:positionValues];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeOpacity, fadePosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:name];
    return group;
}

#pragma mark - Flippers
- (nonnull CAAnimation *)ytx_flipAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    NSString * key = @"ytx_flipAnimtionWithDurationTime:";
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1 / 200.0;
    CATransform3D sublayerTransform = self.layer.sublayerTransform;
    sublayerTransform.m34 = transform.m34;
    self.layer.sublayerTransform = sublayerTransform;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    
    CAMediaTimingFunction * easeOut = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    CAMediaTimingFunction * easeIn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CATransform3D frame0  = CATransform3DRotate(transform, YTX_RADIAN(360), 0, 1, 0);
    CATransform3D frame4  = CATransform3DRotate(transform, YTX_RADIAN(190), 0, 1, 0);
    frame4.m43 = 75.0;
    CATransform3D frame5  = CATransform3DRotate(transform, YTX_RADIAN(170), 0, 1, 0);
    frame5.m43 = 75.0;
    CATransform3D frame8  = CATransform3DScale (transform,.95, .95, .95);
    CATransform3D frame10 = CATransform3DRotate(transform, YTX_RADIAN(0),   0, 1, 0);
 
    animation.keyTimes = @[@(0), @(0.4), @(0.5), @(0.8), @(1)];
    animation.timingFunctions = @[easeOut, easeOut, easeIn, easeIn, easeIn];
    
    animation.values = [NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:frame0],
                        [NSValue valueWithCATransform3D:frame4],
                        [NSValue valueWithCATransform3D:frame5],
                        [NSValue valueWithCATransform3D:frame8],
                        [NSValue valueWithCATransform3D:frame10],
                        nil];
    
   [animation setValue:@1 forKey:key];
    animation.duration = durationTime;
    animation.delegate = self;
    [self.layer addAnimation:animation forKey:key];
    return animation;
}


- (nonnull CAAnimation *)ytx_flipInXAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    NSString * key = @"ytx_flipInXAnimtionWithDurationTime:";
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1 / 200.0;
    CATransform3D sublayerTransform = self.layer.sublayerTransform;
    sublayerTransform.m34 = transform.m34;
    self.layer.sublayerTransform = sublayerTransform;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    
    CAMediaTimingFunction * easeIn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CATransform3D frame0  = CATransform3DRotate(transform, YTX_RADIAN(-90),  1, 0, 0);
    CATransform3D frame4  = CATransform3DRotate(transform, YTX_RADIAN(20),   1, 0, 0);
    CATransform3D frame6  = CATransform3DRotate(transform, YTX_RADIAN(-10),  1, 0, 0);
    CATransform3D frame8  = CATransform3DRotate(transform, YTX_RADIAN(5),    1, 0, 0);
    CATransform3D frame10 = CATransform3DRotate(transform, YTX_RADIAN(0),    1, 0, 0);
    
    animation.keyTimes = @[@(0), @(0.4), @(0.6), @(0.8), @(1)];
    animation.timingFunctions = @[easeIn, easeIn];
    animation.delegate = self;
    animation.values = [NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:frame0],
                        [NSValue valueWithCATransform3D:frame4],
                        [NSValue valueWithCATransform3D:frame6],
                        [NSValue valueWithCATransform3D:frame8],
                        [NSValue valueWithCATransform3D:frame10],
                        nil];
    
    [animation setValue:@1 forKey:key];
    
    CAKeyframeAnimation *animationOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [animationOpacity setKeyTimes:@[@(0), @(0.6)]];
    animationOpacity.values = @[@(0), @(1)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[animation,animationOpacity]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:key];
    return group;
}

- (nonnull CAAnimation *)ytx_flipInYAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    NSString * key = @"ytx_flipInYAnimtionWithDurationTime:";
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1 / 200.0;
    CATransform3D sublayerTransform = self.layer.sublayerTransform;
    sublayerTransform.m34 = transform.m34;
    self.layer.sublayerTransform = sublayerTransform;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    
    CAMediaTimingFunction * easeIn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CATransform3D frame0  = CATransform3DRotate(transform, YTX_RADIAN(-90),  0, 1, 0);
    CATransform3D frame4  = CATransform3DRotate(transform, YTX_RADIAN(20),   0, 1, 0);
    CATransform3D frame6  = CATransform3DRotate(transform, YTX_RADIAN(-10),  0, 1, 0);
    CATransform3D frame8  = CATransform3DRotate(transform, YTX_RADIAN(5),    0, 1, 0);
    CATransform3D frame10 = CATransform3DRotate(transform, YTX_RADIAN(0),    0, 1, 0);
    
    animation.keyTimes = @[@(0), @(0.4), @(0.6), @(0.8), @(1)];
    animation.timingFunctions = @[easeIn, easeIn];
    animation.delegate = self;
    animation.values = [NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:frame0],
                        [NSValue valueWithCATransform3D:frame4],
                        [NSValue valueWithCATransform3D:frame6],
                        [NSValue valueWithCATransform3D:frame8],
                        [NSValue valueWithCATransform3D:frame10],
                        nil];
    
    [animation setValue:@1 forKey:key];
    
    
    CAKeyframeAnimation *animationOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [animationOpacity setKeyTimes:@[@(0), @(0.6)]];
    animationOpacity.values = @[@(0), @(1)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[animation,animationOpacity]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:key];
    return group;
    
}

- (nonnull CAAnimation *)ytx_flipOutXAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    NSString * key = @"ytx_flipOutXAnimtionWithDurationTime:";
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1 / 200.0;
    CATransform3D sublayerTransform = self.layer.sublayerTransform;
    sublayerTransform.m34 = transform.m34;
    self.layer.sublayerTransform = sublayerTransform;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
   
    CATransform3D frame0  = CATransform3DRotate(transform, YTX_RADIAN(0),  1, 0, 0);
    CATransform3D frame3  = CATransform3DRotate(transform, YTX_RADIAN(20), 1, 0, 0);
    CATransform3D frame10 = CATransform3DRotate(transform, YTX_RADIAN(-90),1, 0, 0);
    
    animation.keyTimes = @[@(0),@(.3), @(1)];
    animation.delegate = self;
    animation.values = [NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:frame0],
                        [NSValue valueWithCATransform3D:frame3],
                        [NSValue valueWithCATransform3D:frame10],
                        nil];
    
    [animation setValue:@1 forKey:key];
    
    
    CAKeyframeAnimation *animationOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [animationOpacity setKeyTimes:@[@(.3), @(1)]];
    animationOpacity.values = @[@(1), @(0)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[animation,animationOpacity]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:key];
    return group;
    
}

- (nonnull CAAnimation *)ytx_flipOutYAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    NSString * key = @"ytx_flipOutYAnimtionWithDurationTime:";
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1 / 200.0;
    CATransform3D sublayerTransform = self.layer.sublayerTransform;
    sublayerTransform.m34 = transform.m34;
    self.layer.sublayerTransform = sublayerTransform;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    
    CATransform3D frame0  = CATransform3DRotate(transform, YTX_RADIAN(0),  0, 1, 0);
    CATransform3D frame3  = CATransform3DRotate(transform, YTX_RADIAN(15), 0, 1, 0);
    CATransform3D frame10 = CATransform3DRotate(transform, YTX_RADIAN(-90),0, 1, 0);
    
    animation.keyTimes = @[@(0),@(.3), @(1)];
    animation.delegate = self;
    animation.values = [NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:frame0],
                        [NSValue valueWithCATransform3D:frame3],
                        [NSValue valueWithCATransform3D:frame10],
                        nil];
    
    [animation setValue:@1 forKey:key];
    
    
    CAKeyframeAnimation *animationOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [animationOpacity setKeyTimes:@[@(.3), @(1)]];
    animationOpacity.values = @[@(1), @(0)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[animation,animationOpacity]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:key];
    return group;
    
}
#pragma mark - Zoom Exits

- (nonnull CAAnimation *)ytx_zoomOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *zoomOutOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomOutOpacity setValues:@[@1, @0]];
    
    CAKeyframeAnimation *zoomOutTransform = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomOutTransform setValues:@[YTXScaleValue(1, 1, 1),
                                  YTXScaleValue(.3, .3, .3)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomOutOpacity,zoomOutTransform]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomOutAnimtionWithDurationTime:"];
    return group;
}

- (nonnull CAAnimation *)ytx_zoomOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat y = self.center.y;
    return [self ytx_zoomOutAnimtionWithSelectName:@"ytx_zoomOutDownAnimtionWithDurationTime:"
                                hasFunction:YES
                                anchorPoint:YTXPointValue(0.5, 1)
                               positionPath:POSITION_Y
                             positionValues:@[@(y), @(y - 30), @(y + BIG_DISTANCE_VALUE)]
                               durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat x = self.center.x;
    [self ytx_zoomOutAnimtionWithSelectName:@"ytx_zoomOutLeftAnimtionWithDurationTime:"
                                hasFunction:NO
                                anchorPoint:YTXPointValue(0, .5)
                               positionPath:POSITION_X
                             positionValues:@[@(x), @(x + 21),@(x - BIG_DISTANCE_VALUE)]
                               durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat x = self.center.x;
    return [self ytx_zoomOutAnimtionWithSelectName:@"ytx_zoomOutRightAnimtionWithDurationTime:"
                                hasFunction:NO
                                anchorPoint:YTXPointValue(1, .5)
                               positionPath:POSITION_X
                             positionValues:@[@(x), @(x - 21),@(x + BIG_DISTANCE_VALUE)]
                               durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat y = self.center.y;
    return [self ytx_zoomOutAnimtionWithSelectName:@"ytx_zoomOutUpAnimtionWithDurationTime:"
                                hasFunction:YES
                                anchorPoint:YTXPointValue(0.5, 0)
                               positionPath:POSITION_Y
                             positionValues:@[@(y), @(y + 30), @(y - BIG_DISTANCE_VALUE)]
                               durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomOutAnimtionWithSelectName:(NSString *)selectName hasFunction:(BOOL)hasFunction anchorPoint:(NSValue *)anchorPoint positionPath:(NSString *)positionPath positionValues:(NSArray *)positionValues durationTime:(NSTimeInterval)durationTime
{
    
    CAKeyframeAnimation *zoomOutOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomOutOpacity setValues:@[@1, @0]];
    [zoomOutOpacity setKeyTimes:@[@.4, @1]];
    
    CAKeyframeAnimation *zoomOutScale = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomOutScale setValues:@[YTXScaleValue(1, 1, 1),
                                YTXScaleValue(.475, .475, .475),
                                YTXScaleValue(.1, .1, .1)]];
    [zoomOutScale setKeyTimes:@[@0, @.4, @1]];
    
    CAKeyframeAnimation *zoomOutAnchorPoint = [CAKeyframeAnimation animationWithKeyPath:ANCHORPOINT];
    [zoomOutAnchorPoint setValues:@[YTXPointValue(0.5, 0.5),
                                      anchorPoint,
                                      YTXPointValue(0.5, 0.5)]];
    [zoomOutAnchorPoint setKeyTimes:@[@.4, @0.99, @1]];
    
    CAKeyframeAnimation *zoomOutPosition = [CAKeyframeAnimation animationWithKeyPath:positionPath];
    [zoomOutPosition setValues:positionValues];
    [zoomOutPosition setKeyTimes:@[@0, @.4, @1]];
    
    if (hasFunction) {
        CAMediaTimingFunction *function = YTXCAMediaTimingFunction(.550, .055, .675, .19);
        CAMediaTimingFunction *function_2 = YTXCAMediaTimingFunction(.175, .885, .320, 1);
        CAMediaTimingFunction *liner = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [zoomOutScale setTimingFunctions:@[liner, function, function_2]];
        [zoomOutPosition setTimingFunctions:@[liner, function, function_2]];
    }
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomOutOpacity, zoomOutScale, zoomOutPosition, zoomOutAnchorPoint]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:selectName];
    return group;
}

#pragma mark - Zoom Entrances

- (nonnull CAAnimation *)ytx_zoomInAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *zoomInOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomInOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *zoomInTransform = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomInTransform setValues:@[YTXScaleValue(.3, .3, .3),
                           YTXScaleValue(1, 1, 1),]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomInOpacity,zoomInTransform]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomInAnimtionWithDurationTime:"];
    return group;
}

- (nonnull CAAnimation *)ytx_zoomInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat y = self.center.y;
    return [self ytx_zoomInAnimtionWithSelectName:@"ytx_zoomInDownAnimtionWithDurationTime:"
                                     positionPath:POSITION_Y
                                   positionValues:@[@(y - 500), @(y + 5), @(y)]
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat x = self.center.x;
    return [self ytx_zoomInAnimtionWithSelectName:@"ytx_zoomInLeftAnimtionWithDurationTime:"
                                     positionPath:POSITION_X
                                   positionValues:@[@(x - 500), @(x + 5),@(x)]
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat x = self.center.x;
    return [self ytx_zoomInAnimtionWithSelectName:@"ytx_zoomInRightAnimtionWithDurationTime:"
                                     positionPath:POSITION_X
                                   positionValues:@[@(x + 500), @(x - 5),@(x)]
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CGFloat y = self.center.y;
    return [self ytx_zoomInAnimtionWithSelectName:@"ytx_zoomInUpAnimtionWithDurationTime:"
                                     positionPath:POSITION_Y
                                   positionValues:@[@(y + 500), @(y - 30), @(y)]
                                     durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_zoomInAnimtionWithSelectName:(NSString *)selectName positionPath:(NSString *)positionPath positionValues:(NSArray *)positionValues durationTime:(NSTimeInterval)durationTime
{
    CAMediaTimingFunction *function = YTXCAMediaTimingFunction(.550, .055, .675, .19);
    CAMediaTimingFunction *function_2 = YTXCAMediaTimingFunction(.175, .885, .320, 1);
    CAMediaTimingFunction *liner = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CAKeyframeAnimation *zoomInOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomInOpacity setValues:@[@0, @1]];
    [zoomInOpacity setKeyTimes:@[@0, @.6]];
    
    CAKeyframeAnimation *zoomInScale = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomInScale setValues:@[YTXScaleValue(.0, .0, .0),
                            YTXScaleValue(.475, .475, .475),
                            YTXScaleValue(1, 1, 1)]];
    [zoomInScale setKeyTimes:@[@0, @.6, @1]];
    [zoomInScale setTimingFunctions:@[ function, function_2]];
    
    CAKeyframeAnimation *zoomInPosition = [CAKeyframeAnimation animationWithKeyPath:positionPath];
    [zoomInPosition setValues:positionValues];
    [zoomInPosition setKeyTimes:@[@0, @.6, @1]];
    [zoomInPosition setTimingFunctions:@[liner, function, function_2]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomInOpacity, zoomInScale, zoomInPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:selectName];
    return group;
}

#pragma mark - Slide Entrances
- (nonnull CAAnimation *)ytx_slideInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideInDownAnimtionWithDurationTime:"
                                     isIn:YES
                          translateValues:@[YTXTranslateValue(0, SELF_HEIGHT, 0),
                                            YTXTranslateValue(0, 0, 0)]
                             durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideInLeftAnimtionWithDurationTime:"
                                     isIn:YES
                          translateValues:@[YTXTranslateValue(-SELF_WIDTH, 0, 0),
                                            YTXTranslateValue(0, 0, 0)]
                             durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideInRightAnimtionWithDurationTime:"
                                     isIn:YES
                          translateValues:@[YTXTranslateValue(SELF_WIDTH, 0, 0),
                                            YTXTranslateValue(0, 0, 0)]
                             durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideInUpAnimtionWithDurationTime:"
                                     isIn:YES
                          translateValues:@[YTXTranslateValue(0, -SELF_HEIGHT, 0),
                                            YTXTranslateValue(0, 0, 0)]
                             durationTime:durationTime];
}

#pragma mark - Slide Exits
- (nonnull CAAnimation *)ytx_slideOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutDownAnimtionWithDurationTime:"
                                     isIn:NO
                          translateValues:@[YTXTranslateValue(0, 0, 0),
                                            YTXTranslateValue(0, SELF_HEIGHT, 0)]
                             durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutLeftAnimtionWithDurationTime:"
                                     isIn:NO
                          translateValues:@[YTXTranslateValue(0, 0, 0),
                                            YTXTranslateValue(-SELF_WIDTH, 0, 0)]
                             durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutRightAnimtionWithDurationTime:"
                                     isIn:NO
                          translateValues:@[YTXTranslateValue(0, 0, 0),
                                            YTXTranslateValue(SELF_WIDTH, 0, 0)]
                             durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutUpAnimtionWithDurationTime:"
                                     isIn:NO
                          translateValues:@[YTXTranslateValue(0, 0, 0),
                                            YTXTranslateValue(0, -SELF_HEIGHT, 0)]
                             durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_slideAnimtionWithSelectName:(NSString *)selectName isIn:(BOOL)isIn translateValues:(NSArray *)translateValues durationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [opacity setValues:@[@1, isIn ? @1 : @0]];
    [opacity setKeyTimes:@[@0.99, @1]];
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [transform setValues:translateValues];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity, transform]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:selectName];
    return group;
}

#pragma mark - Rotating Entrances
- (nonnull CAAnimation *)ytx_rotateInAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
   return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateInAnimtionWithDurationTime:"
                                        isIn:YES
                                 rotateValue:YTX_RADIAN(200)
                                 anchorPoint:nil
                                 anchorOrign:nil
                                durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_rotateInDownLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
   return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateInDownLeftAnimtionWithDurationTime:"
                                        isIn:YES
                                 rotateValue:YTX_RADIAN(-45)
                                 anchorPoint:YTXPointValue(0, 1)
                                 anchorOrign:YTXPointValue(CGRectGetMinX(self.frame), CGRectGetMaxY(self.frame))
                                durationTime:durationTime];
    
}

- (nonnull CAAnimation *)ytx_rotateInDownRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
   return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateInDownRightAnimtionWithDurationTime:"
                                        isIn:YES
                                 rotateValue:YTX_RADIAN(45)
                                 anchorPoint:YTXPointValue(1, 1)
                                 anchorOrign:YTXPointValue(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))
                                durationTime:durationTime];
    
}

- (nonnull CAAnimation *)ytx_rotateInUpLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
   return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateInUpLeftAnimtionWithDurationTime:"
                                        isIn:YES
                                 rotateValue:YTX_RADIAN(45)
                                 anchorPoint:YTXPointValue(0, 0)
                                 anchorOrign:YTXPointValue(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame))
                                durationTime:durationTime];
    
}

- (nonnull CAAnimation *)ytx_rotateInUpRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
   return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateInUpRightAnimtionWithDurationTime:"
                                        isIn:YES
                                 rotateValue:YTX_RADIAN(-45)
                                 anchorPoint:YTXPointValue(1, 0)
                                 anchorOrign:YTXPointValue(CGRectGetMaxX(self.frame), CGRectGetMinY(self.frame))
                                durationTime:durationTime];
    
}

#pragma mark - Rotating Exits
- (nonnull CAAnimation *)ytx_rotateOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateOutAnimtionWithDurationTime:"
                                        isIn:NO
                                 rotateValue:YTX_RADIAN(200)
                                 anchorPoint:nil
                                 anchorOrign:nil
                                durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_rotateOutDownLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateOutDownLeftAnimtionWithDurationTime:"
                                        isIn:NO
                                 rotateValue:YTX_RADIAN(45)
                                 anchorPoint:YTXPointValue(0, 1)
                                 anchorOrign:YTXPointValue(CGRectGetMinX(self.frame), CGRectGetMaxY(self.frame))
                                durationTime:durationTime];
    
}

- (nonnull CAAnimation *)ytx_rotateOutDownRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateOutDownRightAnimtionWithDurationTime:"
                                        isIn:NO
                                 rotateValue:YTX_RADIAN(-45)
                                 anchorPoint:YTXPointValue(1, 1)
                                 anchorOrign:YTXPointValue(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))
                                durationTime:durationTime];
    
}

- (nonnull CAAnimation *)ytx_rotateOutUpLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
   return [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateOutUpLeftAnimtionWithDurationTime:"
                                        isIn:NO
                                 rotateValue:YTX_RADIAN(-90)
                                 anchorPoint:YTXPointValue(0, 1)
                                 anchorOrign:YTXPointValue(CGRectGetMinX(self.frame), CGRectGetMaxY(self.frame))
                                durationTime:durationTime];
    
}

- (nonnull CAAnimation *)ytx_rotateOutUpRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
   return  [self ytx_rotateAnimtionWithSelectName:@"ytx_rotateOutUpRightAnimtionWithDurationTime:"
                                        isIn:NO
                                 rotateValue:YTX_RADIAN(90)
                                 anchorPoint:YTXPointValue(1, 1)
                                 anchorOrign:YTXPointValue(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))
                                durationTime:durationTime];
    
}

- (nonnull CAAnimation *)ytx_rotateAnimtionWithSelectName:(NSString *)name isIn:(BOOL)isIn rotateValue:(float)rotate anchorPoint:(NSValue *)point anchorOrign:(NSValue *)orign durationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [opacity setValues:isIn ? @[@0, @1] : @[@1, @0]];
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [transform setValues:isIn ?
     @[YTXRotateValue(rotate, 0, 0, 1), YTXRotateValue(0, 0, 0, 0)] :
     @[YTXRotateValue(0, 0, 0, 0), YTXRotateValue(rotate, 0, 0, 1)] ];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    if (point) {
        CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:ANCHORPOINT];
        [anchor setValues:@[point,
                            point,
                            YTXPointValue(0.5, 0.5)]];
        [anchor setKeyTimes:@[@0, @0.99, @1]];
        
        
        CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:POSITION];
        [position setValues:@[orign,orign]];
        [anchor setKeyTimes:@[@0, @0.99]];
        
        [group setAnimations:@[opacity, transform,anchor,position]];
    }
    else
        [group setAnimations:@[opacity, transform]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:name];
    return group;
}


#pragma mark - Special

- (nonnull CAAnimation *)ytx_hingeAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate_1 = YTX_RADIAN(80);
    float rotate_2 = YTX_RADIAN(60);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:TRANSFORM];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [animation setValues:@[YTXRotateValue(0, 0, 0, 1),
                           YTXRotateValue(rotate_1, 0, 0, 1),
                           YTXRotateValue(rotate_2, 0, 0, 1),
                           YTXRotateValue(rotate_1, 0, 0, 1),
                           YTXRotateValue(rotate_2, 0, 0, 1),
                           ]];
    
    CAKeyframeAnimation *anchorAnimation = [CAKeyframeAnimation  animationWithKeyPath:ANCHORPOINT];
    [anchorAnimation setValues:@[YTXPointValue(0, 0),
                                 YTXPointValue(0, 0),
                                 YTXPointValue(0.5, 0.5)]];
    [anchorAnimation setKeyTimes:@[@(0),@(.99),@(1)]];
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [opacity setValues:@[@1,@0]];
    [opacity setKeyTimes:@[@(.8),@1]];
    
    CGFloat y = self.frame.origin.y;
    CGFloat x = self.frame.origin.x;
    CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [position setValues:@[
                          YTXPointValue(x, y),
                          YTXPointValue(x, y + 350),
                          YTXPointValue(x, y)]];
    [position setKeyTimes:@[@(.8),@.99,@1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[anchorAnimation,animation,opacity,position]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_hingeAnimtionWithDurationTime:"];
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
    
    float rotate_1 = YTX_RADIAN(120);
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = self.center.x;
    NSArray *animationValues = isIn? @[YTXRotateValue(-rotate_1, 0, 0, 1), YTXRotateValue(0, 0, 0, 1)] : @[YTXRotateValue(0, 0, 0, 1), YTXRotateValue(rotate_1, 0, 0, 1)];
    NSArray *positionValues = isIn ? @[@(-width + x),@(x)] : @[@(x),@(width+x)];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:TRANSFORM];
    [animation setValues:animationValues];
    
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation  animationWithKeyPath:POSITION_X];
    [position setValues:positionValues];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[position, animation]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:name];
    return group;
}


#pragma mark - delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if(!flag){
        return;
    }
    
    if ([anim valueForKey:@"ytx_flipAnimtionWithDurationTime:"]    ||
        [anim valueForKey:@"ytx_flipInXAnimtionWithDurationTime:"] ||
        [anim valueForKey:@"ytx_flipInYAnimtionWithDurationTime:"] ||
        [anim valueForKey:@"ytx_flipOutXAnimtionWithDurationTime:"]||
        [anim valueForKey:@"ytx_flipOutYAnimtionWithDurationTime:"] )
    {
        CATransform3D sublayerTransform = self.layer.sublayerTransform;
        sublayerTransform.m34 = 0;
        self.layer.sublayerTransform = sublayerTransform;
    }
    
}
 
@end
