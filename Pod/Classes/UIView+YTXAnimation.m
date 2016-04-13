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

#define YTX_RADIAN(x)             ((x) * M_PI / 180)
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

- (void)ytx_bounceAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
    
    
}

- (void)ytx_flashAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
 
    CAKeyframeAnimation *flashAnimation = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [flashAnimation setValues:@[@(0),@(1),@(0),@(1)]];
    [flashAnimation setKeyTimes:@[@(0.25),@(0.5),@(.75),@(1)]];
    flashAnimation.duration = durationTime;
    [self.layer addAnimation:flashAnimation forKey:@"ytx_flashAnimtionWithDurationTime:"];
    
}

- (void)ytx_pluseAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
    
    
}

- (void)ytx_rubberBandAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
    
}

- (void)ytx_shakeAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    
    CGPoint center = self.center;
    float moveXLeft = center.x - 5;
    float moveXRight = center.x + 5;
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    shackAnimation.duration = durationTime;
    
    [shackAnimation setValues:@[@(center.x),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(center.x)]];
    [self.layer addAnimation:shackAnimation forKey:@"ytx_shakeAnimtionWithDurationTime:"];
}

- (void)ytx_swingAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
}

- (void)ytx_tadaAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
    
}

- (void)ytx_wobbleAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
}

- (void)ytx_jelloAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate_1 = YTX_RADIAN(12.5);
    float rotate_2 = YTX_RADIAN(6.25);
    float rotate_3 = YTX_RADIAN(3.125);
    float rotate_4 = YTX_RADIAN(1.5625);
    float rotate_5 = YTX_RADIAN(0.78125);
    float rotate_6 = YTX_RADIAN(0.390625);
    float rotate_7 = YTX_RADIAN(0.1953125);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:TRANSFORM];
    animation.duration = durationTime;
    animation.calculationMode = kCAAnimationCubic;
    [animation setKeyTimes:@[@(.111), @(.222), @(.333), @(.444), @(.555), @(.666), @(.777), @(.888), @(1)]];
    [animation setValues:@[YTXRotateValue(0, 1,1 ,0.0),
                           YTXRotateValue(-rotate_1, 1,1 ,0.0),
                           YTXRotateValue(rotate_2, 1,1 ,0.0),
                           YTXRotateValue(-rotate_3, 1,1 ,0.0),
                           YTXRotateValue(rotate_4, 1,1 ,0.0),
                           YTXRotateValue(-rotate_5, 1,1 ,0.0),
                           YTXRotateValue(rotate_6, 1,1 ,0.0),
                           YTXRotateValue(-rotate_7, 1,1 ,0.0),
                           YTXRotateValue(0, 1,1 ,0.0)]];
    [self.layer addAnimation:animation forKey:@"ytx_jelloAnimtionWithDurationTime:"];
}


#pragma mark - Bouncing Entrances

- (void)ytx_bounceInAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
}

- (void)ytx_bounceInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *bouncelnDown = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    
    CGFloat y = self.center.y;
    NSNumber *value_0 = @(-1500 + y);
    NSNumber *value_1 = @(13 + y);
    NSNumber *value_2 = @(-5 + y);
    NSNumber *value_3 = @(3 + y);
    [bouncelnDown setValues:@[value_0, value_1, value_2, value_3, @(y)]];
    
    CAMediaTimingFunction *time = YTXCAMediaTimingFunction (0.215, 0.610, 0.355, 1.000);
    [bouncelnDown setKeyTimes:@[@0, @(0.6),@(0.75),@(.9), @1]];
    [bouncelnDown setTimingFunction:time];
    
    bouncelnDown.duration = durationTime;
    [self.layer addAnimation:bouncelnDown forKey:@"ytx_bounceInDownAnimtionWithDurationTime:"];
}

- (void)ytx_bounceInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *bouncelnLeft = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    
    CGFloat x = self.center.x;
    NSNumber *value_0 = @(-1500 + x);
    NSNumber *value_1 = @(13 + x);
    NSNumber *value_2 = @(-5 + x);
    NSNumber *value_3 = @(3 + x);
    [bouncelnLeft setValues:@[value_0, value_1, value_2, value_3,@(x)]];
    
    CAMediaTimingFunction *time = YTXCAMediaTimingFunction (0.215, 0.610, 0.355, 1.000);
    [bouncelnLeft setKeyTimes:@[@0, @(0.6),@(0.75),@(.9), @1]];
    [bouncelnLeft setTimingFunction:time];
    
    bouncelnLeft.duration = durationTime;
    [self.layer addAnimation:bouncelnLeft forKey:@"ytx_bounceInLeftAnimtionWithDurationTime:"];
}

- (void)ytx_bounceInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *bouncelnRight = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    
    CGFloat x = self.center.x;
    NSNumber *value_0 = @(1500 + x);
    NSNumber *value_1 = @(-13 + x);
    NSNumber *value_2 = @(5 + x);
    NSNumber *value_3 = @(-3 + x);
    [bouncelnRight setValues:@[value_0, value_1, value_2, value_3, @(x)]];
    
    CAMediaTimingFunction *time = YTXCAMediaTimingFunction (0.215, 0.610, 0.355, 1.000);
    [bouncelnRight setKeyTimes:@[@0, @(0.6),@(0.75),@(.9), @1]];
    [bouncelnRight setTimingFunction:time];
    
    bouncelnRight.duration = durationTime;
    [self.layer addAnimation:bouncelnRight forKey:@"ytx_bounceInRightAnimtionWithDurationTime:"];
}

- (void)ytx_bounceInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *bouncelnUp = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    
    CGFloat y = self.center.y;
    NSNumber *value_0 = @(1500 + y);
    NSNumber *value_1 = @(-10 + y);
    NSNumber *value_2 = @(5 + y);
    NSNumber *value_3 = @(-3 + y);
    [bouncelnUp setValues:@[value_0,value_1,value_2,value_3, @(y)]];
    
    CAMediaTimingFunction *time = YTXCAMediaTimingFunction (0.215, 0.610, 0.355, 1.000);
    [bouncelnUp setKeyTimes:@[@0, @(0.6),@(0.75),@(.9), @1]];
    [bouncelnUp setTimingFunction:time];
    
    bouncelnUp.duration = durationTime;
    [self.layer addAnimation:bouncelnUp forKey:@"ytx_bounceInUpAnimtionWithDurationTime:"];
    
}

#pragma mark - Fading Entrances

- (void)ytx_fadeInAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    
    [fadeInOpacity setValues:@[@0, @1]];
    
    fadeInOpacity.duration = durationTime;
    [self.layer addAnimation:fadeInOpacity forKey:@"ytx_fadeInAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInDownOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeInDownOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInDownPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [fadeInDownPosition setValues:@[@(-SELF_HEIGHT + self.center.y), @(self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInDownOpacity, fadeInDownPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInDownAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInDownBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInDownBigOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeInDownBigOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInDownBigPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [fadeInDownBigPosition setValues:@[@(-BIG_DISTANCE_VALUE + self.center.y), @(self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInDownBigOpacity, fadeInDownBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInDownBigAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInLeftOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeInLeftOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInLeftPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [fadeInLeftPosition setValues:@[@(-SELF_WIDTH + self.center.x), @(self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInLeftOpacity, fadeInLeftPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInLeftAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInLeftBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInLeftBigOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeInLeftBigOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInLeftBigPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [fadeInLeftBigPosition setValues:@[@(-BIG_DISTANCE_VALUE + self.center.x), @(self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInLeftBigOpacity, fadeInLeftBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInLeftBigAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInRightOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeInRightOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInRightPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [fadeInRightPosition setValues:@[@(SELF_WIDTH + self.center.x), @(self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInRightOpacity, fadeInRightPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInRightAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInRightBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInRightBigOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeInRightBigOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInRightBigPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [fadeInRightBigPosition setValues:@[@(BIG_DISTANCE_VALUE + self.center.x), @(self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInRightBigOpacity, fadeInRightBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInRightBigAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInUpOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeInUpOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInUpPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [fadeInUpPosition setValues:@[@(SELF_WIDTH + self.center.y), @(self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInUpOpacity, fadeInUpPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInUpAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInUpBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInUpBigOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeInUpBigOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInUpBigPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [fadeInUpBigPosition setValues:@[@(BIG_DISTANCE_VALUE + self.center.y), @(self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInUpBigOpacity, fadeInUpBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInUpBigAnimtionWithDurationTime:"];
}

#pragma mark - Fading Exits
- (void)ytx_fadeOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeOut = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeOut setValues:@[@1, @0]];
    fadeOut.duration = durationTime;
    [self.layer addAnimation:fadeOut forKey:@"ytx_fadeOutAnimtionWithDurationTime:"];
}

- (void)ytx_fadeOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeOutDownOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeOutDownOpacity setValues:@[@1, @0]];
    
    CAKeyframeAnimation *fadeOutDownPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [fadeOutDownPosition setValues:@[@(self.center.y), @(SELF_HEIGHT + self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeOutDownOpacity, fadeOutDownPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeOutDownAnimtionWithDurationTime:"];
}

- (void)ytx_fadeOutDownBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeOutDownBigOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeOutDownBigOpacity setValues:@[@1, @0]];
    
    CAKeyframeAnimation *fadeOutDownBigPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [fadeOutDownBigPosition setValues:@[@(self.center.y), @(BIG_DISTANCE_VALUE + self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeOutDownBigOpacity, fadeOutDownBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeOutDownBigAnimtionWithDurationTime:"];
}

- (void)ytx_fadeOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeOutLeftOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeOutLeftOpacity setValues:@[@1, @0]];
    
    CAKeyframeAnimation *fadeOutLeftPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [fadeOutLeftPosition setValues:@[@(self.center.x), @(-SELF_WIDTH + self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeOutLeftOpacity, fadeOutLeftPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeOutLeftAnimtionWithDurationTime:"];
}

- (void)ytx_fadeOutLeftBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeOutLeftBigOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeOutLeftBigOpacity setValues:@[@1, @0]];
    
    CAKeyframeAnimation *fadeOutLeftBigPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [fadeOutLeftBigPosition setValues:@[@(self.center.x), @(-BIG_DISTANCE_VALUE + self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeOutLeftBigOpacity, fadeOutLeftBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeOutLeftBigAnimtionWithDurationTime:"];
}

- (void)ytx_fadeOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeOutRightOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeOutRightOpacity setValues:@[@1, @0]];
    
    CAKeyframeAnimation *fadeOutRightPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [fadeOutRightPosition setValues:@[@(self.center.x), @(SELF_WIDTH + self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeOutRightOpacity, fadeOutRightPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeOutRightAnimtionWithDurationTime:"];
}

- (void)ytx_fadeOutRightBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeOutRightBigOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeOutRightBigOpacity setValues:@[@1, @0]];
    
    CAKeyframeAnimation *fadeOutRightBigPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [fadeOutRightBigPosition setValues:@[@(self.center.x), @(BIG_DISTANCE_VALUE + self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeOutRightBigOpacity, fadeOutRightBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeOutRightBigAnimtionWithDurationTime:"];
}

- (void)ytx_fadeOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeOutUpOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeOutUpOpacity setValues:@[@1, @0]];
    
    CAKeyframeAnimation *fadeOutUpPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [fadeOutUpPosition setValues:@[@(self.center.y), @(-SELF_HEIGHT + self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeOutUpOpacity, fadeOutUpPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeOutUpAnimtionWithDurationTime:"];
}

- (void)ytx_fadeOutUpBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeOutUpBigOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [fadeOutUpBigOpacity setValues:@[@1, @0]];
    
    CAKeyframeAnimation *fadeOutUpBigPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [fadeOutUpBigPosition setValues:@[@(self.center.y), @(-BIG_DISTANCE_VALUE + self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeOutUpBigOpacity, fadeOutUpBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeOutUpBigAnimtionWithDurationTime:"];
}


#pragma mark - Special

- (void)ytx_hingeAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
}

- (void)ytx_rollInAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate_1 = YTX_RADIAN(120);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:TRANSFORM];
    [animation setValues:@[
                           YTXRotateValue(-rotate_1, 0, 0, 1),
                           YTXRotateValue(0, 0, 0, 1)]];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = self.center.x;
    CAKeyframeAnimation *position = [CAKeyframeAnimation  animationWithKeyPath:POSITION_X];
    [position setValues:@[@(-width + x),@(x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[position,animation]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_rollInAnimationWithDurationTime:"];
}

- (void)ytx_rollOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate_1 = YTX_RADIAN(120);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:TRANSFORM];
    [animation setValues:@[
                           YTXRotateValue(0, 0, 0, 1),
                           YTXRotateValue(rotate_1, 0, 0, 1)]];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = self.center.x;
    CAKeyframeAnimation *position = [CAKeyframeAnimation  animationWithKeyPath:POSITION_X];
    [position setValues:@[@(x),@(width+x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[position,animation]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_rollInAnimationWithDurationTime:"];
}


#pragma mark - Zoom Exits

- (void)ytx_zoomOutAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    CAKeyframeAnimation *zoomOutOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomOutOpacity setValues:@[@1, @0]];
    
    CAKeyframeAnimation *zoomOutTransform = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomOutTransform setValues:@[YTXScaleValue(1, 1, 1),
                                  YTXScaleValue(.3, .3, .3)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomOutOpacity,zoomOutTransform]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomOutAnimtionWithDurationTime:"];
}

- (void)ytx_zoomOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    
    CAMediaTimingFunction *function = YTXCAMediaTimingFunction(.550, .055, .675, .19);
    CAMediaTimingFunction *function_2 = YTXCAMediaTimingFunction(.175, .885, .320, 1);
    CAMediaTimingFunction *liner = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CAKeyframeAnimation *zoomOutDownOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomOutDownOpacity setValues:@[@1, @0]];
    [zoomOutDownOpacity setKeyTimes:@[@.4, @1]];
    
    CAKeyframeAnimation *zoomOutDownScale = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomOutDownScale setValues:@[YTXScaleValue(1, 1, 1),
                                  YTXScaleValue(.475, .475, .475),
                                  YTXScaleValue(.1, .1, .1)]];
    [zoomOutDownScale setKeyTimes:@[@0, @.4, @1]];
    [zoomOutDownScale setTimingFunctions:@[liner, function, function_2]];
    
    CAKeyframeAnimation *zoomOutDownAnchorPoint = [CAKeyframeAnimation animationWithKeyPath:ANCHORPOINT];
    [zoomOutDownAnchorPoint setValues:@[YTXPointValue(0.5, 0.5),
                                        YTXPointValue(0.5, 1),
                                        YTXPointValue(0.5, 0.5)]];
    [zoomOutDownAnchorPoint setKeyTimes:@[@.4, @0.99, @1]];
    
    CGFloat y = self.center.y;
    CAKeyframeAnimation *zoomOutDownPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [zoomOutDownPosition setValues:@[@(y), @(y - 30), @(y + BIG_DISTANCE_VALUE)]];
    [zoomOutDownPosition setKeyTimes:@[@0, @.4, @1]];
    [zoomOutDownPosition setTimingFunctions:@[liner, function, function_2]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomOutDownOpacity, zoomOutDownScale, zoomOutDownPosition, zoomOutDownAnchorPoint]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomOutDownAnimtionWithDurationTime:"];
}

- (void)ytx_zoomOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    CAKeyframeAnimation *zoomOutLeftOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomOutLeftOpacity setValues:@[@1, @0]];
    [zoomOutLeftOpacity setKeyTimes:@[@.4, @1]];
    
    CAKeyframeAnimation *zoomOutLeftScale = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomOutLeftScale setValues:@[YTXScaleValue(1, 1, 1),
                                  YTXScaleValue(.475, .475, .475),
                                  YTXScaleValue(.1, .1, .1)]];
    [zoomOutLeftScale setKeyTimes:@[@0, @.4, @1]];
    
    CAKeyframeAnimation *zoomOutLeftAnchorPoint = [CAKeyframeAnimation animationWithKeyPath:ANCHORPOINT];
    [zoomOutLeftAnchorPoint setValues:@[YTXPointValue(0.5, 0.5),
                                        YTXPointValue(0, .5),
                                        YTXPointValue(0.5, 0.5)]];
    [zoomOutLeftAnchorPoint setKeyTimes:@[@.4, @0.99, @1]];
    
    CGFloat x = self.center.x;
    CAKeyframeAnimation *zoomOutLeftPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [zoomOutLeftPosition setValues:@[@(x), @(x + 21),@(x - BIG_DISTANCE_VALUE)]];
    [zoomOutLeftPosition setKeyTimes:@[@0, @.4, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomOutLeftOpacity, zoomOutLeftScale, zoomOutLeftPosition, zoomOutLeftAnchorPoint]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomOutLeftAnimtionWithDurationTime:"];
}

- (void)ytx_zoomOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    CAKeyframeAnimation *zoomOutRightOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomOutRightOpacity setValues:@[@1, @0]];
    [zoomOutRightOpacity setKeyTimes:@[@.4, @1]];
    
    CAKeyframeAnimation *zoomOutRightScale = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomOutRightScale setValues:@[YTXScaleValue(1, 1, 1),
                                  YTXScaleValue(.475, .475, .475),
                                  YTXScaleValue(.1, .1, .1)]];
    [zoomOutRightScale setKeyTimes:@[@0, @.4, @1]];
    
    CAKeyframeAnimation *zoomOutRightAnchorPoint = [CAKeyframeAnimation animationWithKeyPath:ANCHORPOINT];
    [zoomOutRightAnchorPoint setValues:@[YTXPointValue(0.5, 0.5),
                                        YTXPointValue(0, .5),
                                        YTXPointValue(0.5, 0.5)]];
    [zoomOutRightAnchorPoint setKeyTimes:@[@.4, @0.99, @1]];
    
    CGFloat x = self.center.x;
    CAKeyframeAnimation *zoomOutRightPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [zoomOutRightPosition setValues:@[@(x), @(x - 21),@(x + BIG_DISTANCE_VALUE)]];
    [zoomOutRightPosition setKeyTimes:@[@0, @.4, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomOutRightOpacity, zoomOutRightScale, zoomOutRightPosition, zoomOutRightAnchorPoint]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomOutRightAnimtionWithDurationTime:"];
}

- (void)ytx_zoomOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    
    CAMediaTimingFunction *function = YTXCAMediaTimingFunction(.550, .055, .675, .19);
    CAMediaTimingFunction *function_2 = YTXCAMediaTimingFunction(.175, .885, .320, 1);
    CAMediaTimingFunction *liner = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CAKeyframeAnimation *zoomOutUpOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomOutUpOpacity setValues:@[@1, @0]];
    [zoomOutUpOpacity setKeyTimes:@[@.4, @1]];
    
    CAKeyframeAnimation *zoomOutUpScale = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomOutUpScale setValues:@[YTXScaleValue(1, 1, 1),
                                  YTXScaleValue(.475, .475, .475),
                                  YTXScaleValue(.1, .1, .1)]];
    [zoomOutUpScale setKeyTimes:@[@0, @.4, @1]];
    [zoomOutUpScale setTimingFunctions:@[liner, function, function_2]];
    
    CAKeyframeAnimation *zoomOutUpAnchorPoint = [CAKeyframeAnimation animationWithKeyPath:ANCHORPOINT];
    [zoomOutUpAnchorPoint setValues:@[YTXPointValue(0.5, 0.5),
                                        YTXPointValue(0.5, 1),
                                        YTXPointValue(0.5, 0.5)]];
    [zoomOutUpAnchorPoint setKeyTimes:@[@.4, @0.99, @1]];
    
    CGFloat y = self.center.y;
    CAKeyframeAnimation *zoomOutUpPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [zoomOutUpPosition setValues:@[@(y), @(y + 30), @(y - BIG_DISTANCE_VALUE)]];
    [zoomOutUpPosition setKeyTimes:@[@0, @.4, @1]];
    [zoomOutUpPosition setTimingFunctions:@[liner, function, function_2]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomOutUpOpacity, zoomOutUpScale, zoomOutUpPosition, zoomOutUpAnchorPoint]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomOutUpAnimtionWithDurationTime:"];
}

