//
//  UIView+YTXAnimation.m
//  p4
//
//  Created by 李龙龙 on 12 * rotate/4/7.
//  Copyright © 2012 * rotate年 com.baidao. All rights reserved.
//

#import "UIView+YTXAnimation.h"

// 转化为NSValue
#define NSScaleValue(x,y,z)     [NSValue valueWithCATransform3D:CATransform3DScale(self.layer.transform, x ,y ,z)]

#define NSRotateValue(d,x,y,z)  [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, d, x ,y ,z)]

#define NSTranslateValue(x,y,z) [NSValue valueWithCATransform3D:CATransform3DTranslate(self.layer.transform, x ,y ,z)]

#define CGPointValue(x,y)       [NSValue valueWithCGPoint:CGPointMake(x, y)]

//获取CAMediaTimingFunction
#define CAMediaTimingFunction(x1,y1,x2,y2) [CAMediaTimingFunction functionWithControlPoints:x1 :y1 :x2 :y2]

@implementation UIView (YTXAnimation)

#pragma mark - Attention Seekers

- (void)ytx_bounceAnimtionWithDurationTime:(NSTimeInterval)durationTime {

    CAMediaTimingFunction *time_1 = CAMediaTimingFunction (0.215, 0.610, 0.355, 1);
    CAMediaTimingFunction *time_2 = CAMediaTimingFunction (0.755, 0.050, 0.855, 0.060);

    CGFloat y = self.center.y;
    NSNumber *value_0 = @(0 + y);
    NSNumber *value_1 = @(-30 + y);
    NSNumber *value_2 = @(-15 + y);
    NSNumber *value_3 = @(-4 + y);
    
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    [bounce setValues:@[value_0,value_1,value_1,value_0,value_2,value_0,value_3]];
    [bounce setKeyTimes:@[@(0.2),@(0.4),@(0.43),@(.53),@(.7),@(.8),@(.9)]];
    [bounce setTimingFunctions:@[time_1,time_2,time_2,time_1,time_2,time_1,time_1,time_2]];
    bounce.duration = durationTime;
    [self.layer addAnimation:bounce forKey:@"ytx_bounceAnimtionWithDurationTime:"];
    
    
}

- (void)ytx_flashAnimtionWithDurationTime:(NSTimeInterval)durationTime {
 
    CAKeyframeAnimation *flashAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [flashAnimation setValues:@[@(0),@(1),@(0),@(1)]];
    [flashAnimation setKeyTimes:@[@(0.25),@(0.5),@(.75),@(1)]];
    flashAnimation.duration = durationTime;
    [self.layer addAnimation:flashAnimation forKey:@"ytx_flashAnimtionWithDurationTime:"];
    
}

- (void)ytx_pluseAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    
    float smallScaleValue = 1;
    float lagerScaleValue = 1.05;
    
    NSValue *smallScale = NSScaleValue(smallScaleValue, smallScaleValue, smallScaleValue);
    NSValue *lagerScale = NSScaleValue(lagerScaleValue, lagerScaleValue, lagerScaleValue);
    
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    shackAnimation.duration = durationTime;
    [shackAnimation setValues:@[smallScale,lagerScale,smallScale]];
    [shackAnimation setKeyTimes:@[@(0),@(.5),@(1)]];
    [self.layer addAnimation:shackAnimation forKey:@"ytx_pluseAnimtionWithDurationTime:"];
    
    
}

- (void)ytx_rubberBandAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    
    float smallScaleValue = 0.75;
    float smallMidScaleValue = 0.85;
    float defaultsmallScaleValue = 0.95;
    float defaultScaleValue = 1;
    float defaultlagerScaleValue = 1.05;
    float lagerMidScaleValue = 1.15;
    float lagerScaleValue = 1.25;
    
    NSValue *norScale = NSScaleValue(defaultScaleValue, defaultScaleValue, defaultScaleValue);
    
    CAKeyframeAnimation *rubberBand = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    rubberBand.duration = durationTime;
    [rubberBand setValues:@[norScale,
                            NSScaleValue(lagerScaleValue, smallScaleValue, defaultScaleValue),
                            NSScaleValue(smallScaleValue, lagerScaleValue, defaultScaleValue),
                            NSScaleValue(lagerMidScaleValue, smallMidScaleValue, defaultScaleValue),
                            NSScaleValue(defaultsmallScaleValue, defaultlagerScaleValue, defaultScaleValue),
                            NSScaleValue(defaultlagerScaleValue, defaultsmallScaleValue, defaultScaleValue),
                            norScale
                            ]];
    [rubberBand setKeyTimes:@[@(0),@(0.3),@(0.4),@(.5),@(.65),@(.75),@(1)]];
    [self.layer addAnimation:rubberBand forKey:@"ytx_rubberBandAnimtionWithDurationTime:"];
    
}

