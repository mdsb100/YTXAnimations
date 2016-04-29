//
//  YTXGooeyCircleView.h
//  Pods
//
//  Created by CaoJun on 16/4/29.
//
//

#import <UIKit/UIKit.h>

@interface YTXGooeyCircleLayer : CALayer

@property (nonnull, nonatomic, strong) NSNumber * gooeySize;
@property (nonnull, nonatomic, strong) UIColor * gooeyColor;

- (void)springAnimationWithDurationTime:(CFTimeInterval)durationTime;

- (void)springAnimationWithDurationTime:(CFTimeInterval)durationTime usingSpringWithDamping:(CGFloat)damping initialSpringVelocity:(CGFloat)velocity fromValue:(id)fromValue toValue:(id)toValue;

@end
