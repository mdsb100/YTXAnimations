//
//  YTXCountDownShowLayer.h
//  Pods
//
//  Created by CaoJun on 16/5/11.
//
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface YTXCountDownShowLayer : CALayer

@property (nonnull, nonatomic, strong) UIColor * countDownColor;
@property (assign, nonatomic) BOOL clockwise;

- (nonnull CAKeyframeAnimation *)countDownAnimationWithDurationTime:(CFTimeInterval)durationTime;

@end