#pragma mark - Zoom Entrances

- (void)ytx_zoomInAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    CAKeyframeAnimation *zoomInOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomInOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *zoomInTransform = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomInTransform setValues:@[YTXScaleValue(.3, .3, .3),
                           YTXScaleValue(1, 1, 1),]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomInOpacity,zoomInTransform]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomInAnimtionWithDurationTime:"];
}

- (void)ytx_zoomInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    
    CAMediaTimingFunction *function = YTXCAMediaTimingFunction(.550, .055, .675, .19);
    CAMediaTimingFunction *function_2 = YTXCAMediaTimingFunction(.175, .885, .320, 1);
    CAMediaTimingFunction *liner = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CAKeyframeAnimation *zoomInDownOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomInDownOpacity setValues:@[@0, @1]];
    [zoomInDownOpacity setKeyTimes:@[@0, @.6]];
    
    CAKeyframeAnimation *zoomInDownScale = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomInDownScale setValues:@[YTXScaleValue(.1, .1, .1),
                                  YTXScaleValue(.475, .475, .475),
                                  YTXScaleValue(1, 1, 1)]];
    [zoomInDownScale setKeyTimes:@[@0, @.6, @1]];
    [zoomInDownScale setTimingFunctions:@[liner, function, function_2]];
    
    CGFloat y = self.center.y;
    CAKeyframeAnimation *zoomInDownPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [zoomInDownPosition setValues:@[@(y - 500), @(y + 5), @(y)]];
    [zoomInDownPosition setKeyTimes:@[@0, @.6, @1]];
    [zoomInDownPosition setTimingFunctions:@[liner, function, function_2]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomInDownOpacity, zoomInDownScale, zoomInDownPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomInDownAnimtionWithDurationTime:"];
}

