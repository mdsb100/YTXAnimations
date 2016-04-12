//
//  UIView+YTXAnimation.h
//  p4
//
//  Created by 李龙龙 on 16/4/7.
//  Copyright © 2016年 com.baidao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YTXAnimation)

#pragma mark - Attention Seekers
/** bounce 弹性动画*/
- (void)ytx_bounceAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** 闪烁动画*/
- (void)ytx_flashAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** pluse动画*/
- (void)ytx_pluseAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (void)ytx_rubberBandAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** shake摇晃动画*/
- (void)ytx_shakeAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (void)ytx_swingAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** tada动画  基于<JHChainableAnimations/JHChainableAnimations.h>*/
- (void)ytx_tadaAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (void)ytx_wobbleAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (void)ytx_jelloAnimtionWithDurationTime:(NSTimeInterval)durationTime;
@end
