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

- (nonnull CAAnimation *)ytx_magicAnimationWithDurationTime:(NSTimeInterval)durationTime
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
        [self.layer addAnimation:group forKey:@"ytx_magicAnimationWithDurationTime:"];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_twisterInDownAnimationWithDurationTime:(NSTimeInterval)durationTime
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
    
    CGPoint anchorPoint00 = CGPointMake(0.0, 1.0);
    CGPoint anchorPoint03 = CGPointMake(0.0, 1.0);
    CGPoint anchorPoint05 = CGPointMake(1.0, 1.0);
    CGPoint anchorPoint10 = CGPointMake(0.5, 1.5);
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXCGPOINTVALUE(anchorPoint00),
                        YTXCGPOINTVALUE(anchorPoint03),
                        YTXCGPOINTVALUE(anchorPoint05),
                        YTXCGPOINTVALUE(anchorPoint10)]];
    [anchor setKeyTimes:@[@0, @0.3, YTXANCHORLASTKEYTIME, @1]];
    
    CAKeyframeAnimation *positionY = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITION];
    [positionY setValues  :@[
                             YTXANCHORPOINTVALUE(anchorPoint00),
                             YTXANCHORPOINTVALUE(anchorPoint03),
                             YTXANCHORPOINTVALUE(anchorPoint05),
                             YTXANCHORPOINTVALUE(anchorPoint10)
                             ]];
    [positionY setKeyTimes:@[@0, @0.3, YTXANCHORLASTKEYTIME, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[anchor, transform, positionY, opacity ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_twisterInDownAnimationWithDurationTime:"];
    });
    
    return group;
}
- (nonnull CAAnimation *)ytx_twisterInUpAnimationWithDurationTime:(NSTimeInterval)durationTime
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
    
    CGPoint anchorPoint00 = CGPointMake(1.0, 0.0);
    CGPoint anchorPoint03 = CGPointMake(1.0, 0.0);
    CGPoint anchorPoint05 = CGPointMake(0.0, 0.0);
    CGPoint anchorPoint10 = CGPointMake(0.5, 1.5);
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXCGPOINTVALUE(anchorPoint00),
                        YTXCGPOINTVALUE(anchorPoint03),
                        YTXCGPOINTVALUE(anchorPoint05),
                        YTXCGPOINTVALUE(anchorPoint10)]];
    [anchor setKeyTimes:@[@0, @0.3, YTXANCHORLASTKEYTIME, @1]];
    
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITION];
    [position setValues  :@[YTXANCHORPOINTVALUE(anchorPoint00),
                            YTXANCHORPOINTVALUE(anchorPoint03),
                            YTXANCHORPOINTVALUE(anchorPoint05),
                            YTXANCHORPOINTVALUE(anchorPoint10),
                            ]];
    [position setKeyTimes:@[@0, @0.3, YTXANCHORLASTKEYTIME, @1]];
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[ anchor, transform, position, opacity ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_twisterInUpAnimationWithDurationTime:"];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_swapAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@0, @1]];
    [opacity setKeyTimes:@[@0, @1]];
    
    CGPoint anchorPoint00 = CGPointMake(0.0, 1.0);
    CGPoint anchorPoint05 = CGPointMake(0.0, 1.0);
    CGPoint anchorPoint10 = CGPointMake(0.5, 0.5);
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXCGPOINTVALUE(anchorPoint00),
                        YTXCGPOINTVALUE(anchorPoint05),
                        YTXCGPOINTVALUE(anchorPoint10)]];
    [anchor setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
    CGPoint position05 = [YTXAnimationsUtil positionWithAnchorPoint:anchorPoint00 andView:self];
    position05.x -= YTXSELFWIDTH;
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITION];
    [position setValues  :@[YTXANCHORPOINTVALUE(anchorPoint00),
                            YTXCGPOINTVALUE(position05),
                            YTXANCHORPOINTVALUE(anchorPoint05),
                            YTXANCHORPOINTVALUE(anchorPoint10),
                            ]];
    [position setKeyTimes:@[@0, @0.382, YTXANCHORLASTKEYTIME, @1]];
    
    CATransform3D frame00 = CATransform3DScale(CATransform3DIdentity, 0, 0, 0);
    CATransform3D frame10 = CATransform3DScale(CATransform3DIdentity, 1, 1, 0);
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues: @[
                            [NSValue valueWithCATransform3D:frame00],
                            [NSValue valueWithCATransform3D:frame10]
                            ]];
    [transform setKeyTimes:@[@0, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[anchor, position, transform]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_swapAnimationWithDurationTime:"];
    });
    
    return group;
}

#pragma mark - Static Effects

- (nonnull CAAnimation *)ytx_openAnimationWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 animationName:(nonnull NSString *) name
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:anchor00 ahchore10:anchor10 degree00:degree00 degree10:degree10 opacity00:1 opacity10:1 animationName:name];
}
- (nonnull CAAnimation *)ytx_openAnimationWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 opacity00:(CGFloat)opacity00 opacity10:(CGFloat)opacity10 animationName:(nonnull NSString *) name
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@(opacity00), @(opacity10)]];
    [opacity setKeyTimes:@[@0, @1]];
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXCGPOINTVALUE(anchor00),
                        YTXCGPOINTVALUE(anchor10),
                        YTXPOINTVALUE(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
    CATransform3D frame00 = CATransform3DRotate(CATransform3DIdentity, [YTXAnimationsUtil radianWithDegree:degree00], 0, 0, 1);
    CGPoint anchorePoint00 = [YTXAnimationsUtil offsetWithAnchorPoint:anchor00 andView:self];
    
    frame00.m41 = anchorePoint00.x;
    frame00.m42 = anchorePoint00.y;
    
    CATransform3D frame9999 = CATransform3DRotate(CATransform3DIdentity, [YTXAnimationsUtil radianWithDegree:degree10], 0, 0, 1);
    CGPoint anchorePoint10 = [YTXAnimationsUtil offsetWithAnchorPoint:anchor10 andView:self];
    
    frame9999.m41 = anchorePoint10.x;
    frame9999.m42 = anchorePoint10.y;
    
    CATransform3D frame10 = CATransform3DRotate(CATransform3DIdentity, [YTXAnimationsUtil radianWithDegree:degree10], 0, 0, 1);
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
    [group setAnimations:@[ anchor, transform, opacity ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:name];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_openDownLeftAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(0.0, 1.0) ahchore10:CGPointMake(0.0, 1.0) degree00:0 degree10:-110 animationName:@"ytx_openDownLeftAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openDownRightAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(1.0, 1.0) ahchore10:CGPointMake(1.0, 1.0) degree00:0 degree10:110 animationName:@"ytx_openDownRightAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpLeftAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(0.0, 0.0) ahchore10:CGPointMake(0.0, 0.0) degree00:0 degree10:110 animationName:@"ytx_openUpLeftAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpRightAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(1.0, 0.0) ahchore10:CGPointMake(1.0, 0.0) degree00:0 degree10:-110 animationName:@"ytx_openUpRightAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openDownLeftRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(0.0, 1.0) ahchore10:CGPointMake(0.0, 1.0) degree00:-110 degree10:0 animationName:@"ytx_openDownLeftRetournAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openDownRightRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(1.0, 1.0) ahchore10:CGPointMake(1.0, 1.0) degree00:110 degree10:0 animationName:@"ytx_openDownRightRetournAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpLeftRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(0.0, 0.0) ahchore10:CGPointMake(0.0, 0.0) degree00:110 degree10:0 animationName:@"ytx_openUpLeftRetournAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpRightRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(1.0, 0.0) ahchore10:CGPointMake(1.0, 0.0) degree00:-110 degree10:0 animationName:@"ytx_openUpRightRetournAnimationWithDurationTime:"];
}

#pragma mark - Static Effects Out
- (nonnull CAAnimation *)ytx_openDownLeftOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(0.0, 1.0) ahchore10:CGPointMake(0.0, 1.0) degree00:0 degree10:-110 opacity00:1 opacity10:0 animationName:@"ytx_openDownLeftOutAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openDownRightOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(1.0, 1.0) ahchore10:CGPointMake(1.0, 1.0) degree00:0 degree10:110 opacity00:1 opacity10:0 animationName:@"ytx_openDownRightOutAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpLeftOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(0.0, 0.0) ahchore10:CGPointMake(0.0, 0.0) degree00:0 degree10:110 opacity00:1 opacity10:0 animationName:@"ytx_openUpLeftOutAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpRightOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimationWithDurationTime:durationTime anchor00:CGPointMake(1.0, 0.0) ahchore10:CGPointMake(1.0, 0.0) degree00:0 degree10:-110 opacity00:1 opacity10:0 animationName:@"ytx_openUpRightOutAnimationWithDurationTime:"];
}

#pragma mark - Perspective