- (void)ytx_zoomInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    CAMediaTimingFunction *function = YTXCAMediaTimingFunction(.550, .055, .675, .19);
    CAMediaTimingFunction *function_2 = YTXCAMediaTimingFunction(.175, .885, .320, 1);
    CAMediaTimingFunction *liner = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CAKeyframeAnimation *zoomInLeftOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomInLeftOpacity setValues:@[@0, @1]];
    [zoomInLeftOpacity setKeyTimes:@[@0, @.6]];
    
    CAKeyframeAnimation *zoomInLeftScale = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomInLeftScale setValues:@[YTXScaleValue(.1, .1, .1),
                                  YTXScaleValue(.475, .475, .475),
                                  YTXScaleValue(1, 1, 1)]];
    [zoomInLeftScale setKeyTimes:@[@0, @.6, @1]];
    [zoomInLeftScale setTimingFunctions:@[liner, function, function_2]];
    
    CGFloat x = self.center.x;
    CAKeyframeAnimation *zoomInLeftPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [zoomInLeftPosition setValues:@[@(x - 500), @(x + 5),@(x)]];
    [zoomInLeftPosition setKeyTimes:@[@0, @.6, @1]];
    [zoomInLeftPosition setTimingFunctions:@[liner, function, function_2]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomInLeftOpacity, zoomInLeftScale, zoomInLeftPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomInLeftAnimtionWithDurationTime:"];
}

