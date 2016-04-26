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

#define OPACITY                                 @"opacity"
#define POSITION                                @"position"
#define POSITION_X                              @"position.x"
#define POSITION_Y                              @"position.y"
#define TRANSFORM                               @"transform"
#define ANCHORPOINT                             @"anchorPoint"

#define anchorLastKeyTime                       @0.9999

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
    [anchor setKeyTimes:@[@0, anchorLastKeyTime, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    [group setAnimations:@[transform, anchor, opacity]];
    [group setDuration:durationTime];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_magicAnimtionWithDurationTime:"];
    });

    return group;
}

- (nonnull CAAnimation *)ytx_twisterInDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [opacity setValues:@[@0, @1]];
    [opacity setKeyTimes:@[@0, @1]];
    
    CGAffineTransform affineTransform00 = CGAffineTransformConcat(CGAffineTransformMakeRotation(YTX_RADIAN(0)), CGAffineTransformMakeScale(0.0, 0.0));
    CATransform3D frame00  =  CATransform3DMakeAffineTransform(affineTransform00);
    
    CGAffineTransform affineTransform03 = CGAffineTransformConcat(CGAffineTransformMakeRotation(YTX_RADIAN(0)), CGAffineTransformMakeScale(0.0, 0.0));
    CATransform3D frame03  =  CATransform3DMakeAffineTransform(affineTransform03);
    
    CGAffineTransform affineTransform065 = CGAffineTransformConcat(CGAffineTransformMakeRotation(-YTX_RADIAN(180)), CGAffineTransformMakeScale(0.65, 0.65));
    CATransform3D frame065  =  CATransform3DMakeAffineTransform(affineTransform065);
    
    CGAffineTransform affineTransform10 = CGAffineTransformConcat(CGAffineTransformMakeRotation(-YTX_RADIAN(360)), CGAffineTransformMakeScale(1.0, 1.0));
    CATransform3D frame10  =  CATransform3DMakeAffineTransform(affineTransform10);
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [transform setValues: @[
                            [NSValue valueWithCATransform3D:frame00],
                            [NSValue valueWithCATransform3D:frame03],
                            [NSValue valueWithCATransform3D:frame065],
                            [NSValue valueWithCATransform3D:frame10]]];
    [transform setKeyTimes:@[@0, @0.3, @0.65, @1]];
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:ANCHORPOINT];
    [anchor setValues:@[YTXPointValue(0.0, 1.0),
                        YTXPointValue(0.0, 1.0),
                        YTXPointValue(1.0, 1.0),
                        YTXPointValue(1.0, 1.0),
                        YTXPointValue(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, @0.3, @0.9998, anchorLastKeyTime, @1]];
    
    CGFloat y = self.center.y;
    CAKeyframeAnimation *positionY = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [positionY setValues  :@[@(y + SELF_HEIGHT*0.5),
                             @(y + SELF_HEIGHT*0.5),
                             @(y + SELF_HEIGHT*0.65 - SELF_HEIGHT * 0.25 ),
                             @(y + SELF_HEIGHT - SELF_HEIGHT * 0.5 ), @(y)]];
    [positionY setKeyTimes:@[@0, @0.3, @0.65, anchorLastKeyTime, @1]];
    
    CGFloat x = self.center.x;
    CAKeyframeAnimation *positionX = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [positionX setValues  :@[@(x - SELF_WIDTH*0.5),
                             @(x - SELF_WIDTH*0.5),
                             @(x + SELF_WIDTH*0.5),
                             @(x + SELF_WIDTH * 0.5),
                             @(x)]];
    [positionX setKeyTimes:@[@0, @0.3, @0.65, anchorLastKeyTime, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[ anchor, transform, positionY, positionX, opacity ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_twisterInDownAnimtionWithDurationTime:"];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_twisterInUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [opacity setValues:@[@0, @1]];
    [opacity setKeyTimes:@[@0, @1]];
    
    CGAffineTransform affineTransform00 = CGAffineTransformConcat(CGAffineTransformMakeRotation(YTX_RADIAN(0)), CGAffineTransformMakeScale(0.0, 0.0));
    CATransform3D frame00  =  CATransform3DMakeAffineTransform(affineTransform00);
    
    CGAffineTransform affineTransform03 = CGAffineTransformConcat(CGAffineTransformMakeRotation(YTX_RADIAN(0)), CGAffineTransformMakeScale(0.0, 0.0));
    CATransform3D frame03  =  CATransform3DMakeAffineTransform(affineTransform03);
    
    CGAffineTransform affineTransform065 = CGAffineTransformConcat(CGAffineTransformMakeRotation(-YTX_RADIAN(180)), CGAffineTransformMakeScale(0.65, 0.65));
    CATransform3D frame065  =  CATransform3DMakeAffineTransform(affineTransform065);
    
    CGAffineTransform affineTransform10 = CGAffineTransformConcat(CGAffineTransformMakeRotation(-YTX_RADIAN(360)), CGAffineTransformMakeScale(1.0, 1.0));
    CATransform3D frame10  =  CATransform3DMakeAffineTransform(affineTransform10);
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [transform setValues: @[
                            [NSValue valueWithCATransform3D:frame00],
                            [NSValue valueWithCATransform3D:frame03],
                            [NSValue valueWithCATransform3D:frame065],
                            [NSValue valueWithCATransform3D:frame10]]];
    [transform setKeyTimes:@[@0, @0.3, @0.65, @1]];
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:ANCHORPOINT];
    [anchor setValues:@[YTXPointValue(1.0, 0.0),
                        YTXPointValue(1.0, 0.0),
                        YTXPointValue(0.0, 0.0),
                        YTXPointValue(0.0, 0.0),
                        YTXPointValue(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, @0.3, @0.9998, anchorLastKeyTime, @1]];
    
    CGFloat y = self.center.y;
    CAKeyframeAnimation *positionY = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [positionY setValues  :@[@(y - SELF_HEIGHT*0.5),
                             @(y - SELF_HEIGHT*0.5),
                             @(y - SELF_HEIGHT*0.65 + SELF_HEIGHT * 0.25 ),
                             @(y - SELF_HEIGHT + SELF_HEIGHT * 0.5 ),
                             @(y)]];
    [positionY setKeyTimes:@[@0, @0.3, @0.65, anchorLastKeyTime, @1]];
    
    CGFloat x = self.center.x;
    CAKeyframeAnimation *positionX = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [positionX setValues  :@[@(x + SELF_WIDTH*0.5),
                             @(x + SELF_WIDTH*0.5),
                             @(x),
                             @(x - SELF_WIDTH*0.5),
                             @(x - SELF_WIDTH*0.5), @(0)]];
    [positionX setKeyTimes:@[@0, @0.3, @0.65, anchorLastKeyTime, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[ anchor, transform, positionY, positionX, opacity ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_twisterInDownAnimtionWithDurationTime:"];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_swapAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:OPACITY];
    [opacity setValues:@[@0, @1]];
    [opacity setKeyTimes:@[@0, @1]];
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:ANCHORPOINT];
    [anchor setValues:@[YTXPointValue(0.0, 1.0),
                        YTXPointValue(0.0, 1.0),
                        YTXPointValue(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, anchorLastKeyTime, @1]];
    
    CGFloat y = self.center.y;
    CAKeyframeAnimation *positionY = [CAKeyframeAnimation animationWithKeyPath:POSITION_Y];
    [positionY setValues  :@[@(y + SELF_HEIGHT*0.5), @(y + SELF_HEIGHT*0.5), @(y)]];
    [positionY setKeyTimes:@[@0, anchorLastKeyTime, @1]];
    
    CGFloat x = self.center.x;
    CAKeyframeAnimation *positionX = [CAKeyframeAnimation animationWithKeyPath:POSITION_X];
    [positionX setValues  :@[@(x - SELF_WIDTH*0.5),
                             @(x - SELF_WIDTH*0.5 - SELF_WIDTH*0.618),
                             @(x - SELF_WIDTH*0.5),
                             @(x)]];
    [positionX setKeyTimes:@[@0, @(0.382), anchorLastKeyTime, @1]];
    
    CATransform3D frame00 = CATransform3DScale(self.layer.transform, 0, 0, 0);
    CATransform3D frame10 = CATransform3DScale(self.layer.transform, 1, 1, 0);
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:TRANSFORM];
    [transform setValues: @[
                            [NSValue valueWithCATransform3D:frame00],
                            [NSValue valueWithCATransform3D:frame10]
                            ]];
    [transform setKeyTimes:@[@0, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[ anchor, positionY, positionX, transform ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_swapAnimtionWithDurationTime:"];
    });
    
    return group;
}

@end
