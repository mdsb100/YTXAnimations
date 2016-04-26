//
//  UIView+YTXMagicCSS.m
//  Pods
//
//  Created by CaoJun on 16/4/23.
//
//

#import "UIView+YTXMagicCSS.h"
#import "YTXAnimationsUtil.h"

@implementation UIView (YTXMagicCSS)

- (nonnull CAAnimation *)ytx_magicAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@1, @0]];
    [opacity setKeyTimes:@[@0, @1]];
    
    CGAffineTransform affineTransform0 = CGAffineTransformConcat(CGAffineTransformMakeRotation([YTXAnimationsUtil radianWithDegree:0]), CGAffineTransformMakeScale(1.0, 1.0));
    CATransform3D frame0  =  CATransform3DMakeAffineTransform(affineTransform0);
    CGAffineTransform affineTransform1 = CGAffineTransformConcat(CGAffineTransformMakeRotation([YTXAnimationsUtil radianWithDegree:270]), CGAffineTransformMakeScale(0.0, 0.0));
    CATransform3D frame1  =  CATransform3DMakeAffineTransform(affineTransform1);

    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues: @[[NSValue valueWithCATransform3D:frame0],[NSValue valueWithCATransform3D:frame1]]];
    [transform setKeyTimes:@[@0, @1]];
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXPOINTVALUE(1, 2),
                        YTXPOINTVALUE(2, 5),
                        YTXPOINTVALUE(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
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
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@0, @1]];
    [opacity setKeyTimes:@[@0, @1]];
    
    CGAffineTransform affineTransform00 = CGAffineTransformConcat(CGAffineTransformMakeRotation([YTXAnimationsUtil radianWithDegree:0]), CGAffineTransformMakeScale(0.0, 0.0));
    CATransform3D frame00  =  CATransform3DMakeAffineTransform(affineTransform00);
    
    CGAffineTransform affineTransform03 = CGAffineTransformConcat(CGAffineTransformMakeRotation([YTXAnimationsUtil radianWithDegree:0]), CGAffineTransformMakeScale(0.0, 0.0));
    CATransform3D frame03  =  CATransform3DMakeAffineTransform(affineTransform03);
    
    CGAffineTransform affineTransform065 = CGAffineTransformConcat(CGAffineTransformMakeRotation([YTXAnimationsUtil radianWithDegree:-180]), CGAffineTransformMakeScale(0.65, 0.65));
    CATransform3D frame065  =  CATransform3DMakeAffineTransform(affineTransform065);
    
    CGAffineTransform affineTransform10 = CGAffineTransformConcat(CGAffineTransformMakeRotation([YTXAnimationsUtil radianWithDegree:-360]), CGAffineTransformMakeScale(1.0, 1.0));
    CATransform3D frame10  =  CATransform3DMakeAffineTransform(affineTransform10);
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues: @[
                            [NSValue valueWithCATransform3D:frame00],
                            [NSValue valueWithCATransform3D:frame03],
                            [NSValue valueWithCATransform3D:frame065],
                            [NSValue valueWithCATransform3D:frame10]]];
    [transform setKeyTimes:@[@0, @0.3, @0.65, @1]];
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXPOINTVALUE(0.0, 1.0),
                        YTXPOINTVALUE(0.0, 1.0),
                        YTXPOINTVALUE(1.0, 1.0),
                        YTXPOINTVALUE(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, @0.3, YTXANCHORLASTKEYTIME, @1]];
    
    CGPoint anchorePoint01 = [YTXAnimationsUtil positionWithAnchorPoint:CGPointMake(0.0, 1.0) andView:self];
    CGPoint anchorePoint11 = [YTXAnimationsUtil positionWithAnchorPoint:CGPointMake(1.0, 1.0) andView:self];
    
    CGFloat y = self.center.y;
    CAKeyframeAnimation *positionY = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITIONY];
    [positionY setValues  :@[@(y + anchorePoint01.y),
                             @(y + anchorePoint01.y),
                             @(y + anchorePoint11.y),
                             @(y)]];
    [positionY setKeyTimes:@[@0, @0.3, YTXANCHORLASTKEYTIME, @1]];
    
    CGFloat x = self.center.x;
    CAKeyframeAnimation *positionX = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITIONX];
    [positionX setValues  :@[@(x + anchorePoint01.x),
                             @(x + anchorePoint01.x),
                             @(x + anchorePoint11.x),
                             @(x)]];
    [positionX setKeyTimes:@[@0, @0.3, YTXANCHORLASTKEYTIME, @1]];
    
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
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@0, @1]];
    [opacity setKeyTimes:@[@0, @1]];
    
    CGAffineTransform affineTransform00 = CGAffineTransformConcat(CGAffineTransformMakeRotation([YTXAnimationsUtil radianWithDegree:0]), CGAffineTransformMakeScale(0.0, 0.0));
    CATransform3D frame00  =  CATransform3DMakeAffineTransform(affineTransform00);
    
    CGAffineTransform affineTransform03 = CGAffineTransformConcat(CGAffineTransformMakeRotation([YTXAnimationsUtil radianWithDegree:0]), CGAffineTransformMakeScale(0.0, 0.0));
    CATransform3D frame03  =  CATransform3DMakeAffineTransform(affineTransform03);
    
    CGAffineTransform affineTransform065 = CGAffineTransformConcat(CGAffineTransformMakeRotation([YTXAnimationsUtil radianWithDegree:-180]), CGAffineTransformMakeScale(0.65, 0.65));
    CATransform3D frame065  =  CATransform3DMakeAffineTransform(affineTransform065);
    
    CGAffineTransform affineTransform10 = CGAffineTransformConcat(CGAffineTransformMakeRotation([YTXAnimationsUtil radianWithDegree:-360]), CGAffineTransformMakeScale(1.0, 1.0));
    CATransform3D frame10  =  CATransform3DMakeAffineTransform(affineTransform10);
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues: @[
                            [NSValue valueWithCATransform3D:frame00],
                            [NSValue valueWithCATransform3D:frame03],
                            [NSValue valueWithCATransform3D:frame065],
                            [NSValue valueWithCATransform3D:frame10]]];
    [transform setKeyTimes:@[@0, @0.3, @0.65, @1]];
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXPOINTVALUE(1.0, 0.0),
                        YTXPOINTVALUE(1.0, 0.0),
                        YTXPOINTVALUE(0.0, 0.0),
                        YTXPOINTVALUE(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, @0.3, YTXANCHORLASTKEYTIME, @1]];
    
    CGPoint anchorePoint10 = [YTXAnimationsUtil positionWithAnchorPoint:CGPointMake(1.0, 0.0) andView:self];
    CGPoint anchorePoint00 = [YTXAnimationsUtil positionWithAnchorPoint:CGPointMake(0.0, 0.0) andView:self];
    
    CGFloat y = self.center.y;
    CAKeyframeAnimation *positionY = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITIONY];
    [positionY setValues  :@[@(y + anchorePoint10.y),
                             @(y + anchorePoint10.y),
                             @(y + anchorePoint00.y),
                             @(y)]];
    [positionY setKeyTimes:@[@0, @0.3, YTXANCHORLASTKEYTIME, @1]];
    
    CGFloat x = self.center.x;
    CAKeyframeAnimation *positionX = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITIONX];
    [positionX setValues  :@[@(x + anchorePoint10.x),
                             @(x + anchorePoint10.x),
                             @(x + anchorePoint00.x),
                             @(0)]];
    [positionX setKeyTimes:@[@0, @0.3, YTXANCHORLASTKEYTIME, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[ anchor, transform, positionY, positionX, opacity ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_twisterInUpAnimtionWithDurationTime:"];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_swapAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@0, @1]];
    [opacity setKeyTimes:@[@0, @1]];
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXPOINTVALUE(0.0, 1.0),
                        YTXPOINTVALUE(0.0, 1.0),
                        YTXPOINTVALUE(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
    
    CGPoint anchorePoint = [YTXAnimationsUtil positionWithAnchorPoint:CGPointMake(0.0, 1.0) andView:self];
    CGFloat y = self.center.y;
    CAKeyframeAnimation *positionY = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITIONY];
    [positionY setValues  :@[@(y + anchorePoint.y),
                             @(y + anchorePoint.y),
                             @(y)]];
    [positionY setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
    CGFloat x = self.center.x;
    CAKeyframeAnimation *positionX = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITIONX];
    [positionX setValues  :@[@(x + anchorePoint.x),
                             @(x + anchorePoint.x - YTXSELFWIDTH*0.618),
                             @(x + anchorePoint.x),
                             @(x)]];
    [positionX setKeyTimes:@[@0, @(0.382), YTXANCHORLASTKEYTIME, @1]];
    
    CATransform3D frame00 = CATransform3DScale(self.layer.transform, 0, 0, 0);
    CATransform3D frame10 = CATransform3DScale(self.layer.transform, 1, 1, 0);
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
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

#pragma mark - Static Effects
- (nonnull CAAnimation *)ytx_openAnimtionWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree:(CGFloat) degree selectorName:(NSString *) selector
{
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXPOINTVALUE(anchor00.x, anchor00.y),
                        YTXPOINTVALUE(anchor10.x, anchor10.y),
                        YTXPOINTVALUE(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
    
    CATransform3D frame00 = CATransform3DRotate(self.layer.transform, [YTXAnimationsUtil radianWithDegree:0], 0, 0, 1);
    CGPoint anchorePoint = [YTXAnimationsUtil positionWithAnchorPoint:anchor00 andView:self];
    
    frame00.m41 = anchorePoint.x;
    frame00.m42 = anchorePoint.y;
    
    CATransform3D frame9999 = CATransform3DRotate(self.layer.transform, [YTXAnimationsUtil radianWithDegree:degree], 0, 0, 1);
    frame9999.m41 = anchorePoint.x;
    frame9999.m42 = anchorePoint.y;
    
    CATransform3D frame10 = CATransform3DRotate(self.layer.transform, [YTXAnimationsUtil radianWithDegree:degree], 0, 0, 1);
    frame10.m41 = 0;
    frame10.m42 = 0;
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues: @[
                            [NSValue valueWithCATransform3D:frame00],
                            [NSValue valueWithCATransform3D:frame9999],
                            [NSValue valueWithCATransform3D:frame10]
                            ]];
    [transform setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
    CAMediaTimingFunction *easeOut = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    CAMediaTimingFunction *easeInOut = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [anchor setTimingFunctions:@[easeOut, easeOut, easeInOut]];
    [transform setTimingFunctions:@[easeOut, easeOut, easeInOut]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[ anchor, transform ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:selector];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_openDownLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0.0, 1.0) ahchore10:CGPointMake(0.0, 1.0) degree:-110 selectorName:@"ytx_openDownLeftAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openDownRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(1.0, 1.0) ahchore10:CGPointMake(1.0, 1.0) degree:110 selectorName:@"ytx_openDownRightAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0.0, 0.0) ahchore10:CGPointMake(0.0, 0.0) degree:110 selectorName:@"ytx_openUpLeftAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(1.0, 0.0) ahchore10:CGPointMake(1.0, 0.0) degree:-110 selectorName:@"ytx_openUpRightAnimtionWithDurationTime:"];
}
@end
