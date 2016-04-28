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
        [self.layer addAnimation:group forKey:@"ytx_twisterInUpAnimtionWithDurationTime:"];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_swapAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
    [group setAnimations:@[anchor, position ]];
    [group setDuration:durationTime];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:group forKey:@"ytx_swapAnimtionWithDurationTime:"];
    });
    
    return group;
}

#pragma mark - Static Effects

- (nonnull CAAnimation *)ytx_openAnimtionWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 animationName:(nonnull NSString *) name
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:anchor00 ahchore10:anchor10 degree00:degree00 degree10:degree10 opacity00:1 opacity10:1 animationName:name];
}
- (nonnull CAAnimation *)ytx_openAnimtionWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 opacity00:(CGFloat)opacity00 opacity10:(CGFloat)opacity10 animationName:(nonnull NSString *) name
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

- (nonnull CAAnimation *)ytx_openDownLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0.0, 1.0) ahchore10:CGPointMake(0.0, 1.0) degree00:0 degree10:-110 animationName:@"ytx_openDownLeftAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openDownRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(1.0, 1.0) ahchore10:CGPointMake(1.0, 1.0) degree00:0 degree10:110 animationName:@"ytx_openDownRightAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0.0, 0.0) ahchore10:CGPointMake(0.0, 0.0) degree00:0 degree10:110 animationName:@"ytx_openUpLeftAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(1.0, 0.0) ahchore10:CGPointMake(1.0, 0.0) degree00:0 degree10:-110 animationName:@"ytx_openUpRightAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openDownLeftRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0.0, 1.0) ahchore10:CGPointMake(0.0, 1.0) degree00:-110 degree10:0 animationName:@"ytx_openDownLeftRetournAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openDownRightRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(1.0, 1.0) ahchore10:CGPointMake(1.0, 1.0) degree00:110 degree10:0 animationName:@"ytx_openDownRightRetournAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpLeftRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0.0, 0.0) ahchore10:CGPointMake(0.0, 0.0) degree00:110 degree10:0 animationName:@"ytx_openUpLeftRetournAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpRightRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(1.0, 0.0) ahchore10:CGPointMake(1.0, 0.0) degree00:-110 degree10:0 animationName:@"ytx_openUpRightRetournAnimtionWithDurationTime:"];
}

#pragma mark - Static Effects Out
- (nonnull CAAnimation *)ytx_openDownLeftOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0.0, 1.0) ahchore10:CGPointMake(0.0, 1.0) degree00:0 degree10:-110 opacity00:1 opacity10:0 animationName:@"ytx_openDownLeftOutAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openDownRightOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(1.0, 1.0) ahchore10:CGPointMake(1.0, 1.0) degree00:0 degree10:110 opacity00:1 opacity10:0 animationName:@"ytx_openDownRightOutAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpLeftOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0.0, 0.0) ahchore10:CGPointMake(0.0, 0.0) degree00:0 degree10:110 opacity00:1 opacity10:0 animationName:@"ytx_openUpLeftOutAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_openUpRightOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_openAnimtionWithDurationTime:durationTime anchor00:CGPointMake(1.0, 0.0) ahchore10:CGPointMake(1.0, 0.0) degree00:0 degree10:-110 opacity00:1 opacity10:0 animationName:@"ytx_openUpRightOutAnimtionWithDurationTime:"];
}

#pragma mark - Perspective

- (nonnull CAAnimation *)ytx_perspectiveAnimtionWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10 rotateX:(CGFloat)rotateX rotateY:(CGFloat)rotateY animationName:(nonnull NSString *) name
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

- (nonnull CAAnimation *)ytx_perspectiveDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0, 1) ahchore10:CGPointMake(0, 1) degree00:0 degree10:-180 rotateX:-1 rotateY:0 animationName:@"ytx_perspectiveDownAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0, 0) degree00:0.0001 degree10:180 rotateX:1 rotateY:0 animationName:@"ytx_perspectiveUpAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0, 0) degree00:0 degree10:-180 rotateX:0 rotateY:-1 animationName:@"ytx_perspectiveLeftAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimtionWithDurationTime:durationTime anchor00:CGPointMake(1, 0) ahchore10:CGPointMake(1, 0) degree00:0.0001 degree10:180 rotateX:0 rotateY:1 animationName:@"ytx_perspectiveRightAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveDownRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0, 1) ahchore10:CGPointMake(0, 1) degree00:-180 degree10:0 rotateX:-1 rotateY:0 animationName:@"ytx_perspectiveDownRetournAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveUpRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0, 0) degree00:180 degree10:0.0001 rotateX:1 rotateY:0 animationName:@"ytx_perspectiveUpRetournAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveLeftRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0, 0) degree00:-180 degree10:0 rotateX:0 rotateY:-1 animationName:@"ytx_perspectiveLeftRetournAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_perspectiveRightRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_perspectiveAnimtionWithDurationTime:durationTime anchor00:CGPointMake(1, 0) ahchore10:CGPointMake(1, 0) degree00:180 degree10:0.0001 rotateX:0 rotateY:1 animationName:@"ytx_perspectiveRightRetournAnimtionWithDurationTime:"];
}

#pragma mark - Rotate
- (nonnull CAAnimation *)ytx_rotateAnimtionWithDurationTime:(NSTimeInterval)durationTime anchor00:(CGPoint) anchor00 ahchore10:(CGPoint) anchor10 degree00:(CGFloat) degree00 degree10:(CGFloat) degree10  rotateX:(CGFloat)rotateX rotateY:(CGFloat)rotateY opacity00:(CGFloat)opacity00 opacity10:(CGFloat)opacity10 translateX:(CGFloat)translateX translateY:(CGFloat)translateY translateZ:(CGFloat)translateZ animationName:(nonnull NSString *) name
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

- (nonnull CAAnimation *)ytx_rotateDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0, 1) ahchore10:CGPointMake(0, 1) degree00:0 degree10:-180 rotateX:-1 rotateY:0 opacity00:1 opacity10:0 translateX:0 translateY:YTXSELFHEIGHT translateZ:150 animationName:@"ytx_rotateDownAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_rotateUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0.5, 0) degree00:0.0001 degree10:180.0 rotateX:1 rotateY:0 opacity00:1 opacity10:0 translateX:0 translateY:-YTXSELFHEIGHT translateZ:150 animationName:@"ytx_rotateUpAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_rotateLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0.5, 0) degree00:0 degree10:-180 rotateX:0 rotateY:-1 opacity00:1 opacity10:0 translateX:-YTXSELFWIDTH*1.5 translateY:0 translateZ:150 animationName:@"ytx_rotateLeftAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_rotateRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_rotateAnimtionWithDurationTime:durationTime anchor00:CGPointMake(0, 0) ahchore10:CGPointMake(0.5, 0) degree00:0.0001 degree10:180 rotateX:0 rotateY:1 opacity00:1 opacity10:0 translateX:YTXSELFWIDTH*2 translateY:0 translateZ:150 animationName:@"ytx_rotateRightAnimtionWithDurationTime:"];
}
#pragma mark - Slide
- (nonnull CAAnimation *)ytx_slideAnimtionWithDurationTime:(NSTimeInterval)durationTime isIn:(BOOL)isIn translateValues:(nonnull NSArray *)translateValues animationName:(nonnull NSString *) name
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

