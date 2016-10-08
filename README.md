# YTXAnimations

[![CI Status](http://img.shields.io/travis/baidao/YTXAnimations.svg?style=flat)](https://travis-ci.org/baidao/YTXAnimations)
[![Version](https://img.shields.io/cocoapods/v/YTXAnimations.svg?style=flat)](http://cocoapods.org/pods/YTXAnimations)
[![License](https://img.shields.io/cocoapods/l/YTXAnimations.svg?style=flat)](http://cocoapods.org/pods/YTXAnimations)
[![Platform](https://img.shields.io/cocoapods/p/YTXAnimations.svg?style=flat)](http://cocoapods.org/pods/YTXAnimations)

Reference [Animate.CSS](https://daneden.github.io/animate.css/) [CSShake](http://elrumordelaluz.github.io/csshake/) [Magic.CSS](http://www.minimamente.com/example/magic_animations/)

![YTXAnimateCSS](https://github.com/baidao/YTXAnimations/blob/master/YTXAnimateCSS.gif) ![YTXCSShake](https://github.com/baidao/YTXAnimations/blob/master/YTXCSShake.gif) ![YTXMagicCSS](https://github.com/baidao/YTXAnimations/blob/master/YTXMagicCSS.gif)

## Usage
```objective-c
#import <YTXAnimations/UIView+YTXAnimateCSS.h>
#import <YTXAnimations/UIView+YTXCSShake.h>
#import <YTXAnimations/UIView+YTXMagicCSS.h>

CAAnimation * tada = [view ytx_tadaAnimationWithDurationTime:1];
tada.repeatCount = CGFLOAT_MAX;

[view ytx_basicShakeAnimation];

```

```objective-c
//removeAnimationForKey the key is function name. Please pay attention to colon!!! "ytx_tadaAnimationWithDurationTime:"
[view.layer removeAnimationForKey:@"ytx_tadaAnimationWithDurationTime:"];

// No colon
[view.layer removeAnimationForKey:@"ytx_basicShakeAnimation"];
```

## Integration

You shouldn't just use: pod "YTXAnimations". Since CocoaPods 0.36+ you should do something like:

```ruby
pod 'YTXAnimations', :subspecs => ["AnimateCSS", "CSShake", "MagicCSS"]
```

## License

YTXAnimations is available under the MIT license. See the LICENSE file for more info.

## If you use YTXAnimations in one of your apps, I'd love to hear about it.

## List of Animate.CSS
### Attention Seekers
- ytx_jelloAnimationWithDurationTime:
- ytx_wobbleAnimationWithDurationTime:
- ytx_swingAnimationWithDurationTime:
- ytx_rubberBandAnimationWithDurationTime:
- ytx_pluseAnimationWithDurationTime:
- ytx_flashAnimationWithDurationTime:
- ytx_bounceAnimationWithDurationTime:
- ytx_tadaAnimationWithDurationTime:
- ytx_shakeAnimationWithDurationTime:

### Bouncing Entrances
- ytx_bounceInAnimationWithDurationTime:
- ytx_bounceInDownAnimationWithDurationTime:
- ytx_bounceInLeftAnimationWithDurationTime:
- ytx_bounceInRightAnimationWithDurationTime:
- ytx_bounceInUpAnimationWithDurationTime:

### Bouncing Exits
- ytx_bounceOutAnimationWithDurationTime:
- ytx_bounceOutDownAnimationWithDurationTime:
- ytx_bounceOutLeftAnimationWithDurationTime:
- ytx_bounceOutRightAnimationWithDurationTime:
- ytx_bounceOutUpAnimationWithDurationTime:

### Fading Entrances
- ytx_fadeInAnimationWithDurationTime:
- ytx_fadeInDownAnimationWithDurationTime:
- ytx_fadeInDownBigAnimationWithDurationTime:
- ytx_fadeInLeftAnimationWithDurationTime:
- ytx_fadeInLeftBigAnimationWithDurationTime:
- ytx_fadeInRightAnimationWithDurationTime:
- ytx_fadeInRightBigAnimationWithDurationTime:
- ytx_fadeInUpAnimationWithDurationTime:
- ytx_fadeInUpBigAnimationWithDurationTime:

### Fading Exits
- ytx_fadeOutAnimationWithDurationTime:
- ytx_fadeOutDownAnimationWithDurationTime:
- ytx_fadeOutDownBigAnimationWithDurationTime:
- ytx_fadeOutLeftAnimationWithDurationTime:
- ytx_fadeOutLeftBigAnimationWithDurationTime:
- ytx_fadeOutRightAnimationWithDurationTime:
- ytx_fadeOutRightBigAnimationWithDurationTime:
- ytx_fadeOutUpAnimationWithDurationTime:
- ytx_fadeOutUpBigAnimationWithDurationTime:

### Zoom Exits
- ytx_zoomOutAnimationWithDurationTime:
- ytx_zoomOutDownAnimationWithDurationTime:
- ytx_zoomOutLeftAnimationWithDurationTime:
- ytx_zoomOutRightAnimationWithDurationTime:
- ytx_zoomOutUpAnimationWithDurationTime:

### Flippers
- ytx_flipAnimationWithDurationTime:
- ytx_flipInXAnimationWithDurationTime:
- ytx_flipInYAnimationWithDurationTime:
- ytx_flipOutXAnimationWithDurationTime:
- ytx_flipOutYAnimationWithDurationTime:

### LightSpeed
- ytx_lightSpeedInAnimationWithDurationTime:
- ytx_lightSpeedOutAnimationWithDurationTime:

### Special
- ytx_hingeAnimationWithDurationTime:
- ytx_rollInAnimationWithDurationTime:
- ytx_rollOutAnimationWithDurationTime:

### Zoom Entrances
- ytx_zoomInAnimationWithDurationTime:
- ytx_zoomInLeftAnimationWithDurationTime:
- ytx_zoomInRightAnimationWithDurationTime:
- ytx_zoomInDownAnimationWithDurationTime:
- ytx_zoomInUpAnimationWithDurationTime:


### Slide Exits
- ytx_slideOutDownAnimationWithDurationTime:
- ytx_slideOutLeftAnimationWithDurationTime:
- ytx_slideOutRightAnimationWithDurationTime:
- ytx_slideOutUpAnimationWithDurationTime:

### Slide Entrances
- ytx_slideInDownAnimationWithDurationTime:
- ytx_slideInLeftAnimationWithDurationTime:
- ytx_slideInRightAnimationWithDurationTime:
- ytx_slideInUpAnimationWithDurationTime:

### Rotating Entrances
- ytx_rotateInDownLeftAnimationWithDurationTime:
- ytx_rotateInAnimationWithDurationTime:
- ytx_rotateInDownRightAnimationWithDurationTime:
- ytx_rotateInUpRightAnimationWithDurationTime:
- ytx_rotateInUpLeftAnimationWithDurationTime:

### Rotating Exits
- ytx_rotateOutDownLeftAnimationWithDurationTime:
- ytx_rotateOutAnimationWithDurationTime:
- ytx_rotateOutDownRightAnimationWithDurationTime:
- ytx_rotateOutUpRightAnimationWithDurationTime:
- ytx_rotateOutUpLeftAnimationWithDurationTime:

## List of CSShake
- ytx_basicShakeAnimation
- ytx_littleShakeAnimation
- ytx_slowShakeAnimation
- ytx_hardShakeAnimation
- ytx_horizontalShakeAnimation
- ytx_verticalShakeAnimation
- ytx_rotateShakeAnimation
- ytx_opacityShakeAnimation
- ytx_crazyShakeAnimation

## List of Magic.CSS
### Magic Effects
- ytx_magicAnimationWithDurationTime:
- ytx_twisterInDownAnimationWithDurationTime:
- ytx_twisterInUpAnimationWithDurationTime:
- ytx_swapAnimationWithDurationTime:

### Static Effects
- ytx_openDownLeftAnimationWithDurationTime:
- ytx_openDownRightAnimationWithDurationTime:
- ytx_openUpLeftAnimationWithDurationTime:
- ytx_openUpRightAnimationWithDurationTime:
- ytx_openDownLeftRetournAnimationWithDurationTime:
- ytx_openDownRightRetournAnimationWithDurationTime:
- ytx_openUpLeftRetournAnimationWithDurationTime:
- ytx_openUpRightRetournAnimationWithDurationTime:

### Static Effects Out
- ytx_openDownLeftOutAnimationWithDurationTime:
- ytx_openDownRightOutAnimationWithDurationTime:
- ytx_openUpLeftOutAnimationWithDurationTime:
- ytx_openUpRightOutAnimationWithDurationTime:

### Perspective Effects
- ytx_perspectiveDownAnimationWithDurationTime:
- ytx_perspectiveUpAnimationWithDurationTime:
- ytx_perspectiveLeftAnimationWithDurationTime:
- ytx_perspectiveRightAnimationWithDurationTime:
- ytx_perspectiveUpRetournAnimationWithDurationTime:
- ytx_perspectiveDownRetournAnimationWithDurationTime:
- ytx_perspectiveLeftRetournAnimationWithDurationTime:
- ytx_perspectiveRightRetournAnimationWithDurationTime:

### Rotate
- ytx_rotateDownAnimationWithDurationTime:
- ytx_rotateUpAnimationWithDurationTime:
- ytx_rotateLeftAnimationWithDurationTime:
- ytx_rotateRightAnimationWithDurationTime:

### Slide
- ytx_slideDownAnimationWithDurationTime:
- ytx_slideLeftAnimationWithDurationTime:
- ytx_slideRightAnimationWithDurationTime:
- ytx_slideUpAnimationWithDurationTime:
- ytx_slideDownRetournAnimationWithDurationTime:
- ytx_slideLeftRetournAnimationWithDurationTime:
- ytx_slideRightRetournAnimationWithDurationTime:
- ytx_slideUpRetournAnimationWithDurationTime:

### Math
- ytx_swashOutAnimationWithDurationTime:
- ytx_swashInAnimationWithDurationTime:
- ytx_foolishOutAnimationWithDurationTime:
- ytx_foolishInAnimationWithDurationTime:
- ytx_holeOutAnimationWithDurationTime:

### Tin
- ytx_tinDownInAnimationWithDurationTime:
- ytx_tinLeftInAnimationWithDurationTime:
- ytx_tinRightInAnimationWithDurationTime:
- ytx_tinUpInAnimationWithDurationTime:
- ytx_tinDownOutAnimationWithDurationTime:
- ytx_tinLeftOutAnimationWithDurationTime:
- ytx_tinRightOutAnimationWithDurationTime:
- ytx_tinUpOutAnimationWithDurationTime:

### Boing
- ytx_boingInUpAnimationWithDurationTime:
- ytx_boingOutDownAnimationWithDurationTime:

### On The Space
- ytx_spaceOutUpAnimationWithDurationTime:
- ytx_spaceOutRightAnimationWithDurationTime:
- ytx_spaceOutDownAnimationWithDurationTime:
- ytx_spaceOutLeftAnimationWithDurationTime:
- ytx_spaceInUpAnimationWithDurationTime:
- ytx_spaceInRightAnimationWithDurationTime:
- ytx_spaceInDownAnimationWithDurationTime:
- ytx_spaceInLeftAnimationWithDurationTime: