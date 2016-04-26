//
//  YTXAnimationsUtil.h
//  Pods
//
//  Created by CaoJun on 16/4/26.
//
//

#import <Foundation/Foundation.h>

// 转化为NSValue
#define YTXSCALEVALUE(x,y,z)                    [NSValue valueWithCATransform3D:CATransform3DScale(self.layer.transform, (x), (y), (z))]
#define YTXROTATEVALUE(d,x,y,z)                 [NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, (d), (x), (y), (z))]
#define YTXTRANSLATEVALUE(x,y,z)                [NSValue valueWithCATransform3D:CATransform3DTranslate(self.layer.transform, (x), (y), (z))]
#define YTXPOINTVALUE(x,y)                      [NSValue valueWithCGPoint:CGPointMake((x), (y))]

//屏幕宽度
#define YTXSELFWIDTH                            (self.frame.size.width)
#define YTXSELFHEIGHT                           (self.frame.size.height)

//获取YTXCAMediaTimingFunction
#define YTXCAMEDIATIMINGFUNCTION(x1,y1,x2,y2)   [CAMediaTimingFunction functionWithControlPoints:x1 :y1 :x2 :y2]

#define YTXBIGDISTANCEVALUE                     1000

#define YTXOPACITY                               @"opacity"
#define YTXPOSITION                              @"position"
#define YTXPOSITIONX                             @"position.x"
#define YTXPOSITIONY                             @"position.y"
#define YTXTRANSFORM                             @"transform"
#define YTXANCHORPOINT                           @"anchorPoint"

#define YTXANCHORLASTKEYTIME                        @0.9999

@interface YTXAnimationsUtil : NSObject

+(CGPoint)positionWithAnchorPoint:(CGPoint)anchorPoint andView:(nonnull UIView *)view;

+(CGFloat)radianWithDegree:(CGFloat) degree;

@end
