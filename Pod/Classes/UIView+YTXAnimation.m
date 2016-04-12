//
//  UIView+YTXAnimation.m
//  p4
//
//  Created by 李龙龙 on 12 * rotate/4/7.
//  Copyright © 2012 * rotate年 com.baidao. All rights reserved.
//

#import "UIView+YTXAnimation.h"

#define NSScaleValue(x,y,z)     [NSValue valueWithCATransform3D:CATransform3DScale(self.layer.transform, x ,y ,z)]

#define NSRotateValue(d,x,y,z) [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, d, x ,y ,z)]



@implementation UIView (YTXAnimation)

#pragma mark - Attention Seekers

- (void)ytx_bounceAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    
    // 0 - 1 越小振动效果越明显
    float damping = 0.33;
    // 初始的速度，数值越大一开始移动越快
    float velocity = 5;
    
    [UIView animateWithDuration:.2 animations:^{
        self.transform = CGAffineTransformTranslate(self.transform, 0, -10);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 delay:0
             usingSpringWithDamping:damping initialSpringVelocity:velocity options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.transform = CGAffineTransformTranslate(self.transform, 0, 10);
                         } completion:nil];
    }];
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
    NSValue *thirtScale = NSScaleValue(lagerScaleValue, smallScaleValue, defaultScaleValue);
    NSValue *fourScale = NSScaleValue(smallScaleValue, lagerScaleValue, defaultScaleValue);
    NSValue *fiveScale = NSScaleValue(lagerMidScaleValue, smallMidScaleValue, defaultScaleValue);
    NSValue *sixScale = NSScaleValue(defaultsmallScaleValue, defaultlagerScaleValue, defaultScaleValue);
    NSValue *sevenScale = NSScaleValue(defaultlagerScaleValue, defaultsmallScaleValue, defaultScaleValue);
    
    CAKeyframeAnimation *rubberBand = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    rubberBand.duration = durationTime;
    [rubberBand setValues:@[norScale,thirtScale,fourScale,fiveScale,sixScale,sevenScale,norScale]];
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
    
    NSValue *firtstValue = NSRotateValue(rotateF, 0.0 ,0.0 ,1.0);
    NSValue *secValue = NSRotateValue(-rotateS, 0.0 ,0.0 ,1.0);
    NSValue *thirdValue = NSRotateValue(rotateT, 0.0 ,0.0 ,1.0);
    NSValue *fourValue = NSRotateValue(-rotateT, 0.0 ,0.0 ,1.0);
     NSValue *fiveValue = NSRotateValue(0, 0.0 ,0.0 ,1.0);
    
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    shackAnimation.duration = durationTime;
    
    [shackAnimation setValues:@[firtstValue,secValue,thirdValue,fourValue,fiveValue]];
    
    [self.layer addAnimation:shackAnimation forKey:@"ytx_swing"];
}

- (void)ytx_tadaAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    float rotate = 0.1;
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
   
    float rotateF = 0.5 * M_1_PI;
    float rotateS = 0.3 * M_1_PI;
    float rotateT = 0.2 * M_1_PI;
    float rotateFr = 0.1 * M_1_PI;
    
    CGFloat x = self.center.x;
    NSValue *rotateFir = NSRotateValue(-rotateF, 0.0 ,0.0 ,1.0);
    NSValue *rotateSec = NSRotateValue(rotateS , 0.0 ,0.0 ,1.0);
    NSValue *rotateTrt = NSRotateValue(-rotateS, 0.0 ,0.0 ,1.0);
    NSValue *rotateFour = NSRotateValue(rotateT, 0.0 ,0.0 ,1.0);
    NSValue *rotateFiv = NSRotateValue(rotateFr, 0.0 ,0.0 ,1.0);
    NSValue *rotateLast = NSRotateValue(0, 0.0 ,0.0 ,1.0);
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    [rotateAnimation setValues:@[rotateFir,rotateSec,rotateTrt,rotateFour,rotateFiv,rotateLast]];
  
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation  animationWithKeyPath:@"position.x"];
    [shakeAnimation setValues:@[@(0.75 * x) ,@(1.2 * x),@(0.85 * x),@(1.1 * x),@(0.95 * x),@(x)]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[rotateAnimation,shakeAnimation]];
    [group setDuration:durationTime];
    [self.layer addAnimation:group forKey:@"wobble"];
}

- (void)ytx_jelloAnimtionWithDurationTime:(NSTimeInterval)durationTime {
    
    float base = M_1_PI * 0.1;
    float rotateFValue = 12.5 * base;
    float rotateSValue = 6.25 * base;
    float rotateTValue = 3.125 * base;
    float rotateFrValue = 1.5625 * base;
    float rotateFivValue = 0.78125 * base;
    float rotateSixValue = 0.390625 * base;
    float rotateEValue = 0.1953125 * base;
    
    NSValue *rotateZero = NSRotateValue(0, 1,1 ,0.0);
    NSValue *rotateFir = NSRotateValue(-rotateFValue, 1,1 ,0.0);
    NSValue *rotateSec = NSRotateValue(rotateSValue, 1,1 ,0.0);
    NSValue *rotateTrt = NSRotateValue(-rotateTValue, 1,1 ,0.0);
    NSValue *rotateFour = NSRotateValue(rotateFrValue, 1,1 ,0.0);
    NSValue *rotateFive = NSRotateValue(-rotateFivValue, 1,1 ,0.0);
    NSValue *rotateSix = NSRotateValue(rotateSixValue, 1,1 ,0.0);
    NSValue *rotateSeven = NSRotateValue(-rotateEValue, 1,1 ,0.0);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    animation.duration = durationTime;
    [animation setValues:@[rotateZero,rotateFir,rotateSec,rotateTrt,rotateFour,rotateFive,rotateSix,rotateSeven]];
    [self.layer addAnimation:animation forKey:@"jello"];
}
@end