- (nonnull CAAnimation *)ytx_perspectiveAnimationWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 rotateX:(CGFloat)rotateX rotateY:(CGFloat)rotateY animationName:(nonnull NSString *) name
{
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXPOINTVALUE(anchor00.x, anchor00.y),
                        YTXPOINTVALUE(anchor10.x, anchor10.y),
                        YTXPOINTVALUE(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
    CATransform3D currentTransform         = CATransform3DIdentity;
    currentTransform.m34                   = - 1 / 400.0;
    
    CATransform3D frame00 = CATransform3DRotate(currentTransform, [YTXAnimationsUtil radianWithDegree:degree00], rotateX, rotateY, 0);
    CGPoint anchorePoint00 = [YTXAnimationsUtil offsetWithAnchorPoint:anchor00 andView:self];
    
    frame00.m41 = anchorePoint00.x;
    frame00.m42 = anchorePoint00.y;
    
    CATransform3D frame9999 = CATransform3DRotate(currentTransform, [YTXAnimationsUtil radianWithDegree:degree10], rotateX, rotateY, 0);
    CGPoint anchorePoint10 = [YTXAnimationsUtil offsetWithAnchorPoint:anchor10 andView:self];
    
    frame9999.m41 = anchorePoint10.x;
    frame9999.m42 = anchorePoint10.y;
    
    CATransform3D frame10 = CATransform3DRotate(currentTransform, [YTXAnimationsUtil radianWithDegree:degree10], rotateX, rotateY, 0);
    frame10.m41 = 0;
    frame10.m42 = 0;
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues: @[
                            [NSValue valueWithCATransform3D:frame00],
                            [NSValue valueWithCATransform3D:frame9999],
                            [NSValue valueWithCATransform3D:frame10]
                            ]];
    [transform setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[ anchor, transform ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:name];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_perspectiveDownAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimationWithDurationTime:durationTime anchor00:CGPointMake(0, 1) ahchore10:CGPointMake(0, 1) degree00:0 degree10:-180 rotateX:-1 rotateY:0 animationName:@"ytx_perspectiveDownAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveUpAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimationWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0, 0) degree00:0.0001 degree10:180 rotateX:1 rotateY:0 animationName:@"ytx_perspectiveUpAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveLeftAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimationWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0, 0) degree00:0 degree10:-180 rotateX:0 rotateY:-1 animationName:@"ytx_perspectiveLeftAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveRightAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimationWithDurationTime:durationTime anchor00:CGPointMake(1, 0) ahchore10:CGPointMake(1, 0) degree00:0.0001 degree10:180 rotateX:0 rotateY:1 animationName:@"ytx_perspectiveRightAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveDownRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimationWithDurationTime:durationTime anchor00:CGPointMake(0, 1) ahchore10:CGPointMake(0, 1) degree00:-180 degree10:0 rotateX:-1 rotateY:0 animationName:@"ytx_perspectiveDownRetournAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveUpRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimationWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0, 0) degree00:180 degree10:0.0001 rotateX:1 rotateY:0 animationName:@"ytx_perspectiveUpRetournAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveLeftRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimationWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0, 0) degree00:-180 degree10:0 rotateX:0 rotateY:-1 animationName:@"ytx_perspectiveLeftRetournAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveRightRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimationWithDurationTime:durationTime anchor00:CGPointMake(1, 0) ahchore10:CGPointMake(1, 0) degree00:180 degree10:0.0001 rotateX:0 rotateY:1 animationName:@"ytx_perspectiveRightRetournAnimationWithDurationTime:"];
}

#pragma mark - Rotate
- (nonnull CAAnimation *)ytx_rotateAnimationWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10  rotateX:(CGFloat)rotateX rotateY:(CGFloat)rotateY opacity00:(CGFloat)opacity00 opacity10:(CGFloat)opacity10 translateX:(CGFloat)translateX translateY:(CGFloat)translateY translateZ:(CGFloat)translateZ animationName:(nonnull NSString *) name
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@(opacity00), @(opacity10)]];
    [opacity setKeyTimes:@[@0, @1]];
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXPOINTVALUE(anchor00.x, anchor00.y),
                        YTXPOINTVALUE(anchor10.x, anchor10.y),
                        YTXPOINTVALUE(0.5, 0.5)]];
    [anchor setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
    CATransform3D currentTransform         = CATransform3DIdentity;
    currentTransform.m34                   = - 1 / 400.0;
    
    CGPoint anchorePoint00 = [YTXAnimationsUtil offsetWithAnchorPoint:anchor00 andView:self];
    CATransform3D frame00 = CATransform3DRotate(currentTransform, [YTXAnimationsUtil radianWithDegree:degree00], rotateX, rotateY, 0);
    frame00 = CATransform3DTranslate(frame00, 0, 0, 0);
    
    frame00.m41 = anchorePoint00.x;
    frame00.m42 = anchorePoint00.y;
    frame00.m43 = 0;
    
    CGPoint anchorePoint10 = [YTXAnimationsUtil offsetWithAnchorPoint:anchor10 andView:self];
    CATransform3D frame9999 = CATransform3DRotate(currentTransform, [YTXAnimationsUtil radianWithDegree:degree10], rotateX, rotateY, 0);
    frame9999 = CATransform3DTranslate(frame9999, 0, 0, translateZ);
    
    frame9999.m41 = anchorePoint10.x + translateX;
    frame9999.m42 = anchorePoint10.y + translateY;
    frame9999.m43 = translateZ;
    
    CATransform3D frame10 = CATransform3DRotate(currentTransform, [YTXAnimationsUtil radianWithDegree:degree10], rotateX, rotateY, 0);
    frame10 = CATransform3DTranslate(frame10, 0, 0, translateZ);
    frame10.m41 =   translateX;
    frame10.m42 =   translateY;
    frame9999.m43 = translateZ;
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues: @[
                            [NSValue valueWithCATransform3D:frame00],
                            [NSValue valueWithCATransform3D:frame9999],
                            [NSValue valueWithCATransform3D:frame10]
                            ]];
    [transform setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[ anchor, transform, opacity ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:name];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_rotateDownAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimationWithDurationTime:durationTime anchor00:CGPointMake(0, 1) ahchore10:CGPointMake(0, 1) degree00:0 degree10:-180 rotateX:-1 rotateY:0 opacity00:1 opacity10:0 translateX:0 translateY:YTXSELFHEIGHT translateZ:150 animationName:@"ytx_rotateDownAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_rotateUpAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimationWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0.5, 0) degree00:0.0001 degree10:180.0 rotateX:1 rotateY:0 opacity00:1 opacity10:0 translateX:0 translateY:-YTXSELFHEIGHT translateZ:150 animationName:@"ytx_rotateUpAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_rotateLeftAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimationWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0.5, 0) degree00:0 degree10:-180 rotateX:0 rotateY:-1 opacity00:1 opacity10:0 translateX:-YTXSELFWIDTH*1.5 translateY:0 translateZ:150 animationName:@"ytx_rotateLeftAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_rotateRightAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimationWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0.5, 0) degree00:0.0001 degree10:180 rotateX:0 rotateY:1 opacity00:1 opacity10:0 translateX:YTXSELFWIDTH*2 translateY:0 translateZ:150 animationName:@"ytx_rotateRightAnimationWithDurationTime:"];
}
#pragma mark - Slide
- (nonnull CAAnimation *)ytx_slideAnimationWithDurationTime:(NSTimeInterval)durationTime isIn:(BOOL)isIn translateValues:(nonnull NSArray *)translateValues animationName:(nonnull NSString *) name
{
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues:translateValues];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[transform]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:name];
    });
    return group;
}