- (nonnull CAAnimation *)ytx_slideDownAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithDurationTime:durationTime
                                            isIn:NO
                                 translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                   YTXTRANSLATEVALUE(0, YTXSELFHEIGHT, 0)]
                                    animationName:@"ytx_slideDownAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideLeftAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithDurationTime:durationTime
                                            isIn:NO
                                 translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                   YTXTRANSLATEVALUE(-YTXSELFWIDTH, 0, 0)]
                                    animationName:@"ytx_slideLeftAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideRightAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithDurationTime:durationTime
                                            isIn:NO
                                 translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                   YTXTRANSLATEVALUE(YTXSELFWIDTH, 0, 0)]
                                    animationName:@"ytx_slideRightAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideUpAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithDurationTime:durationTime
                                            isIn:NO
                                 translateValues:@[YTXTRANSLATEVALUE(0, 0, 0),
                                                   YTXTRANSLATEVALUE(0, -YTXSELFHEIGHT, 0)]
                                    animationName:@"ytx_slideUpAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideDownRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithDurationTime:durationTime
                                              isIn:YES
                                   translateValues:@[YTXTRANSLATEVALUE(0, YTXSELFHEIGHT, 0),
                                                     YTXTRANSLATEVALUE(0, 0, 0)]
                                     animationName:@"ytx_slideDownRetournAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideLeftRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithDurationTime:durationTime
                                              isIn:YES
                                   translateValues:@[YTXTRANSLATEVALUE(-YTXSELFWIDTH, 0, 0),
                                                     YTXTRANSLATEVALUE(0, 0, 0)]
                                     animationName:@"ytx_slideLeftRetournAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideRightRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithDurationTime:durationTime
                                              isIn:YES
                                   translateValues:@[YTXTRANSLATEVALUE(YTXSELFWIDTH, 0, 0),
                                                     YTXTRANSLATEVALUE(0, 0, 0)]
                                     animationName:@"ytx_slideRightRetournAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_slideUpRetournAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_slideAnimtionWithDurationTime:durationTime
                                              isIn:YES
                                   translateValues:@[YTXTRANSLATEVALUE(0, -YTXSELFHEIGHT, 0),
                                                     YTXTRANSLATEVALUE(0, 0, 0)]
                                     animationName:@"ytx_slideUpRetournAnimtionWithDurationTime:"];
}

#pragma mark - Math
- (nonnull CAAnimation *)ytx_swashOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
        [self.layer addAnimation:group forKey:@"ytx_swashOutAnimtionWithDurationTime:"];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_swashInAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
        [self.layer addAnimation:group forKey:@"ytx_swashInAnimtionWithDurationTime:"];
    });
    
    return group;
}

- (nonnull CAAnimation *)ytx_foolishAnimtionWithDurationTime:(NSTimeInterval)durationTime anchorPointArray:(nonnull NSArray *) anchorPointArray opacityArray:(nonnull NSArray *) opacityArray scaleArray:(nonnull NSArray *) scaleArray animationName:(nonnull NSString *) name
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

- (nonnull CAAnimation *)ytx_foolishOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_foolishAnimtionWithDurationTime:durationTime
                                    anchorPointArray:@[YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.25, 0.25), YTXPOINTVALUE(0.0, 0.0), YTXPOINTVALUE(1.0, 0.0), YTXPOINTVALUE(0.0, 0.5), YTXPOINTVALUE(0.0, 1.0), YTXPOINTVALUE(0.5, 0.5)]
                                        opacityArray:@[@1, @1, @1, @1, @1, @0]
                                          scaleArray:@[YTXPOINTVALUE(1.0, 1.0), YTXPOINTVALUE(0.75, 0.75), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.0, 0.0)]
                                       animationName:@"ytx_foolishOutAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_foolishInAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    return [self ytx_foolishAnimtionWithDurationTime:durationTime
                                    anchorPointArray:@[YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.25, 0.5), YTXPOINTVALUE(0.0, 1.0), YTXPOINTVALUE(1.0, 1.0), YTXPOINTVALUE(0.0, 0.5), YTXPOINTVALUE(0.0, 0.0), YTXPOINTVALUE(0.5, 0.5)]
                                        opacityArray:@[@0, @1, @1, @1, @1, @1]
                                          scaleArray:@[YTXPOINTVALUE(0.0, 0.0), YTXPOINTVALUE(0.25, 0.25), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(0.5, 0.5), YTXPOINTVALUE(1.0, 1.0)]
                                       animationName:@"ytx_foolishInAnimtionWithDurationTime:"];
}

- (nonnull CAAnimation *)ytx_holeOutAnimtionWithDurationTime:(NSTimeInterval)durationTime
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
        [self.layer addAnimation:group forKey:@"ytx_holeOutAnimtionWithDurationTime:"];
    });
    
    return group;
}

@end
