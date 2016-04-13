//
//  UIView+YTXAnimation.m
//  p4
//
//  Created by 李龙龙 on 12 * rotate/4/7.
//  Copyright © 2012 * rotate年 com.baidao. All rights reserved.
//

#import "UIView+YTXAnimation.h"

// 转化为NSValue
#define YTXScaleValue(x,y,z)     [NSValue valueWithCATransform3D:CATransform3DScale(self.layer.transform, x ,y ,z)]

#define YTXRotateValue(d,x,y,z)  [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, d, x ,y ,z)]

#define YTXTranslateValue(x,y,z) [NSValue valueWithCATransform3D:CATransform3DTranslate(self.layer.transform, x ,y ,z)]

#define YTXPointValue(x,y)       [NSValue valueWithCGPoint:CGPointMake(x, y)]

//屏幕宽度
#define SELF_WIDTH             (self.frame.size.width)
#define SELF_HEIGHT            (self.frame.size.height)

#define YTX_M_1_PI              (M_1_PI * .1)
//获取YTXCAMediaTimingFunction
#define YTXCAMediaTimingFunction(x1,y1,x2,y2) [CAMediaTimingFunction functionWithControlPoints:x1 :y1 :x2 :y2]

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
    
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    [bounce setValues:@[value_0,value_1,value_1,value_0,value_2,value_0,value_3]];
    [bounce setKeyTimes:@[@(0.2),@(0.4),@(0.43),@(.53),@(.7),@(.8),@(.9)]];
    [bounce setTimingFunctions:@[time_1,time_2,time_2,time_1,time_2,time_1,time_1,time_2]];
    bounce.duration = durationTime;
    [self.layer addAnimation:bounce forKey:@"ytx_bounceAnimtionWithDurationTime:"];
    
    
}

- (void)ytx_flashAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
 
    CAKeyframeAnimation *flashAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
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
    
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
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
    
    CAKeyframeAnimation *rubberBand = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
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
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    shackAnimation.duration = durationTime;
    
    [shackAnimation setValues:@[@(center.x),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(moveXLeft), @(moveXRight),@(center.x)]];
    [self.layer addAnimation:shackAnimation forKey:@"ytx_shakeAnimtionWithDurationTime:"];
}

- (void)ytx_swingAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotateF = 15 * YTX_M_1_PI;
    float rotateS = 10 * YTX_M_1_PI;
    float rotateT = 5 * YTX_M_1_PI;
    
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
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
    float rotate = YTX_M_1_PI * 3;
    float smallScaleValue = 0.9;
    float lagerScaleValue = 1.1;
    
    NSValue *defultScale = YTXScaleValue(1, 1, 1);
    NSValue *smallScale = YTXScaleValue(smallScaleValue, smallScaleValue, smallScaleValue);
    NSValue *lagerScale = YTXScaleValue(lagerScaleValue, lagerScaleValue, lagerScaleValue);
    NSValue *leftValue = YTXRotateValue(-rotate, 0.0 ,0.0 ,1.0);
    NSValue *rightValue = YTXRotateValue(rotate, 0.0 ,0.0 ,1.0);
    
    CAKeyframeAnimation *tadaAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    tadaAnimation.duration = durationTime;
    
    [tadaAnimation setValues:@[defultScale,smallScale,lagerScale,leftValue,rightValue,leftValue,rightValue,leftValue,rightValue,leftValue,rightValue,]];
    
    [self.layer addAnimation:tadaAnimation forKey:@"ytx_tadaAnimtionWithDurationTime:"];
    
}