- (nonnull CAAnimation *)ytx_slideDownAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimationWithDurationTime:durationTime
                                              isIn:NO
                                   translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                     YTXTRANSLATEVALUE(0, YTXSELFHEIGHT, 0)]
                                     animationName:@"ytx_slideDownAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideLeftAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimationWithDurationTime:durationTime
                                              isIn:NO
                                   translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                     YTXTRANSLATEVALUE(-YTXSELFWIDTH, 0, 0)]
                                     animationName:@"ytx_slideLeftAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideRightAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimationWithDurationTime:durationTime
                                              isIn:NO
                                   translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                     YTXTRANSLATEVALUE(YTXSELFWIDTH, 0, 0)]
                                     animationName:@"ytx_slideRightAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideUpAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimationWithDurationTime:durationTime
                                              isIn:NO
                                   translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                     YTXTRANSLATEVALUE(0, -YTXSELFHEIGHT, 0)]
                                     animationName:@"ytx_slideUpAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideDownRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimationWithDurationTime:durationTime
                                              isIn:YES
                                   translateValues:@[YTXTRANSLATEVALUE(0, YTXSELFHEIGHT, 0),
                                                     YTXTRANSLATEVALUE(0, 0, 0)]
                                     animationName:@"ytx_slideDownRetournAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideLeftRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimationWithDurationTime:durationTime
                                              isIn:YES
                                   translateValues:@[YTXTRANSLATEVALUE(-YTXSELFWIDTH, 0, 0),
                                                     YTXTRANSLATEVALUE(0, 0, 0)]
                                     animationName:@"ytx_slideLeftRetournAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideRightRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimationWithDurationTime:durationTime
                                              isIn:YES
                                   translateValues:@[YTXTRANSLATEVALUE(YTXSELFWIDTH, 0, 0),
                                                     YTXTRANSLATEVALUE(0, 0, 0)]
                                     animationName:@"ytx_slideRightRetournAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideUpRetournAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimationWithDurationTime:durationTime
                                              isIn:YES
                                   translateValues:@[YTXTRANSLATEVALUE(0, -YTXSELFHEIGHT, 0),
                                                     YTXTRANSLATEVALUE(0, 0, 0)]
                                     animationName:@"ytx_slideUpRetournAnimationWithDurationTime:"];
}

#pragma mark - Math
- (nonnull CAAnimation *)ytx_swashOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    NSArray * keyTimes = @[@0, @0.8, @1];
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@1, @1, @0]];
    [opacity setKeyTimes:keyTimes];
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues: @[
                            YTXSCALEVALUE(1.0, 1.0, 0.0),
                            YTXSCALEVALUE(0.9, 0.9, 0.0),
                            YTXSCALEVALUE(0.0, 0.0, 0.0)
                            ]];
    [transform setKeyTimes:keyTimes];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[ transform, opacity ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_swashOutAnimationWithDurationTime:"];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_swashInAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    NSArray * keyTimes = @[@0, @0.2, @1];
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@0, @1, @1]];
    [opacity setKeyTimes:keyTimes];
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues: @[
                            YTXSCALEVALUE(0.0, 0.0, 0.0),
                            YTXSCALEVALUE(0.9, 0.9, 0.0),
                            YTXSCALEVALUE(1.0, 1.0, 0.0)
                            ]];
    [transform setKeyTimes:keyTimes];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[ transform, opacity ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_swashInAnimationWithDurationTime:"];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_foolishAnimationWithDurationTime:(NSTimeInterval)durationTime anchorPointArray:(nonnull NSArray *) anchorPointArray opacityArray:(nonnull NSArray *) opacityArray scaleArray:(nonnull NSArray *) scaleArray animationName:(nonnull NSString *) name
{
    NSArray * keyTimes  = @[@0, @0.1, @0.2, @0.4, @0.6, @0.8, @1];
    
    NSArray * rotateZArray = @[@0, @(180), @(-359.9999), @(0), @0, @0, @0];
    
    NSUInteger count = rotateZArray.count;
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:opacityArray];
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:anchorPointArray];
    [anchor setKeyTimes:keyTimes];
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    
    NSMutableArray * frameArray = [NSMutableArray array];
    
    for (int index = 0; index < count; index++ ) {
        CGFloat rotateValue = [YTXAnimationsUtil radianWithDegree:[rotateZArray[index] floatValue] ];
        CGPoint scalePoint  = [scaleArray[index] CGPointValue];
        CGPoint anchorPoint = [anchorPointArray[index] CGPointValue];
        
        CGAffineTransform rorateAndScaleAffineFrame = CGAffineTransformConcat(CGAffineTransformScale(CGAffineTransformIdentity, scalePoint.x, scalePoint.y), CGAffineTransformRotate(CGAffineTransformIdentity, rotateValue));
        
        CGPoint anchorePointOffset = [YTXAnimationsUtil offsetWithAnchorPoint:anchorPoint andView:self];
        rorateAndScaleAffineFrame.tx = anchorePointOffset.x;
        rorateAndScaleAffineFrame.ty = anchorePointOffset.y;
        
        NSValue * trasformValue = [NSValue valueWithCATransform3D:CATransform3DMakeAffineTransform(rorateAndScaleAffineFrame)];
        [frameArray addObject:trasformValue];
    }
    [transform setValues:frameArray];
    [transform setKeyTimes:keyTimes];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[ transform, anchor, opacity ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:name];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_foolishOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_foolishAnimationWithDurationTime:durationTime
                                    anchorPointArray:@[YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.25, 0.25), YTXPOINTVALUE(0.0, 0.0), YTXPOINTVALUE(1.0, 0.0), YTXPOINTVALUE(0.0, 0.5), YTXPOINTVALUE(0.0, 1.0), YTXPOINTVALUE(0.5, 0.5)]
                                        opacityArray:@[@1, @1, @1, @1, @1, @0]
                                          scaleArray:@[YTXPOINTVALUE(1.0, 1.0), YTXPOINTVALUE(0.75, 0.75), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.0, 0.0)]
                                       animationName:@"ytx_foolishOutAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_foolishInAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_foolishAnimationWithDurationTime:durationTime
                                    anchorPointArray:@[YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.25, 0.5), YTXPOINTVALUE(0.0, 1.0), YTXPOINTVALUE(1.0, 1.0), YTXPOINTVALUE(0.0, 0.5), YTXPOINTVALUE(0.0, 0.0), YTXPOINTVALUE(0.5, 0.5)]
                                        opacityArray:@[@0, @1, @1, @1, @1, @1]
                                          scaleArray:@[YTXPOINTVALUE(0.0, 0.0), YTXPOINTVALUE(0.25, 0.25), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(1.0, 1.0)]
                                       animationName:@"ytx_foolishInAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_holeOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@1, @0.5, @0]];
    [opacity setKeyTimes: @[@0, @0.5, @1]];
    
    CATransform3D frame00  = CATransform3DIdentity;
    
    CATransform3D frame05 = CATransform3DConcat(CATransform3DMakeRotation([YTXAnimationsUtil radianWithDegree:-90], 0, 1, 0), CATransform3DMakeScale(0.5, 0.5, 0));
    
    CATransform3D frame09 = CATransform3DConcat(CATransform3DMakeRotation([YTXAnimationsUtil radianWithDegree:-162], 0, 1, 0), CATransform3DMakeScale(0.1, 0.1, 0));
    
    CATransform3D frame9999 = CATransform3DConcat(CATransform3DMakeRotation([YTXAnimationsUtil radianWithDegree:-179.9999], 0, 1, 0), CATransform3DMakeScale(0.0001, 0.0001, 0));
    
    CATransform3D frame10 = CATransform3DConcat(CATransform3DMakeRotation([YTXAnimationsUtil radianWithDegree:-180], 0, 1, 0), CATransform3DMakeScale(0, 0, 0));
    
    CAKeyframeAnimation *transform = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [transform setValues: @[[NSValue valueWithCATransform3D:frame00],
                            [NSValue valueWithCATransform3D:frame05],
                            [NSValue valueWithCATransform3D:frame09],
                            [NSValue valueWithCATransform3D:frame9999],
                            [NSValue valueWithCATransform3D:frame10]]];
    [transform setKeyTimes:@[@0, @0.5, @0.9, YTXANCHORLASTKEYTIME, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    [group setAnimations:@[transform]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_holeOutAnimationWithDurationTime:"];
    });
    
    return group;
}



