//
//  UIView+YTXAnimation.m
//  p4
//
//  Created by 李龙龙 on 12 * rotate/4/7.
//  Copyright © 2012 * rotate年 com.baidao. All rights reserved.
//

#import "UIView+YTXAnimation.h"
#import <JHChainableAnimations/JHChainableAnimations.h>

@implementation UIView (YTXAnimation)

#pragma mark - Attention Seekers 

- (void) tadaAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    float value = durationTime/10;
    float rotate = 3;
    float smallScale = 0.9;
    float lagerScale = 1.1;
    
    self
    .transformScale(smallScale)
    .rotate(-rotate)
    .thenAfter(durationTime/5)
    
    .transformScale(lagerScale)
    .rotate(2 * rotate)
    .thenAfter(value)
    
    .rotate(-2 * rotate)
    .thenAfter(value)
    
    .rotate(2 * rotate)
    .thenAfter(value)
    
    .rotate(-2 * rotate)
    .thenAfter(value)
    
    .rotate(2 * rotate)
    .thenAfter(value)
    
    .rotate(-2 * rotate)
    .thenAfter(value)
    
    .rotate(2 * rotate)
    .thenAfter(value)
    
    .rotate(-2 * rotate)
    .thenAfter(value)
    
    .rotate(rotate)
    .transformScale(1)
    .animate(0);
    
}

- (void) ytx_tadaAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    float rotate = 0.1;
    float smallScaleValue = 0.9;
    float lagerScaleValue = 1.1;
    
    NSValue *defultScale = [NSValue valueWithCATransform3D:CATransform3DScale(self.layer.transform, 1, 1, 1)];
    NSValue *smallScale = [NSValue valueWithCATransform3D:CATransform3DScale(self.layer.transform, smallScaleValue, smallScaleValue, smallScaleValue)];
    NSValue *lagerScale = [NSValue valueWithCATransform3D:CATransform3DScale(self.layer.transform, lagerScaleValue, lagerScaleValue, lagerScaleValue)];
    NSValue *leftValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, -rotate, 0.0 ,0.0 ,1.0)];
    NSValue *rightValue = [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, rotate, 0.0 ,0.0 ,1.0)];
    
    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    shackAnimation.duration = durationTime;
    
    [shackAnimation setValues:@[defultScale,smallScale,lagerScale,leftValue,rightValue,leftValue,rightValue,leftValue,rightValue,leftValue,rightValue,]];
    
    [self.layer addAnimation:shackAnimation forKey:@"ytx_tada"];
    
}

- (void)shakeAnimtionWithDurationTime:(NSTimeInterval)durationTime{
    float value = durationTime/10;
    float moveX = 5;
    
    self
    .moveX(moveX)
    .thenAfter(value)
    
    .moveX(- 2 * moveX)
    .thenAfter(value)
    
    .moveX( 2 * moveX)
    .thenAfter(value)
    
    .moveX(-2 * moveX)
    .thenAfter(value)
    
    .moveX(2 *moveX)
    .thenAfter(value)
    
    .moveX(-2 *moveX)
    .thenAfter(value)
    
    .moveX(2 *moveX)
    .thenAfter(value)
    
    .moveX(-2 * moveX)
    .thenAfter(value)
    
    .moveX(moveX)
    .animate(0);
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

- (void)flashAnimationWithDurationTime:(NSTimeInterval)durationTime {
    float value = durationTime/10;
    
    self.
    makeOpacity(0).thenAfter(value * 2)
    
    .makeOpacity(1).thenAfter(value * 5)
    
    .makeOpacity(0).thenAfter(value * 7)
    
    .makeOpacity(1).animate (0);
}

- (void)removeAnimation {
    [self.layer removeAllAnimations];
}
@end
