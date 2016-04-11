//
//  UIView+YTXAnimation.h
//  p4
//
//  Created by 李龙龙 on 16/4/7.
//  Copyright © 2016年 com.baidao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YTXAnimation)

/** tada动画  基于<JHChainableAnimations/JHChainableAnimations.h>*/
- (void)ytx_tadaAnimtionWithDurationTime:(NSTimeInterval)durationTime;

/** shake摇晃动画*/
- (void)ytx_shakeAnimtionWithDurationTime:(NSTimeInterval)durationTime;

@end