#pragma mark - Tin  
- (nonnull CAAnimation *)ytx_tinDownInAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_tinAnimationWithSelectName:@"ytx_tinDownInAnimationWithDurationTime:"
                                          isIn:YES
                                     isForward:NO
                                    isVertical:YES
                                  durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_tinLeftInAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_tinAnimationWithSelectName:@"ytx_tinLeftInAnimationWithDurationTime:"
                                          isIn:YES
                                     isForward:NO
                                    isVertical:NO
                                  durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_tinRightInAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_tinAnimationWithSelectName:@"ytx_tinRightInAnimationWithDurationTime:"
                                          isIn:YES
                                     isForward:YES
                                    isVertical:NO
                                  durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_tinUpInAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_tinAnimationWithSelectName:@"ytx_tinUpInAnimationWithDurationTime:"
                                          isIn:YES
                                     isForward:YES
                                    isVertical:YES
                                  durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_tinDownOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_tinAnimationWithSelectName:@"ytx_tinDownOutAnimationWithDurationTime:"
                                          isIn:NO
                                     isForward:NO
                                    isVertical:YES
                                  durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_tinLeftOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_tinAnimationWithSelectName:@"ytx_tinLeftOutAnimationWithDurationTime:"
                                          isIn:NO
                                     isForward:NO
                                    isVertical:NO
                                  durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_tinRightOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_tinAnimationWithSelectName:@"ytx_tinRightOutAnimationWithDurationTime:"
                                          isIn:NO
                                     isForward:YES
                                    isVertical:NO
                                  durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_tinUpOutAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_tinAnimationWithSelectName:@"ytx_tinUpOutAnimationWithDurationTime:"
                                          isIn:NO
                                     isForward:YES
                                    isVertical:YES
                                  durationTime:durationTime];
}

- (nonnull CAAnimation *)ytx_tinAnimationWithSelectName:(NSString *)selectName isIn:(BOOL)isIn isForward:(BOOL)isForward isVertical:(BOOL)isVertical durationTime:(NSTimeInterval)durationTime
{
    // isForward 是否up或right
    float    forwardNum  = isForward  ? 1 : -1;
    CGFloat  centerValue = isVertical ? self.center.y : self.center.x;
    NSString *keyPath    = isVertical ? YTXPOSITIONY : YTXPOSITIONX;
    NSNumber *value_1 = @(forwardNum * 900 + centerValue);
    NSArray *opacityArray;
    NSArray *tinArray;
    NSArray *scaleTimeArray;
    NSArray *timeArray;
    if (isIn) {
        opacityArray = @[@0, @1];
        tinArray = @[value_1, @(centerValue)];
        scaleTimeArray = @[@0, @.5, @.6, @.7, @.8, @.9, @1];
        timeArray = @[@0, @.5];
    }
    else {
        opacityArray = @[@1, @0];
        tinArray = @[@(centerValue), value_1];
        scaleTimeArray = @[@0, @.1, @.2, @.3, @.4, @.5, @.6];
        timeArray = @[@0.5, @1];
    }
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:opacityArray];
    [opacity setKeyTimes:timeArray];
    
    CAKeyframeAnimation *tin = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    [tin setKeyTimes:timeArray];
    [tin setValues:tinArray];
    
    CAKeyframeAnimation *scale = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    [scale setValues:@[YTXSCALEVALUE(1.0, 1.0, 0.0),
                       YTXSCALEVALUE(1.1, 1.1, 0.0),
                       YTXSCALEVALUE(1.0, 1.0, 0.0),
                       YTXSCALEVALUE(1.1, 1.1, 0.0),
                       YTXSCALEVALUE(1.0, 1.0, 0.0),
                       YTXSCALEVALUE(1.1, 1.1, 0.0),
                       YTXSCALEVALUE(1.0, 1.0, 0.0),
                       ]];
    [scale setKeyTimes:scaleTimeArray];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity, tin, scale]];
    [group setDuration:durationTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:selectName];
    });
    return group;
}

#pragma mark - Boing

