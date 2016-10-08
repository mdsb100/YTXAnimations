//
//  UIView+YTXCSShake.h
//  Pods
//
//  Created by CaoJun on 16/4/19.
//
//

#import <UIKit/UIKit.h>

@interface UIView (YTXCSShake)

- (nonnull CAAnimation *)ytx_basicShakeAnimation;

- (nonnull CAAnimation *)ytx_littleShakeAnimation;

- (nonnull CAAnimation *)ytx_slowShakeAnimation;

- (nonnull CAAnimation *)ytx_hardShakeAnimation;

- (nonnull CAAnimation *)ytx_horizontalShakeAnimation;

- (nonnull CAAnimation *)ytx_verticalShakeAnimation;

- (nonnull CAAnimation *)ytx_rotateShakeAnimation;

- (nonnull CAAnimation *)ytx_opacityShakeAnimation;

- (nonnull CAAnimation *)ytx_crazyShakeAnimation;

//- (nonnull CAAnimation *)ytx_chunkShakeAnimation;

@end
