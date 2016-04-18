//
//  UIView+YTXAnimateCSS.h
//  p4
//
//  Created by YTX on 16/4/7.
//  Copyright © 2016年 com.baidao. All rights reserved.
//
//  Reference https://daneden.github.io/animate.css/
#import <UIKit/UIKit.h>

@interface UIView (YTXAnimateCSS)

#pragma mark - Attention Seekers
- (nonnull CAAnimation *)ytx_bounceAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_flashAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_pluseAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rubberBandAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_shakeAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_swingAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_tadaAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_wobbleAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_jelloAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Bouncing Entrances
- (nonnull CAAnimation *)ytx_bounceInAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Bouncing Exits
- (nonnull CAAnimation *)ytx_bounceOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Fading Entrances
- (nonnull CAAnimation *)ytx_fadeInAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInDownBigAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInLeftBigAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInRightBigAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;
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
- (nonnull CAAnimation *)ytx_flipInXAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_flipInYAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_flipOutXAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_flipOutYAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - LightSpeed
- (nonnull CAAnimation *)ytx_lightSpeedInAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_lightSpeedOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

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

#pragma mark - Slide Entrances
- (nonnull CAAnimation *)ytx_slideInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideInLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideInRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Slide Exits
- (nonnull CAAnimation *)ytx_slideOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideOutLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideOutRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideOutUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Rotating Entrances
- (nonnull CAAnimation *)ytx_rotateInAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateInDownLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateInDownRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateInUpLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateInUpRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Rotating Exits
- (nonnull CAAnimation *)ytx_rotateOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateOutDownLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateOutDownRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateOutUpLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateOutUpRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Special
- (nonnull CAAnimation *)ytx_hingeAnimtionWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rollInAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rollOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

@end