- (nonnull CAAnimation *)ytx_boingInUpAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    CATransform3D transform         = CATransform3DIdentity;
    transform.m34                   = - 1 / 400.0;
    
    CAKeyframeAnimation *animation  = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    
    CATransform3D frame0  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-90], 1, 0, 0);
    CATransform3D frame5  = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:50],  1, 0, 0);
    CATransform3D frame10 = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:-0],  1, 0, 0);
    
    animation.keyTimes        = @[@(0), @(0.5), @(1)];
    
    animation.values = [NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:frame0],
                        [NSValue valueWithCATransform3D:frame5],
                        [NSValue valueWithCATransform3D:frame10],
                        nil];
    
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@0.0, @1.0]];
    [opacity setKeyTimes:@[@0.0, @0.5]];
    
    CGPoint anchorPoint00 = CGPointMake(0.5, 0.0);
    CGPoint anchorPoint10 = CGPointMake(0.5, 0.5);
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXCGPOINTVALUE(anchorPoint00),
                        YTXCGPOINTVALUE(anchorPoint00),
                        YTXCGPOINTVALUE(anchorPoint10)]];
    [anchor setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITION];
    [position setValues  :@[
                             YTXANCHORPOINTVALUE(anchorPoint00),
                             YTXANCHORPOINTVALUE(anchorPoint00),
                             YTXANCHORPOINTVALUE(anchorPoint10)
                             ]];
    [position setKeyTimes:@[@0, YTXANCHORLASTKEYTIME, @1]];
    

    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity, animation, position, anchor]];
    [group setDuration:durationTime];
 
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_boingInUpAnimationWithDurationTime:"];
    });
    return group;
}

- (nonnull CAAnimation *)ytx_boingOutDownAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    CATransform3D transform         = CATransform3DIdentity;
    transform.m34                   = - 1 / 400.0;
    
    CAKeyframeAnimation *animation  = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    
    CATransform3D frame00 = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:0],  0, 1, 0);
    CATransform3D frame02 = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:10], 0, 1, 0);
    CATransform3D frame03 = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:0],  0, 1, 0);
    CATransform3D frame04 = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:10], 1, 1, 0);
    CATransform3D frame10 = CATransform3DRotate(transform, [YTXAnimationsUtil radianWithDegree:90], 1, 0, 0);
    
    animation.keyTimes    = @[@0, @0.2, @0.3, @0.4, @1];
    
    animation.values = @[
                        [NSValue valueWithCATransform3D:frame00],
                        [NSValue valueWithCATransform3D:frame02],
                        [NSValue valueWithCATransform3D:frame03],
                        [NSValue valueWithCATransform3D:frame04],
                        [NSValue valueWithCATransform3D:frame10]
                        ];
    
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:@[@1, @0.0]];
    [opacity setKeyTimes:@[@0.4, @1]];
    
    CGPoint anchorPoint00 = CGPointMake(1.0, 1.0);
    CGPoint anchorPoint02 = CGPointMake(1.0, 1.0);
    CGPoint anchorPoint03 = CGPointMake(0.0, 1.0);
    CGPoint anchorPoint04 = CGPointMake(0.0, 1.0);
    CGPoint anchorPoint9999 = CGPointMake(1.0, 1.0);
    CGPoint anchorPoint10 = CGPointMake(0.5, 0.5);
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXCGPOINTVALUE(anchorPoint00),
                        YTXCGPOINTVALUE(anchorPoint02),
                        YTXCGPOINTVALUE(anchorPoint03),
                        YTXCGPOINTVALUE(anchorPoint04),
                        YTXCGPOINTVALUE(anchorPoint9999),
                        YTXCGPOINTVALUE(anchorPoint10)]];
    [anchor setKeyTimes:@[@0, @0.2, @0.3, @0.4, YTXANCHORLASTKEYTIME, @1]];
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITION];
    [position setValues  :@[
                             YTXANCHORPOINTVALUE(anchorPoint00),
                             YTXANCHORPOINTVALUE(anchorPoint02),
                             YTXANCHORPOINTVALUE(anchorPoint03),
                             YTXANCHORPOINTVALUE(anchorPoint04),
                             YTXANCHORPOINTVALUE(anchorPoint9999),
                             YTXANCHORPOINTVALUE(anchorPoint10)
                             ]];
    [position setKeyTimes:@[@0, @0.2, @0.3, @0.4, YTXANCHORLASTKEYTIME, @1]];
    
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity, animation, position, anchor]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_boingOutDownAnimationWithDurationTime:"];
    });
    return group;
}

