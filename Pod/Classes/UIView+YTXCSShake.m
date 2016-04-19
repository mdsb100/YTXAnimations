//
//  UIView+YTXCSShake.m
//  Pods
//
//  Created by CaoJun on 16/4/19.
//
//

#import "UIView+YTXCSShake.h"

// 转化为NSValue
#define YTXScaleValue(x,y,z)                    [NSValue valueWithCATransform3D:CATransform3DScale(self.layer.transform, (x), (y), (z))]
#define YTXRotateValue(d,x,y,z)                 [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, (d), (x), (y), (z))]
#define YTXTranslateValue(x,y,z)                [NSValue valueWithCATransform3D:CATransform3DTranslate(self.layer.transform, (x), (y), (z))]
#define YTXPointValue(x,y)                      [NSValue valueWithCGPoint:CGPointMake((x), (y))]

//屏幕宽度
#define SELF_WIDTH                              (self.frame.size.width)
#define SELF_HEIGHT                             (self.frame.size.height)

#define YTX_RADIAN(x)                           ((x) * M_PI / 180.0)

//获取YTXCAMediaTimingFunction
#define YTXCAMediaTimingFunction(x1,y1,x2,y2)   [CAMediaTimingFunction functionWithControlPoints:x1 :y1 :x2 :y2]

#define BIG_DISTANCE_VALUE                      1000

#define OPACITY                                 @"opacity"
#define POSITION                                @"position"
#define POSITION_X                              @"position.x"
#define POSITION_Y                              @"position.y"
#define TRANSFORM                               @"transform"
#define ANCHORPOINT                             @"anchorPoint"

@implementation UIView (YTXCSShake)

- (nonnull CAAnimation *)ytx_basicShakeAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAMediaTimingFunction *time_1 = YTXCAMediaTimingFunction (0.215, 0.610, 0.355, 1);
    CAMediaTimingFunction *time_2 = YTXCAMediaTimingFunction (0.755, 0.050, 0.855, 0.060);
    
    CGFloat y = self.center.y;
    NSNumber *value_0 = @(0 + y);
    NSNumber *value_1 = @(-15 + y);
    NSNumber *value_2 = @(-8 + y);
    NSNumber *value_3 = @(-2 + y);
    
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [bounce setValues  :@[value_0, value_1, value_1, value_0, value_2, value_0, value_3]];
    [bounce setKeyTimes:@[@(0.2) , @(0.4) , @(0.43), @(.53) , @(.7)  , @(.8)  , @(.9)]];
    [bounce setTimingFunctions:@[time_1, time_2, time_2, time_1, time_2, time_1, time_1, time_2]];
    
    bounce.duration = durationTime;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:bounce forKey:@"ytx_basicShakeAnimtionWithDurationTime:"];
    });
    return bounce;
}

@end
