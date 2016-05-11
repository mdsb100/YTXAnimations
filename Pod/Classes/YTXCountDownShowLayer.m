//
//  YTXCountDownShowLayer.m
//  Pods
//
//  Created by CaoJun on 16/5/11.
//
//

#import "YTXCountDownShowLayer.h"

@interface YTXCountDownShowLayer()

@property (nonatomic, assign) CGFloat step;

@end

@implementation YTXCountDownShowLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cornerRadius = self.frame.size.width * 0.5;
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.cornerRadius = self.frame.size.width * 0.5;
}

- (UIColor *)countDownColor
{
    return _countDownColor ? : [UIColor grayColor];
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqual:@"step"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx
{
    
    CGRect bounds = self.bounds;
    CGFloat center = bounds.size.width/2;
    CGFloat radius = center;
    
    CGContextSetFillColorWithColor(ctx, self.countDownColor.CGColor);

    CGFloat angleRadians = (1 - self.step) * 2 * M_PI - M_PI_2 * (self.clockwise ? -1 : 1);
    
    CGContextMoveToPoint(ctx, center, center);
    CGContextAddArc(ctx,
                    center,
                    center,
                    radius,
                    - M_PI_2,
                    (self.clockwise ? -1 : 1) * angleRadians,
                    !self.clockwise ? 0 : 1);
    CGContextFillPath(ctx);
}


- (nonnull CAKeyframeAnimation * )countDownAnimationWithDurationTime:(CFTimeInterval)durationTime
{
    self.step = 0;
    CAKeyframeAnimation *animation =
    [CAKeyframeAnimation animationWithKeyPath:@"step"];
    
    animation.values = @[@(0), @(1)];
    animation.duration = durationTime;
    animation.fillMode = kCAFillModeForwards;
    
    animation.removedOnCompletion = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeAnimationForKey:@"countDownAnimationWithDurationTime:"];
        [self addAnimation:animation forKey:@"countDownAnimationWithDurationTime:"];
    });
    
    return animation;
}

@end