- (void)ytx_shakeAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    
    CGPoint center = self.center;
    float moveXLeft = center.x - 2.5;
    float moveXRight = center.x + 2.5;
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    shackAnimation.duration = durationTime / 3;
    
    [shackAnimation setValues:@[@(center.x),@(moveXLeft), @(moveXRight),@(center.x)]];
    shackAnimation.repeatCount = 3;
    [self.layer addAnimation:shackAnimation forKey:@"ytx_shakeAnimtionWithDurationTime:"];
}

- (void)ytx_swingAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    float rotateF = 0.15 * M_1_PI;
    float rotateS = 0.10 * M_1_PI;
    float rotateT = 0.5 * M_1_PI;
    
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    shackAnimation.duration = durationTime;
    
    [shackAnimation setValues:@[NSRotateValue(rotateF, 0.0 ,0.0 ,1.0),
                                NSRotateValue(-rotateS, 0.0 ,0.0 ,1.0),
                                NSRotateValue(rotateT, 0.0 ,0.0 ,1.0),
                                NSRotateValue(-rotateT, 0.0 ,0.0 ,1.0),
                                NSRotateValue(0, 0.0 ,0.0 ,1.0)]];
    
    [self.layer addAnimation:shackAnimation forKey:@"ytx_swingAnimtionWithDurationTime:"];
}

- (void)ytx_tadaAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    float rotate = 0.1 * M_1_PI;
    float smallScaleValue = 0.9;
    float lagerScaleValue = 1.1;
    
    NSValue *defultScale = NSScaleValue(1, 1, 1);
    NSValue *smallScale = NSScaleValue(smallScaleValue, smallScaleValue, smallScaleValue);
    NSValue *lagerScale = NSScaleValue(lagerScaleValue, lagerScaleValue, lagerScaleValue);
    NSValue *leftValue = NSRotateValue(-rotate, 0.0 ,0.0 ,1.0);
    NSValue *rightValue = NSRotateValue(rotate, 0.0 ,0.0 ,1.0);
    
    CAKeyframeAnimation *tadaAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    tadaAnimation.duration = durationTime;
    
    [tadaAnimation setValues:@[defultScale,smallScale,lagerScale,leftValue,rightValue,leftValue,rightValue,leftValue,rightValue,leftValue,rightValue,]];
    
    [self.layer addAnimation:tadaAnimation forKey:@"ytx_tadaAnimtionWithDurationTime:"];
    
}

- (void)ytx_wobbleAnimtionWithDurationTime:(NSTimeInterval)durationTime {
   
    float rotate_1 = 0.5 * M_1_PI;
    float rotate_2 = 0.3 * M_1_PI;
    float rotate_3 = 0.2 * M_1_PI;
    float rotate_4 = 0.1 * M_1_PI;
    
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    [rotateAnimation setValues:@[NSRotateValue(-rotate_1, 0.0 ,0.0 ,1.0),
                                 NSRotateValue(rotate_2 , 0.0 ,0.0 ,1.0),
                                 NSRotateValue(-rotate_2, 0.0 ,0.0 ,1.0),
                                 NSRotateValue(rotate_3, 0.0 ,0.0 ,1.0),
                                 NSRotateValue(rotate_4, 0.0 ,0.0 ,1.0),
                                 NSRotateValue(0, 0.0 ,0.0 ,1.0)]];
  
    CGFloat x = self.center.x;
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation  animationWithKeyPath:@"position.x"];
    [shakeAnimation setValues:@[@(0.75 * x) ,@(1.2 * x),@(0.85 * x),@(1.1 * x),@(0.95 * x),@(x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[rotateAnimation,shakeAnimation]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_wobbleAnimtionWithDurationTime:"];
}

- (void)ytx_jelloAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    
    float base = M_1_PI * 0.1;
    float rotate_1 = 12.5 * base;
    float rotate_2 = 6.25 * base;
    float rotate_3 = 3.125 * base;
    float rotate_4 = 1.5625 * base;
    float rotate_5 = 0.78125 * base;
    float rotate_6 = 0.390625 * base;
    float rotate_7 = 0.1953125 * base;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    animation.duration = durationTime;
    animation.calculationMode = kCAAnimationCubic;
    [animation setValues:@[NSRotateValue(0, 1,1 ,0.0),
                           NSRotateValue(-rotate_1, 1,1 ,0.0),
                           NSRotateValue(rotate_2, 1,1 ,0.0),
                           NSRotateValue(-rotate_3, 1,1 ,0.0),
                           NSRotateValue(rotate_4, 1,1 ,0.0),
                           NSRotateValue(-rotate_5, 1,1 ,0.0),
                           NSRotateValue(rotate_6, 1,1 ,0.0),
                           NSRotateValue(-rotate_7, 1,1 ,0.0)]];
    [self.layer addAnimation:animation forKey:@"ytx_jelloAnimtionWithDurationTime:"];
}


#pragma mark - Bouncing Entrances

- (void)ytx_bounceInAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    CAKeyframeAnimation *bounceln = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    [bounceln setValues:@[NSScaleValue(.3, .3, .3),
                          NSScaleValue(1.1, 1.1, 1.1),
                          NSScaleValue(.9, .9, .9),
                          NSScaleValue(1.03, 1.03, 1.03),
                          NSScaleValue(0.97, 0.97, 0.97),
                          NSScaleValue(1, 1, 1)]];
    CAMediaTimingFunction *time = CAMediaTimingFunction (0.215, 0.610, 0.355, 1.000);
    [bounceln setKeyTimes:@[@0, @(0.2),@(0.4),@(.6),@(.8), @1]];
    [bounceln setTimingFunction:time];
    bounceln.duration = durationTime;
    [self.layer addAnimation:bounceln forKey:@"ytx_bounceInAnimtionWithDurationTime:"];
}

