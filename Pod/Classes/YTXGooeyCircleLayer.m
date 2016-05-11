//
//  YTXGooeyCircleLayer.m
//  Pods
//
//  Created by CaoJun on 16/4/29.
//
//

#import "YTXGooeyCircleLayer.h"
@interface YTXGooeyCircleLayer()

@property (nonatomic, assign) CGFloat step;

@end


@implementation YTXGooeyCircleLayer

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (UIColor *)gooeyColor
{
    return _gooeyColor ? : [UIColor redColor];
}

- (NSNumber *)gooeySize
{
    return  _gooeySize ? : @(self.bounds.size.width);
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
    // https://github.com/KittenYang/KYGooeyMenu
    CGRect currentRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, [self.gooeySize floatValue], [self.gooeySize floatValue]);
    
    CGFloat offset =
    currentRect.size.width / 3.6; //设置3.6 出来的弧度最像圆形
    CGPoint rectCenter = CGPointMake(currentRect.origin.x + currentRect.size.width / 2, currentRect.origin.y + currentRect.size.height / 2);
    
    // 8个控制点实际的偏移距离。 The real distance of 8 control points.
    CGFloat extra = (currentRect.size.width * 2 / 5) * self.step;
    CGPoint pointA = CGPointMake(rectCenter.x, currentRect.origin.y + extra);
    CGPoint pointB = CGPointMake(rectCenter.x + currentRect.size.width / 2,rectCenter.y);
    CGPoint pointC = CGPointMake(rectCenter.x, rectCenter.y + currentRect.size.height / 2 - extra);
    CGPoint pointD = CGPointMake(currentRect.origin.x, rectCenter.y);
    
    CGPoint c1 = CGPointMake(pointA.x + offset, pointA.y);
    CGPoint c2 = CGPointMake(pointB.x, pointB.y - offset);
    
    CGPoint c3 = CGPointMake(pointB.x, pointB.y + offset);
    CGPoint c4 = CGPointMake(pointC.x + offset, pointC.y);
    
    CGPoint c5 = CGPointMake(pointC.x - offset, pointC.y);
    CGPoint c6 = CGPointMake(pointD.x, pointD.y + offset);
    
    CGPoint c7 = CGPointMake(pointD.x, pointD.y - offset);
    CGPoint c8 = CGPointMake(pointA.x - offset, pointA.y);
    
    // 更新界面
    UIBezierPath *ovalPath = [UIBezierPath bezierPath];
    [ovalPath moveToPoint:pointA];
    [ovalPath addCurveToPoint:pointB controlPoint1:c1 controlPoint2:c2];
    [ovalPath addCurveToPoint:pointC controlPoint1:c3 controlPoint2:c4];
    [ovalPath addCurveToPoint:pointD controlPoint1:c5 controlPoint2:c6];
    [ovalPath addCurveToPoint:pointA controlPoint1:c7 controlPoint2:c8];
    [ovalPath closePath];
    CGContextAddPath(ctx, ovalPath.CGPath);
    CGContextSetFillColorWithColor(ctx, self.gooeyColor.CGColor);
    CGContextFillPath(ctx);
}

- (void)springAnimationWithDurationTime:(CFTimeInterval)durationTime
{
    [self springAnimationWithDurationTime:durationTime usingSpringWithDamping:0.5 initialSpringVelocity:3 fromValue:2 toValue:0];
}

- (void)springAnimationWithDurationTime:(CFTimeInterval)durationTime usingSpringWithDamping:(CGFloat)damping initialSpringVelocity:(CGFloat)velocity fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue;
{
    CGFloat dampingFactor = 10.0;
    CGFloat velocityFactor = 10.0;
    NSMutableArray *values = [self springAnimationValues:fromValue
                                                 toValue:toValue
                                  usingSpringWithDamping:damping * dampingFactor
                                   initialSpringVelocity:velocity * velocityFactor
                                                duration:durationTime];
    CAKeyframeAnimation *animation =
    [CAKeyframeAnimation animationWithKeyPath:@"step"];
    animation.values = values;
    animation.duration = durationTime;
    animation.fillMode = kCAFillModeForwards;

    self.step = 0;
    [self removeAnimationForKey:@"springAnimationWithDurationTime:"];
    [self addAnimation:animation forKey:@"springAnimationWithDurationTime:"];
}

- (NSMutableArray *)springAnimationValues:(CGFloat)fromValue
                                  toValue:(CGFloat)toValue
                   usingSpringWithDamping:(CGFloat)damping
                    initialSpringVelocity:(CGFloat)velocity
                                 duration:(CGFloat)duration
{
    // 60个关键帧
    NSInteger numOfFrames = duration * 60;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:numOfFrames];
    for (NSInteger i = 0; i < numOfFrames; i++) {
        [values addObject:@(0.0)];
    }
    
    //差值
    CGFloat diff = toValue - fromValue;
    for (NSInteger frame = 0; frame < numOfFrames; frame++) {
        CGFloat x = (CGFloat)frame / (CGFloat)numOfFrames;
        CGFloat value = toValue -
        diff * (pow(M_E, -damping * x) *
                cos(velocity * x)); // y = 1-e^{-5x} * cos(30x)
        values[frame] = @(value);
    }
    return values;
}

@end