#pragma mark - On The Space
- (nonnull CAAnimation *)ytx_spaceOutUpAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_spaceAnimationWithDurationTime:durationTime translateX:0 translateY:-YTXSELFHEIGHT anchorPoint00:CGPointMake(0.5, 0.0) spaceKeyTime:0.2 isIn:NO animationName:@"ytx_spaceOutUpAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_spaceOutRightAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_spaceAnimationWithDurationTime:durationTime translateX:YTXSELFWIDTH translateY:0  anchorPoint00:CGPointMake(1.0, 0.5) spaceKeyTime:0.2 isIn:NO animationName:@"ytx_spaceOutRightAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_spaceOutDownAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_spaceAnimationWithDurationTime:durationTime translateX:0 translateY:YTXSELFHEIGHT anchorPoint00:CGPointMake(0.5, 1.0) spaceKeyTime:0.2 isIn:NO animationName:@"ytx_spaceOutDownAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_spaceOutLeftAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_spaceAnimationWithDurationTime:durationTime translateX:-YTXSELFWIDTH translateY:0 anchorPoint00:CGPointMake(0.0, 0.5) spaceKeyTime:0.2 isIn:NO animationName:@"ytx_spaceOutLeftAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_spaceInUpAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_spaceAnimationWithDurationTime:durationTime translateX:0 translateY:-YTXSELFHEIGHT anchorPoint00:CGPointMake(0.5, 0.0) spaceKeyTime:0.8 isIn:YES animationName:@"ytx_spaceInUpAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_spaceInRightAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_spaceAnimationWithDurationTime:durationTime translateX:YTXSELFWIDTH translateY:0  anchorPoint00:CGPointMake(1.0, 0.5) spaceKeyTime:0.8 isIn:YES animationName:@"ytx_spaceInRightAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_spaceInDownAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_spaceAnimationWithDurationTime:durationTime translateX:0 translateY:YTXSELFHEIGHT anchorPoint00:CGPointMake(0.5, 1.0) spaceKeyTime:0.8 isIn:YES animationName:@"ytx_spaceInDownAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_spaceInLeftAnimationWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_spaceAnimationWithDurationTime:durationTime translateX:-YTXSELFWIDTH translateY:0 anchorPoint00:CGPointMake(0.0, 0.5) spaceKeyTime:0.8 isIn:YES animationName:@"ytx_spaceInLeftAnimationWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_spaceAnimationWithDurationTime:(NSTimeInterval)durationTime translateX:(CGFloat) translateX translateY:(CGFloat) translateY anchorPoint00:(CGPoint)anchorPoint00 spaceKeyTime:(CGFloat) spaceKeyTime isIn:(BOOL) isIn  animationName:(nonnull NSString *) name
{
    CAKeyframeAnimation *animation  = [CAKeyframeAnimation animationWithKeyPath:YTXTRANSFORM];
    
    animation.keyTimes    = @[@0, @1];
    
    animation.values = isIn ? @[
                                 YTXSCALEVALUE(0.2, 0.2, 1.0),
                                 YTXSCALEVALUE(1.0, 1.0, 1.0)
                                ] : @[
                                 YTXSCALEVALUE(1.0, 1.0, 1.0),
                                 YTXSCALEVALUE(0.2, 0.2, 1.0)
                                ];
    
    CAKeyframeAnimation *opacity = [CAKeyframeAnimation animationWithKeyPath:YTXOPACITY];
    [opacity setValues:isIn ? @[@0, @1] :@[@1, @0] ];
    [opacity setKeyTimes:@[@0, @1]];
    
    CGPoint anchorPointSpace = anchorPoint00;
    CGPoint anchorPoint10 =   CGPointMake(0.5, 0.5);
    
    CAKeyframeAnimation *anchor = [CAKeyframeAnimation animationWithKeyPath:YTXANCHORPOINT];
    [anchor setValues:@[YTXCGPOINTVALUE(anchorPoint00),
                        YTXCGPOINTVALUE(anchorPointSpace),
                        YTXCGPOINTVALUE(anchorPoint10)]];
    [anchor setKeyTimes:@[@0, @(spaceKeyTime), @1]];
    
    CGPoint position00   = [YTXAnimationsUtil positionWithAnchorPoint:anchorPoint00   andView:self];
    CGPoint positionSpace = [YTXAnimationsUtil positionWithAnchorPoint:anchorPointSpace andView:self];

    CGPoint position10   = [YTXAnimationsUtil positionWithAnchorPoint:anchorPoint10   andView:self];
    
    if (isIn) {
        position00.x += translateX;
        position00.y += translateY;
    }
    else {
        positionSpace.x += translateX;
        positionSpace.y += translateY;
        position10.x += translateX;
        position10.y += translateY;
    }
    
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animationWithKeyPath:YTXPOSITION];
    [position setValues  :@[
                            YTXCGPOINTVALUE(position00),
                            YTXCGPOINTVALUE(positionSpace),
                            YTXCGPOINTVALUE(position10)
                            ]];
    [position setKeyTimes:@[@0, @(spaceKeyTime), YTXANCHORLASTKEYTIME, @1]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:@[opacity, position, anchor, animation]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:name];
    });
    return group;
}

@end
