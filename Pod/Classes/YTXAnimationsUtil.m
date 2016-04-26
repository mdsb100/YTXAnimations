//
//  YTXAnimationsUtil.m
//  Pods
//
//  Created by CaoJun on 16/4/26.
//
//

#import "YTXAnimationsUtil.h"

@implementation YTXAnimationsUtil

+(CGPoint)positionWithAnchorPoint:(CGPoint)anchorPoint andView:(nonnull UIView *)view
{
    CGPoint newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x,
                                   view.bounds.size.height * anchorPoint.y);
    CGPoint oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x,
                                   view.bounds.size.height * view.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);
    
    return CGPointMake(newPoint.x-oldPoint.x, newPoint.y-oldPoint.y);
}

+(CGFloat)radianWithDegree:(CGFloat) degree
{
    return degree * M_PI / 180.0;
}

@end
