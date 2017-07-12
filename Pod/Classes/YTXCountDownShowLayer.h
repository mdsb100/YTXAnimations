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
@property (copy, nonnull, nonatomic) NSNumber * innerRadius; /**<default is width/2.f*/
@property (copy, nonnull, nonatomic) NSNumber * outerRadius; /**<default is width/2.f*/

- (nonnull CAKeyframeAnimation *)countDownAnimationWithDurationTime:(CFTimeInterval)durationTime;

@end
