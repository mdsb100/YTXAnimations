//
//  UIView+YTXMagicCSS.h
//  Pods
//
//  Created by CaoJun on 16/4/23.
//
//

#import <UIKit/UIKit.h>

@interface UIView (YTXMagicCSS)

#pragma mark - Magic Effects
- (nonnull CAAnimation *)ytx_magicAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_twisterInDownAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_twisterInUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_swapAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Static Effects
- (nonnull CAAnimation *)ytx_openAnimationWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 animationName:(nonnull NSString *) name;

- (nonnull CAAnimation *)ytx_openAnimationWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 opacity00:(CGFloat)opacity00 opacity10:(CGFloat)opacity10 animationName:(nonnull NSString *) name;

- (nonnull CAAnimation *)ytx_openDownLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openDownRightAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpRightAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openDownLeftRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openDownRightRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpLeftRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpRightRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Static Effects Out
- (nonnull CAAnimation *)ytx_openDownLeftOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openDownRightOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpLeftOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpRightOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Perspective
- (nonnull CAAnimation *)ytx_perspectiveAnimationWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 rotateX:(CGFloat)rotateX rotateY:(CGFloat)rotateY animationName:(nonnull NSString *) name;

- (nonnull CAAnimation *)ytx_perspectiveDownAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveRightAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveDownRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveUpRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveLeftRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveRightRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Rotate
- (nonnull CAAnimation *)ytx_rotateDownAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_rotateUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_rotateLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_rotateRightAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Slide
- (nonnull CAAnimation *)ytx_slideAnimationWithDurationTime:(NSTimeInterval)durationTime isIn:(BOOL)isIn translateValues:(nonnull NSArray *)translateValues animationName:(nonnull NSString *) name;

- (nonnull CAAnimation *)ytx_slideDownAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideRightAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideDownRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideLeftRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideRightRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideUpRetournAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Math
- (nonnull CAAnimation *)ytx_swashOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_swashInAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_foolishOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_foolishInAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_holeOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Tin
- (nonnull CAAnimation *)ytx_tinDownInAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinLeftInAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinRightInAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinUpInAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinDownOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinLeftOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinRightOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinUpOutAnimationWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Boing
- (nonnull CAAnimation *)ytx_boingInUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_boingOutDownAnimationWithDurationTime:(NSTimeInterval)durationTime;
#pragma mark - On The Space
- (nonnull CAAnimation *)ytx_spaceOutUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_spaceOutRightAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_spaceOutDownAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_spaceOutLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_spaceInUpAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_spaceInRightAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_spaceInDownAnimationWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_spaceInLeftAnimationWithDurationTime:(NSTimeInterval)durationTime;

@end
