//
//  UIView+YTXCSShake.m
//  Pods
//
//  Created by CaoJun on 16/4/19.
//
//

#import "UIView+YTXCSShake.h"

#define YTXShakeKeyTimes @[@0,@0.2,@0.4,@0.6,@0.8,@0.10,@0.12,@0.14,@0.16,@0.18,@0.20,@0.22,@0.24,@0.26,@0.28,@0.30,@0.32,@0.34,@0.36,@0.38,@0.40,@0.42,@0.44,@0.46,@0.48,@0.50,@0.52,@0.54,@0.56,@0.58,@0.60,@0.62,@0.64,@0.66,@0.68,@0.70,@0.72,@0.74,@0.76,@0.78,@0.80,@0.82,@0.84,@0.86,@0.88,@0.90,@0.92,@0.94,@0.96,@0.98,@1]

@implementation UIView (YTXCSShake)

- (nonnull CAAnimation *)ytx_basicShakeAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    NSArray<NSNumber *> * keyTimes = YTXShakeKeyTimes;
    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0)    , @(0)  , @(0)],
                                                        @[@(1.5)  , @(2.5)  , @(-0.5)],
                                                        @[@(1.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(1.5)  , @(-1.5) , @(-0.5)],
                                                        @[@(0.5)  , @(2.5)  , @( 0.5)],
                                                        @[@(-0.5) , @(-0.5) , @( 1.5)],
                                                        @[@(-0.5) , @(-0.5) , @(-0.5)],
                                                        @[@(2.5)  , @(0.5)  , @(-0.5)],
                                                        @[@(-1.5) , @(1.5)  , @( 0.5)],
                                                        @[@(2.5)  , @(0.5)  , @(-0.5)],
                                                        @[@(-1.5) , @(0.5)  , @(-0.5)],
                                                        @[@(2.5)  , @(-1.5) , @(-0.5)],
                                                        @[@(1.5)  , @(2.5)  , @( 1.5)],
                                                        @[@(-1.5) , @(-0.5) , @( 0.5)],
                                                        @[@(1.5)  , @(1.5)  , @(-0.5)],
                                                        @[@(2.5)  , @(-1.5) , @(-0.5)],
                                                        @[@(0.5)  , @(2.5)  , @(-0.5)],
                                                        @[@(-0.5) , @(1.5)  , @( 1.5)],
                                                        @[@(0.5)  , @(1.5)  , @( 1.5)],
                                                        @[@(1.5)  , @(1.5)  , @( 0.5)],
                                                        @[@(-0.5) , @(1.5)  , @( 0.5)],
                                                        @[@(-0.5) , @(0.5)  , @( 1.5)],
                                                        @[@(-1.5) , @(-1.5) , @( 1.5)],
                                                        @[@(0.5)  , @(-0.5) , @( 0.5)],
                                                        @[@(-0.5) , @(1.5)  , @(-0.5)],
                                                        @[@(2.5)  , @(-0.5) , @(-0.5)],
                                                        @[@(0.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(2.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(-1.5) , @(-0.5) , @( 0.5)],
                                                        @[@(-1.5) , @(2.5)  , @( 1.5)],
                                                        @[@(0.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(-0.5) , @(2.5)  , @( 1.5)],
                                                        @[@(0.5)  , @(0.5)  , @(-0.5)],
                                                        @[@(1.5)  , @(-0.5) , @( 1.5)],
                                                        @[@(-1.5) , @(-0.5) , @( 0.5)],
                                                        @[@(-0.5) , @(2.5)  , @( 1.5)],
                                                        @[@(1.5)  , @(0.5)  , @( 0.5)],
                                                        @[@(0.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(1.5)  , @(1.5)  , @(-0.5)],
                                                        @[@(2.5)  , @(-1.5) , @( 0.5)],
                                                        @[@(-1.5) , @(1.5)  , @( 0.5)],
                                                        @[@(-0.5) , @(2.5)  , @( 1.5)],
                                                        @[@(1.5)  , @(1.5)  , @(-0.5)],
                                                        @[@(2.5)  , @(0.5)  , @( 1.5)],
                                                        @[@(-0.5) , @(-1.5) , @(-0.5)],
                                                        @[@(1.5)  , @(-0.5) , @(-0.5)],
                                                        @[@(0.5)  , @(-1.5) , @( 1.5)],
                                                        @[@(-0.5) , @(-0.5) , @( 0.5)],
                                                        @[@(-0.5) , @(-1.5) , @(-0.5)],
                                                        @[@(-0.5) , @(-1.5) , @(1.5)],
                                                        @[@(0)    , @(0)    , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimtionWithKeyTimes:keyTimes transformArray:transformArray];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_basicShakeAnimtionWithDurationTime:"];
    });
    
    shackAnimation.duration = 0.1;
    shackAnimation.repeatCount = durationTime / 0.1;
    return shackAnimation;
}

- (nonnull CAAnimation *)ytx_littleShakeAnimtionWithDurationTime:(NSTimeInterval)durationTime
{
    NSArray<NSNumber *> * keyTimes = YTXShakeKeyTimes;
    //translate(x, y) rotate(deg)
    NSArray<NSArray<NSNumber *> *> * transformArray = @[
                                                        @[@(0), @(0) , @(0)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(0), @(1) , @(0.5)],
                                                        @[@(1), @(0) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(1), @(1) , @(0.5)],
                                                        @[@(0), @(0) , @(0)]
                                                        ];
    
    CAKeyframeAnimation *shackAnimation = [self ytx_CSShakeAnimtionWithKeyTimes:keyTimes transformArray:transformArray];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.layer addAnimation:shackAnimation forKey:@"ytx_littleShakeAnimtionWithDurationTime:"];
    });
    
    shackAnimation.duration = 0.1;
    shackAnimation.repeatCount = durationTime / 0.1;
    return shackAnimation;
}


- (nonnull CAKeyframeAnimation *)ytx_CSShakeAnimtionWithKeyTimes:(nonnull NSArray<NSNumber *> *) keyTimes transformArray:(nonnull NSArray<NSArray<NSNumber *> *> *) transformArray
{

    CAKeyframeAnimation *shackAnimation = [CAKeyframeAnimation  animationWithKeyPath:@"transform"];
    
    shackAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    shackAnimation.keyTimes = keyTimes;
    NSMutableArray<NSValue *> * values = [NSMutableArray array];
    
    CATransform3D transform = self.layer.transform;
    
    for (NSArray * transformValues in transformArray) {
        //[translateX,translateY,rorateX]
        CGFloat translateX = [transformValues[0] floatValue];
        CGFloat translateY = [transformValues[1] floatValue];
        CGFloat rotateX = [transformValues[2] floatValue];
        CATransform3D currentTransform = CATransform3DRotate(transform, (rotateX) * M_PI / 180.0, rotateX, 0, 0);
        currentTransform.m41 = translateX;
        currentTransform.m42 = translateY;

        NSValue * value = [NSValue valueWithCATransform3D:currentTransform];
        
        [values addObject:value];
    }
    
    [shackAnimation setValues:values];
    
    return shackAnimation;
}

@end