- (void)ytx_wobbleAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate_1 = 5 * YTX_M_1_PI;
    float rotate_2 = 3 * YTX_M_1_PI;
    float rotate_3 = 2 * YTX_M_1_PI;
    float rotate_4 = 1 * YTX_M_1_PI;
    
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
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
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation  animationWithKeyPath:@"position.x"];
    [shakeAnimation setKeyTimes:@[@(0), @(.15), @(.3), @(.45), @(.6), @(.75), @(1)]];
    [shakeAnimation setValues:@[ @(x), @((-.25  * width) + x) ,@( (.2 * width) + x),@((-.15 * width) + x),@((.1 * width) + x),@( (-.05 * width) + x),@(x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[rotateAnimation,shakeAnimation]];
    [group setDuration:durationTime*.5];
    [self.layer addAnimation:group forKey:@"ytx_wobbleAnimtionWithDurationTime:"];
}

- (void)ytx_jelloAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    float rotate_1 = 12.5 * YTX_M_1_PI;
    float rotate_2 = 6.25 * YTX_M_1_PI;
    float rotate_3 = 3.125 * YTX_M_1_PI;
    float rotate_4 = 1.5625 * YTX_M_1_PI;
    float rotate_5 = 0.78125 * YTX_M_1_PI;
    float rotate_6 = 0.390625 * YTX_M_1_PI;
    float rotate_7 = 0.1953125 * YTX_M_1_PI;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
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
    CAKeyframeAnimation *bounceln = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
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
    CAKeyframeAnimation *bouncelnDown = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    
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
    CAKeyframeAnimation *bouncelnLeft = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    
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
    CAKeyframeAnimation *bouncelnRight = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    
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
    CAKeyframeAnimation *bouncelnUp = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    
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
    CAKeyframeAnimation *fadeInOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    
    [fadeInOpacity setValues:@[@0, @1]];
    
    fadeInOpacity.duration = durationTime;
    [self.layer addAnimation:fadeInOpacity forKey:@"ytx_fadeInAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInDownOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [fadeInDownOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInDownPosition = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    [fadeInDownPosition setValues:@[@(-SELF_WIDTH + self.center.y), @(self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInDownOpacity, fadeInDownPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInDownAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInDownBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInDownBigOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [fadeInDownBigOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInDownBigPosition = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    [fadeInDownBigPosition setValues:@[@(-1000 + self.center.y), @(self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInDownBigOpacity, fadeInDownBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInDownBigAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInLeftOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [fadeInLeftOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInLeftPosition = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    [fadeInLeftPosition setValues:@[@(-SELF_WIDTH + self.center.x), @(self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInLeftOpacity, fadeInLeftPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInLeftAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInLeftBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInLeftBigOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [fadeInLeftBigOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInLeftBigPosition = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    [fadeInLeftBigPosition setValues:@[@(-1000 + self.center.x), @(self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInLeftBigOpacity, fadeInLeftBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInLeftBigAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInRightOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [fadeInRightOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInRightPosition = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    [fadeInRightPosition setValues:@[@(SELF_WIDTH + self.center.x), @(self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInRightOpacity, fadeInRightPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInRightAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInRightBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInRightBigOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [fadeInRightBigOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInRightBigPosition = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    [fadeInRightBigPosition setValues:@[@(1000 + self.center.x), @(self.center.x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInRightBigOpacity, fadeInRightBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInRightBigAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInUpOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [fadeInUpOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInUpPosition = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    [fadeInUpPosition setValues:@[@(SELF_WIDTH + self.center.y), @(self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInUpOpacity, fadeInUpPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInUpAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInUpBigAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *fadeInUpBigOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [fadeInUpBigOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInUpBigPosition = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    [fadeInUpBigPosition setValues:@[@(1000 + self.center.y), @(self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInUpBigOpacity, fadeInUpBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInUpBigAnimtionWithDurationTime:"];
}




#pragma mark - Special
- (void)ytx_hingeAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    
    float base = M_1_PI * -1;
    float rotate_1 = 80 * base + M_PI_2;
    float rotate_2 = 60 * base + M_PI_2;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [animation setValues:@[YTXRotateValue(0, 0, 0, 1),
                           YTXRotateValue(rotate_1, 0, 0, 1),
                           YTXRotateValue(rotate_2, 0, 0, 1),
                           YTXRotateValue(rotate_1, 0, 0, 1),
                           YTXRotateValue(rotate_2, 0, 0, 1), 
                           ]];
    
    CAKeyframeAnimation *anchorAnimation = [CAKeyframeAnimation  animationWithKeyPath:@"anchorPoint"];
    [anchorAnimation setValues:@[YTXPointValue(0, 0),
                                 YTXPointValue(0, 0),
                                 YTXPointValue(0.5, 0.5)]];
    [anchorAnimation setKeyTimes:@[@(0),@(.99),@(1)]];
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [opacity setValues:@[@1,@0]];
    [opacity setKeyTimes:@[@(.8),@1]];
    
    CGFloat y = self.frame.origin.y;
    CGFloat x = self.frame.origin.x;
    CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [position setValues:@[YTXPointValue(x, y),
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
    float base = M_1_PI * .1;
    float rotate_1 = 120 * base;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    [animation setValues:@[
                           YTXRotateValue(rotate_1, 0, 0, 1),
                           YTXRotateValue(0, 0, 0, 1)]];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = self.center.x;
    CAKeyframeAnimation *position = [CAKeyframeAnimation  animationWithKeyPath:@"position.x"];
    [position setValues:@[@(-width + x),@(x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[position,animation]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_rollInAnimationWithDurationTime:"];
}

- (void)ytx_rollOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    float base = M_1_PI ;
    float rotate_1 = 120 * base  + M_PI;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    [animation setValues:@[
                           YTXRotateValue(0, 0, 0, 1),
                           YTXRotateValue(-rotate_1, 0, 0, 1)]];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = self.center.x;
    CAKeyframeAnimation *position = [CAKeyframeAnimation  animationWithKeyPath:@"position.x"];
    [position setValues:@[@(x),@(width+x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[position,animation]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_rollInAnimationWithDurationTime:"];
}
@end



