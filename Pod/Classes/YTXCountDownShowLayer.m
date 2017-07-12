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

@dynamic countDownColor;
@dynamic clockwise;

//因为会有另一个layer跑
@dynamic innerRadius;
@dynamic outerRadius;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cornerRadius = self.frame.size.width * 0.5;
        self.countDownColor = [UIColor grayColor];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.cornerRadius = frame.size.width * 0.5;
    self.innerRadius = @(frame.size.width/2.f);
    self.outerRadius = @(frame.size.width/2.f);
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
    CGFloat innerRadius = [self.innerRadius floatValue];
    CGFloat outerRadius = [self.outerRadius floatValue];
    
    CGContextSetFillColorWithColor(ctx, self.countDownColor.CGColor);
    
    CGFloat angleRadians = (1 - self.step) * 2 * M_PI - M_PI_2 * (self.clockwise ? -1 : 1);
    
    CGContextMoveToPoint(ctx, center, center);
    CGContextSetFillColorWithColor(ctx, self.countDownColor.CGColor);
    CGContextAddArc(ctx,
                    center,
                    center,
                    outerRadius,
                    - M_PI_2,
                    (self.clockwise ? -1 : 1) * angleRadians,
                    !self.clockwise ? 0 : 1);
    CGContextFillPath(ctx);
    
    if (outerRadius > innerRadius) {
        CGContextMoveToPoint(ctx, 0, 0);
        CGContextSetFillColorWithColor(ctx, [UIColor clearColor].CGColor);
        CGContextAddArc(ctx,
                        center,
                        center,
                        innerRadius,
                        0,
                        - M_PI * 2,
                        1);
        CGContextSetBlendMode(ctx, kCGBlendModeClear);
        CGContextFillPath(ctx);
    }
    
}


- (nonnull CAKeyframeAnimation * )countDownAnimationWithDurationTime:(CFTimeInterval)durationTime
{
    self.step = 1.0;
    CAKeyframeAnimation *animation =
    [CAKeyframeAnimation animationWithKeyPath:@"step"];
    animation.values = @[@(0), @(1)];
    animation.duration = durationTime;
    animation.fillMode = kCAFillModeForwards;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    [self removeAnimationForKey:@"countDownAnimationWithDurationTime:"];
    [self addAnimation:animation forKey:@"countDownAnimationWithDurationTime:"];
    
    return animation;
}
@end
