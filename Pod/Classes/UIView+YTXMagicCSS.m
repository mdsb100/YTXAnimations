//
//  UIView+YTXMagicCSS.m
//  Pods
//
//  Created by CaoJun on 16/4/23.
//
//

#import "UIView+YTXMagicCSS.h"

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

@implementation UIView (YTXMagicCSS)

- (nonnull CAAnimation *)ytx_magicAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [opacity setValues:@[@1, @0]];
    [opacity setKeyTimes:@[@0, @1]];
    
    CGAffineTransform affineTransform0 = CGAffineTransformConcat(CGAffineTransformMakeRotation(YTX_RADIAN(0)), CGAffineTransformMakeScale(1.0, 1.0));
    CATransform3D frame0  =  CATransform3DMakeAffineTransform(affineTransform0);
    CGAffineTransform affineTransform1 = CGAffineTransformConcat(CGAffineTransformMakeRotation(YTX_RADIAN(270)), CGAffineTransformMakeScale(0.0, 0.0));
    CATransform3D frame1  =  CATransform3DMakeAffineTransform(affineTransform1);

    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [transform setValues: @[[NSValue valueWithCATransform3D:frame0],[NSValue valueWithCATransform3D:frame1]]];
    [transform setKeyTimes:@[@0, @1]];
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:ANCHORPOINT];
    [anchor setValues:@[YTXPointValue(1, 2),
                        YTXPointValue(2, 5),
                        YTXPointValue(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, @0.99, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    [group setAnimations:@[transform, anchor, opacity]];
    [group setDuration:durationTime];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_magicAnimtionWithDurationTime:"];
    });

    return group;
}


@end
