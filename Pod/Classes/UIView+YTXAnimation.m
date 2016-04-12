//
//  UIView+YTXAnimation.m
//  p4
//
//  Created by 李龙龙 on 12 * rotate/4/7.
//  Copyright © 2012 * rotate年 com.baidao. All rights reserved.
//

#import "UIView+YTXAnimation.h"

#define NSScaleValue(x,y,z)     [NSValue valueWithCATransform3D:CATransform3DScale(self.layer.transform, x ,y ,z)]

#define NSRotateValue(d,x,y,z)  [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, d, x ,y ,z)]

#define NSTranslateValue(x,y,z) [NSValue valueWithCATransform3D:CATransform3DTranslate(self.layer.transform, x ,y ,z)]

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
    [self.layer addAnimation:bounce forKey:@"bounce"];
    
    
}

- (void)ytx_flashAnimtionWithDurationTime:(NSTimeInterval)durationTime {
 
    CAKeyframeAnimation *flashAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [flashAnimation setValues:@[@(0),@(1),@(0),@(1)]];
    [flashAnimation setKeyTimes:@[@(0.25),@(0.5),@(.75),@(1)]];
    flashAnimation.duration = durationTime;
    [self.layer addAnimation:flashAnimation forKey:@"ytx_flash"];
    
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
    [self.layer addAnimation:shackAnimation forKey:@"ytx_pluse"];
    
    
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
    [self.layer addAnimation:rubberBand forKey:@"rubberBand"];
    
}

- (void)ytx_shakeAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    
    CGPoint center = self.center;
    float moveXLeft = center.x - 2.5;
    float moveXRight = center.x + 2.5;
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    shackAnimation.duration = durationTime / 3;
    
    [shackAnimation setValues:@[@(center.x),@(moveXLeft), @(moveXRight),@(center.x)]];
    shackAnimation.repeatCount = 3;
    [self.layer addAnimation:shackAnimation forKey:@"ytx_shake"];
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
    
    [self.layer addAnimation:shackAnimation forKey:@"ytx_swing"];
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
    
    [self.layer addAnimation:tadaAnimation forKey:@"ytx_tada"];
    
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
    [self.layer addAnimation:group forKey:@"wobble"];
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
    [self.layer addAnimation:animation forKey:@"jello"];
}
@end