- (void)ytx_bounceInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    CAKeyframeAnimation *bouncelnDown = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    
    CGFloat y = self.center.y;
    NSNumber *value_0 = @(-3000 + y);
    NSNumber *value_1 = @(25 + y);
    NSNumber *value_2 = @(-10 + y);
    NSNumber *value_3 = @(5 + y);
    [bouncelnDown setValues:@[value_0, value_1, value_2, value_3, @(y)]];
    
    CAMediaTimingFunction *time = CAMediaTimingFunction (0.215, 0.610, 0.355, 1.000);
    [bouncelnDown setKeyTimes:@[@0, @(0.6),@(0.75),@(.9), @1]];
    [bouncelnDown setTimingFunction:time];
    
    bouncelnDown.duration = durationTime;
    [self.layer addAnimation:bouncelnDown forKey:@"ytx_bounceInDownAnimtionWithDurationTime:"];
}

- (void)ytx_bounceInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    CAKeyframeAnimation *bouncelnLeft = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    
    CGFloat x = self.center.x;
    NSNumber *value_0 = @(-3000 + x);
    NSNumber *value_1 = @(25 + x);
    NSNumber *value_2 = @(-10 + x);
    NSNumber *value_3 = @(5 + x);
    [bouncelnLeft setValues:@[value_0, value_1, value_2, value_3,@(x)]];
    
    CAMediaTimingFunction *time = CAMediaTimingFunction (0.215, 0.610, 0.355, 1.000);
    [bouncelnLeft setKeyTimes:@[@0, @(0.6),@(0.75),@(.9), @1]];
    [bouncelnLeft setTimingFunction:time];
    
    bouncelnLeft.duration = durationTime;
    [self.layer addAnimation:bouncelnLeft forKey:@"ytx_bounceInLeftAnimtionWithDurationTime:"];
}

- (void)ytx_bounceInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    CAKeyframeAnimation *bouncelnRight = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    
    CGFloat x = self.center.x;
    NSNumber *value_0 = @(3000 + x);
    NSNumber *value_1 = @(-25 + x);
    NSNumber *value_2 = @(10 + x);
    NSNumber *value_3 = @(-5 + x);
    [bouncelnRight setValues:@[value_0, value_1, value_2, value_3, @(x)]];
    
    CAMediaTimingFunction *time = CAMediaTimingFunction (0.215, 0.610, 0.355, 1.000);
    [bouncelnRight setKeyTimes:@[@0, @(0.6),@(0.75),@(.9), @1]];
    [bouncelnRight setTimingFunction:time];
    
    bouncelnRight.duration = durationTime;
    [self.layer addAnimation:bouncelnRight forKey:@"ytx_bounceInRightAnimtionWithDurationTime:"];
}

- (void)ytx_bounceInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    CAKeyframeAnimation *bouncelnUp = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    
    CGFloat y = self.center.y;
    NSNumber *value_0 = @(3000 + y);
    NSNumber *value_1 = @(-20 + y);
    NSNumber *value_2 = @(10 + y);
    NSNumber *value_3 = @(-5 + y);
    [bouncelnUp setValues:@[value_0,value_1,value_2,value_3, @(y)]];
    
    CAMediaTimingFunction *time = CAMediaTimingFunction (0.215, 0.610, 0.355, 1.000);
    [bouncelnUp setKeyTimes:@[@0, @(0.6),@(0.75),@(.9), @1]];
    [bouncelnUp setTimingFunction:time];
    
    bouncelnUp.duration = durationTime;
    [self.layer addAnimation:bouncelnUp forKey:@"ytx_bounceInUpAnimtionWithDurationTime:"];
    
}

