//
//  UIView+YTXCSShake.h
//  Pods
//
//  Created by CaoJun on 16/4/19.
//
//

#import <UIKit/UIKit.h>

@interface UIView (YTXCSShake)

- (nonnull CAAnimation *)ytx_basicShakeAnimtion;

- (nonnull CAAnimation *)ytx_littleShakeAnimtion;

- (nonnull CAAnimation *)ytx_slowShakeAnimtion;

- (nonnull CAAnimation *)ytx_hardShakeAnimtion;

- (nonnull CAAnimation *)ytx_horizontalShakeAnimtion;

- (nonnull CAAnimation *)ytx_verticalShakeAnimtion;

- (nonnull CAAnimation *)ytx_rotateShakeAnimtion;

- (nonnull CAAnimation *)ytx_opacityShakeAnimtion;

- (nonnull CAAnimation *)ytx_crazyShakeAnimtion;

//- (nonnull CAAnimation *)ytx_chunkShakeAnimation;

@end