- (void)ytx_zoomInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    CAMediaTimingFunction *function = YTXCAMediaTimingFunction(.550, .055, .675, .19);
    CAMediaTimingFunction *function_2 = YTXCAMediaTimingFunction(.175, .885, .320, 1);
    CAMediaTimingFunction *liner = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CAKeyframeAnimation *zoomInRightOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomInRightOpacity setValues:@[@0, @1]];
    [zoomInRightOpacity setKeyTimes:@[@0, @.6]];
    
    CAKeyframeAnimation *zoomInRightScale = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomInRightScale setValues:@[YTXScaleValue(.1, .1, .1),
                                   YTXScaleValue(.475, .475, .475),
                                   YTXScaleValue(1, 1, 1)]];
    [zoomInRightScale setKeyTimes:@[@0, @.6, @1]];
    [zoomInRightScale setTimingFunctions:@[liner, function, function_2]];
    
    CGFloat x = self.center.x;
    CAKeyframeAnimation *zoomInRightPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [zoomInRightPosition setValues:@[@(x + 500), @(x - 5),@(x)]];
    [zoomInRightPosition setKeyTimes:@[@0, @.6, @1]];
    [zoomInRightPosition setTimingFunctions:@[liner, function, function_2]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomInRightOpacity, zoomInRightScale, zoomInRightPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomInRightAnimtionWithDurationTime:"];
}