#pragma mark - Fading Entrances

- (void)ytx_fadeInAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    CAKeyframeAnimation *fadeInOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    
    [fadeInOpacity setValues:@[@0, @1]];
    
    fadeInOpacity.duration = durationTime;
    [self.layer addAnimation:fadeInOpacity forKey:@"ytx_fadeInAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    CAKeyframeAnimation *fadeInDownOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [fadeInDownOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInDownPosition = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    [fadeInDownPosition setValues:@[@(-[UIScreen mainScreen].bounds.size.height + self.center.y), @(self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInDownOpacity, fadeInDownPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInDownAnimtionWithDurationTime:"];
}

- (void)ytx_fadeInDownBigAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    CAKeyframeAnimation *fadeInDownBigOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [fadeInDownBigOpacity setValues:@[@0, @1]];
    
    CAKeyframeAnimation *fadeInDownBigPosition = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    [fadeInDownBigPosition setValues:@[@(-2000 + self.center.y), @(self.center.y)]];
    
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
    [fadeInLeftPosition setValues:@[@(-[UIScreen mainScreen].bounds.size.width + self.center.x), @(self.center.x)]];
    
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
    [fadeInLeftBigPosition setValues:@[@(-2000 + self.center.x), @(self.center.x)]];
    
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
    [fadeInRightPosition setValues:@[@([UIScreen mainScreen].bounds.size.width + self.center.x), @(self.center.x)]];
    
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
    [fadeInRightBigPosition setValues:@[@(2000 + self.center.x), @(self.center.x)]];
    
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
    [fadeInUpPosition setValues:@[@([UIScreen mainScreen].bounds.size.height + self.center.y), @(self.center.y)]];
    
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
    [fadeInUpBigPosition setValues:@[@(2000 + self.center.y), @(self.center.y)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[fadeInUpBigOpacity, fadeInUpBigPosition]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_fadeInUpBigAnimtionWithDurationTime:"];
}



#pragma mark - Special
- (void)ytx_hingeAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    
    float base = M_1_PI * -1;
    float rotate_1 = 80 * base + M_PI_2;
    float rotate_2 = 60 * base + M_PI_2;
    
    // values里添加NSTranslateValue不管用？？？
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    animation.duration = durationTime;
    animation.calculationMode = kCAMediaTimingFunctionEaseInEaseOut;
    [animation setValues:@[NSRotateValue(0, 0, 0, 1),
                           NSRotateValue(rotate_1, 0, 0, 1),
                           NSRotateValue(rotate_2, 0, 0, 1),
                           NSRotateValue(rotate_1, 0, 0, 1),
                           NSRotateValue(rotate_2, 0, 0, 1),
//                           NSTranslateValue(0, 700, 0),
                           ]];
    
    CAKeyframeAnimation *anchorAnimation = [CAKeyframeAnimation  animationWithKeyPath:@"anchorPoint"];
    [anchorAnimation setValues:@[CGPointValue(0, 0),
                                 CGPointValue(0, 0),
                                 CGPointValue(0.5, 0.5)]];
    [anchorAnimation setKeyTimes:@[@(0),@(.8),@(1)]];
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [opacity setValues:@[@1,@0]];
    [opacity setKeyTimes:@[@(.8),@1]];
    
    CGFloat y = self.center.y;
    CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    [position setValues:@[@(y),@(y+700)]];
    [position setKeyTimes:@[@(.8),@1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[anchorAnimation,animation,opacity,position]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_hingeAnimtionWithDurationTime:"];
}

- (void)ytx_rollInAnimationWithDurationTime:(NSTimeInterval)durationTime {
    float base = M_1_PI * .1;
    float rotate_1 = 120 * base;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    [animation setValues:@[
                           NSRotateValue(rotate_1, 0, 0, 1),
                           NSRotateValue(0, 0, 0, 1)]];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = self.center.x;
    CAKeyframeAnimation *position = [CAKeyframeAnimation  animationWithKeyPath:@"position.x"];
    [position setValues:@[@(-width + x),@(x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[position,animation]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"ytx_rollInAnimationWithDurationTime:"];
}

- (void)ytx_rollOutAnimationWithDurationTime:(NSTimeInterval)durationTime {
    float base = M_1_PI ;
    float rotate_1 = 120 * base  + M_PI;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    [animation setValues:@[
                           NSRotateValue(0, 0, 0, 1),
                           NSRotateValue(-rotate_1, 0, 0, 1)]];
    
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
