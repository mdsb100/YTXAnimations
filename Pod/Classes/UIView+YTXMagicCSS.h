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
- (nonnull CAAnimation *)ytx_magicAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_twisterInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_twisterInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_swapAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Static Effects
- (nonnull CAAnimation *)ytx_openAnimtionWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 animationName:(nonnull NSString *) name;

- (nonnull CAAnimation *)ytx_openAnimtionWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 opacity00:(CGFloat)opacity00 opacity10:(CGFloat)opacity10 animationName:(nonnull NSString *) name;

- (nonnull CAAnimation *)ytx_openDownLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openDownRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openDownLeftRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openDownRightRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpLeftRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpRightRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Static Effects Out
- (nonnull CAAnimation *)ytx_openDownLeftOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openDownRightOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpLeftOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_openUpRightOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Perspective
- (nonnull CAAnimation *)ytx_perspectiveAnimtionWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 rotateX:(CGFloat)rotateX rotateY:(CGFloat)rotateY animationName:(nonnull NSString *) name;

- (nonnull CAAnimation *)ytx_perspectiveDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveDownRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveUpRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveLeftRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_perspectiveRightRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Rotate
- (nonnull CAAnimation *)ytx_rotateDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_rotateUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_rotateLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_rotateRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Slide
- (nonnull CAAnimation *)ytx_slideAnimtionWithDurationTime:(NSTimeInterval)durationTime isIn:(BOOL)isIn translateValues:(nonnull NSArray *)translateValues animationName:(nonnull NSString *) name;

- (nonnull CAAnimation *)ytx_slideDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideRightAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideDownRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideLeftRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideRightRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_slideUpRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Math
- (nonnull CAAnimation *)ytx_swashOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_swashInAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_foolishOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_foolishInAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_holeOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Tin
- (nonnull CAAnimation *)ytx_tinDownInAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinLeftInAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinRightInAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinUpInAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinDownOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinLeftOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinRightOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_tinUpOutAnimtionWithDurationTime:(NSTimeInterval)durationTime;

#pragma mark - Boing
- (nonnull CAAnimation *)ytx_boingInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime;

- (nonnull CAAnimation *)ytx_boingOutDownAnimtionWithDurationTime:(NSTimeInterval)durationTime;
@end