- (void)ytx_zoomInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    
    CAMediaTimingFunction *function = YTXCAMediaTimingFunction(.550, .055, .675, .19);
    CAMediaTimingFunction *function_2 = YTXCAMediaTimingFunction(.175, .885, .320, 1);
    CAMediaTimingFunction *liner = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CAKeyframeAnimation *zoomInUpOpacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [zoomInUpOpacity setValues:@[@0, @1]];
    [zoomInUpOpacity setKeyTimes:@[@0, @.6]];
    
    CAKeyframeAnimation *zoomInUpScale = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [zoomInUpScale setValues:@[YTXScaleValue(.1, .1, .1),
                                YTXScaleValue(.475, .475, .475),
                                YTXScaleValue(1, 1, 1)]];
    [zoomInUpScale setKeyTimes:@[@0, @.6, @1]];
    [zoomInUpScale setTimingFunctions:@[liner, function, function_2]];
    
    CGFloat y = self.center.y;
    CAKeyframeAnimation *zoomInUpPosition = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [zoomInUpPosition setValues:@[@(y + 500), @(y - 30), @(y)]];
    [zoomInUpPosition setKeyTimes:@[@0, @.6, @1]];
    [zoomInUpPosition setTimingFunctions:@[liner, function, function_2]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[zoomInUpOpacity, zoomInUpScale, zoomInUpPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_zoomInUpAnimtionWithDurationTime:"];
}

#pragma mark - Slide Entrances
- (void)ytx_slideInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    [self ytx_slideAnimtionWithSelectName:@"ytx_slideInDownAnimtionWithDurationTime:"
                                     isIn:YES
                          translateValues:@[YTXTranslateValue(0, SELF_HEIGHT, 0),
                                            YTXTranslateValue(0, 0, 0)]
                             DurationTime:durationTime];
}

- (void)ytx_slideInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    [self ytx_slideAnimtionWithSelectName:@"ytx_slideInLeftAnimtionWithDurationTime:"
                                     isIn:YES
                          translateValues:@[YTXTranslateValue(-SELF_WIDTH, 0, 0),
                                            YTXTranslateValue(0, 0, 0)]
                             DurationTime:durationTime];
}

- (void)ytx_slideInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    [self ytx_slideAnimtionWithSelectName:@"ytx_slideInRightAnimtionWithDurationTime:"
                                     isIn:YES
                          translateValues:@[YTXTranslateValue(SELF_WIDTH, 0, 0),
                                            YTXTranslateValue(0, 0, 0)]
                             DurationTime:durationTime];
}

- (void)ytx_slideInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    [self ytx_slideAnimtionWithSelectName:@"ytx_slideInUpAnimtionWithDurationTime:"
                                     isIn:YES
                          translateValues:@[YTXTranslateValue(0, -SELF_HEIGHT, 0),
                                            YTXTranslateValue(0, 0, 0)]
                             DurationTime:durationTime];
}

#pragma mark - Slide Exits
- (void)ytx_slideOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutDownAnimtionWithDurationTime:"
                                     isIn:NO
                          translateValues:@[YTXTranslateValue(0, 0, 0),
                                            YTXTranslateValue(0, SELF_HEIGHT, 0)]
                             DurationTime:durationTime];
 }

- (void)ytx_slideOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutLeftAnimtionWithDurationTime:"
                                     isIn:NO
                          translateValues:@[YTXTranslateValue(0, 0, 0),
                                            YTXTranslateValue(-SELF_WIDTH, 0, 0)]
                             DurationTime:durationTime];
}

- (void)ytx_slideOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutRightAnimtionWithDurationTime:"
                                     isIn:NO
                          translateValues:@[YTXTranslateValue(0, 0, 0),
                                            YTXTranslateValue(SELF_WIDTH, 0, 0)]
                             DurationTime:durationTime];
}

- (void)ytx_slideOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    [self ytx_slideAnimtionWithSelectName:@"ytx_slideOutUpAnimtionWithDurationTime:"
                                     isIn:NO
                          translateValues:@[YTXTranslateValue(0, 0, 0),
                                            YTXTranslateValue(0, -SELF_HEIGHT, 0)]
                             DurationTime:durationTime];
}

- (void)ytx_slideAnimtionWithSelectName:(NSString *)selectName isIn:(BOOL)isIn translateValues:(NSArray *)translateValues DurationTime:(NSTimeInterval)durationTime{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [opacity setValues:@[@1, isIn ? @1 : @0]];
    [opacity setKeyTimes:@[@0.99, @1]];
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [transform setValues:translateValues];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity, transform]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:selectName];
}

@end
