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
- (nonnull CAAnimation *)ytx_bounceAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_flashAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_pluseAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rubberBandAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_shakeAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_swingAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_tadaAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_wobbleAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_jelloAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Bouncing Entrances
- (nonnull CAAnimation *)ytx_bounceInAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceInDownAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceInLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceInRightAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceInUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Bouncing Exits
- (nonnull CAAnimation *)ytx_bounceOutAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceOutDownAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceOutLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceOutRightAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_bounceOutUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Fading Entrances
- (nonnull CAAnimation *)ytx_fadeInAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInDownAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInDownBigAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInLeftBigAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInRightAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInRightBigAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInUpAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeInUpBigAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Fading Exits
- (nonnull CAAnimation *)ytx_fadeOutAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeOutDownAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeOutDownBigAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeOutLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeOutLeftBigAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeOutRightAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeOutRightBigAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeOutUpAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_fadeOutUpBigAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Flippers
- (nonnull CAAnimation *)ytx_flipAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_flipInXAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_flipInYAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_flipOutXAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_flipOutYAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - LightSpeed
- (nonnull CAAnimation *)ytx_lightSpeedInAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_lightSpeedOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Zoom Entrances
- (nonnull CAAnimation *)ytx_zoomInAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomInDownAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomInLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomInRightAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomInUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Zoom Exits
- (nonnull CAAnimation *)ytx_zoomOutAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomOutDownAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomOutLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomOutRightAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_zoomOutUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Slide Entrances
- (nonnull CAAnimation *)ytx_slideInDownAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideInLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideInRightAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideInUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Slide Exits
- (nonnull CAAnimation *)ytx_slideOutDownAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideOutLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideOutRightAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_slideOutUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Rotating Entrances
- (nonnull CAAnimation *)ytx_rotateInAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateInDownLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateInDownRightAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateInUpLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateInUpRightAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Rotating Exits
- (nonnull CAAnimation *)ytx_rotateOutAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateOutDownLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateOutDownRightAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateOutUpLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rotateOutUpRightAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Special
- (nonnull CAAnimation *)ytx_hingeAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rollInAnimationWithDurationTime:(NSTimeInterval)durationTime;
- (nonnull CAAnimation *)ytx_rollOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

@end
