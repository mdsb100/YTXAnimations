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
- (nonnull CAAnimation *)ytx_bounceAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** 闪烁动画*/
- (nonnull CAAnimation *)ytx_flashAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** pluse动画*/
- (nonnull CAAnimation *)ytx_pluseAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** rubberBand动画*/
- (nonnull CAAnimation *)ytx_rubberBandAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** shake摇晃动画*/
- (nonnull CAAnimation *)ytx_shakeAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** swing动画*/
- (nonnull CAAnimation *)ytx_swingAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** tada动画  基于<JHChainableAnimations/JHChainableAnimations.h>*/
- (nonnull CAAnimation *)ytx_tadaAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** wobble动画*/
- (nonnull CAAnimation *)ytx_wobbleAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** jello动画*/
- (nonnull CAAnimation *)ytx_jelloAnimtionWithDurationTime:(NSTimeInterval)durationTime;


#pragma mark - Bouncing Entrances

/** bounceln动画*/
- (nonnull CAAnimation *)ytx_bounceInAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** bouncelnDown动画*/
- (nonnull CAAnimation *)ytx_bounceInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** bouncelnLeft动画*/
- (nonnull CAAnimation *)ytx_bounceInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** bouncelnRight动画*/
- (nonnull CAAnimation *)ytx_bounceInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** bouncelnUp动画*/
- (nonnull CAAnimation *)ytx_bounceInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Fading Entrances

/** fadeIn动画*/
- (nonnull CAAnimation *)ytx_fadeInAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** fadeInDown动画*/
- (nonnull CAAnimation *)ytx_fadeInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** fadeInDownBig动画*/
- (nonnull CAAnimation *)ytx_fadeInDownBigAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** fadeInLeft动画*/
- (nonnull CAAnimation *)ytx_fadeInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** fadeInLeftBig动画*/
- (nonnull CAAnimation *)ytx_fadeInLeftBigAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** fadeInRight动画*/
- (nonnull CAAnimation *)ytx_fadeInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** fadeInRightBig动画*/
- (nonnull CAAnimation *)ytx_fadeInRightBigAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** fadeInUp动画*/
- (nonnull CAAnimation *)ytx_fadeInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** fadeInUpBig动画*/
- (nonnull CAAnimation *)ytx_fadeInUpBigAnimtionWithDurationTime:(NSTimeInterval)durationTime;


#pragma mark - Fading Exits
- (nonnull CAAnimation *)ytx_fadeOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_fadeOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_fadeOutDownBigAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_fadeOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_fadeOutLeftBigAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_fadeOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_fadeOutRightBigAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_fadeOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_fadeOutUpBigAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Flippers
- (nonnull CAAnimation *)ytx_flipAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Zoom Entrances
- (nonnull CAAnimation *)ytx_zoomInAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Zoom Exits
- (nonnull CAAnimation *)ytx_zoomOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;
 

#pragma mark - Special
- (nonnull CAAnimation *)ytx_hingeAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rollInAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rollOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

@end
