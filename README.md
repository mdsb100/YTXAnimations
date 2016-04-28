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

CAAnimation * tada = [view ytx_tadaAnimtionWithDurationTime:1];
tada.repeatCount = CGFLOAT_MAX;

[view ytx_basicShakeAnimtion];

```

```objective-c
//removeAnimationForKey the key is function name. Please pay attention to colon!!! "ytx_tadaAnimtionWithDurationTime:"
[view.layer removeAnimationForKey:@"ytx_tadaAnimtionWithDurationTime:"];

// No colon
[view.layer removeAnimationForKey:@"ytx_basicShakeAnimtion"];
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
- ytx_jelloAnimtionWithDurationTime:
- ytx_wobbleAnimtionWithDurationTime:
- ytx_swingAnimtionWithDurationTime:
- ytx_rubberBandAnimtionWithDurationTime:
- ytx_pluseAnimtionWithDurationTime:
- ytx_flashAnimtionWithDurationTime:
- ytx_bounceAnimtionWithDurationTime:
- ytx_tadaAnimtionWithDurationTime:
- ytx_shakeAnimtionWithDurationTime:

### Bouncing Entrances
- ytx_bounceInAnimtionWithDurationTime:
- ytx_bounceInDownAnimtionWithDurationTime:
- ytx_bounceInLeftAnimtionWithDurationTime:
- ytx_bounceInRightAnimtionWithDurationTime:
- ytx_bounceInUpAnimtionWithDurationTime:

### Bouncing Exits
- ytx_bounceOutAnimtionWithDurationTime:
- ytx_bounceOutDownAnimtionWithDurationTime:
- ytx_bounceOutLeftAnimtionWithDurationTime:
- ytx_bounceOutRightAnimtionWithDurationTime:
- ytx_bounceOutUpAnimtionWithDurationTime:

### Fading Entrances
- ytx_fadeInAnimtionWithDurationTime:
- ytx_fadeInDownAnimtionWithDurationTime:
- ytx_fadeInDownBigAnimtionWithDurationTime:
- ytx_fadeInLeftAnimtionWithDurationTime:
- ytx_fadeInLeftBigAnimtionWithDurationTime:
- ytx_fadeInRightAnimtionWithDurationTime:
- ytx_fadeInRightBigAnimtionWithDurationTime:
- ytx_fadeInUpAnimtionWithDurationTime:
- ytx_fadeInUpBigAnimtionWithDurationTime:

### Fading Exits
- ytx_fadeOutAnimtionWithDurationTime:
- ytx_fadeOutDownAnimtionWithDurationTime:
- ytx_fadeOutDownBigAnimtionWithDurationTime:
- ytx_fadeOutLeftAnimtionWithDurationTime:
- ytx_fadeOutLeftBigAnimtionWithDurationTime:
- ytx_fadeOutRightAnimtionWithDurationTime:
- ytx_fadeOutRightBigAnimtionWithDurationTime:
- ytx_fadeOutUpAnimtionWithDurationTime:
- ytx_fadeOutUpBigAnimtionWithDurationTime:

### Zoom Exits
- ytx_zoomOutAnimtionWithDurationTime:
- ytx_zoomOutDownAnimtionWithDurationTime:
- ytx_zoomOutLeftAnimtionWithDurationTime:
- ytx_zoomOutRightAnimtionWithDurationTime:
- ytx_zoomOutUpAnimtionWithDurationTime:

### Flippers
- ytx_flipAnimtionWithDurationTime:
- ytx_flipInXAnimtionWithDurationTime:
- ytx_flipInYAnimtionWithDurationTime:
- ytx_flipOutXAnimtionWithDurationTime:
- ytx_flipOutYAnimtionWithDurationTime:

### LightSpeed
- ytx_lightSpeedInAnimtionWithDurationTime:
- ytx_lightSpeedOutAnimtionWithDurationTime:

### Special
- ytx_hingeAnimtionWithDurationTime:
- ytx_rollInAnimationWithDurationTime:
- ytx_rollOutAnimationWithDurationTime:

### Zoom Entrances
- ytx_zoomInAnimtionWithDurationTime:
- ytx_zoomInLeftAnimtionWithDurationTime:
- ytx_zoomInRightAnimtionWithDurationTime:
- ytx_zoomInDownAnimtionWithDurationTime:
- ytx_zoomInUpAnimtionWithDurationTime:


### Slide Exits
- ytx_slideOutDownAnimtionWithDurationTime:
- ytx_slideOutLeftAnimtionWithDurationTime:
- ytx_slideOutRightAnimtionWithDurationTime:
- ytx_slideOutUpAnimtionWithDurationTime:

### Slide Entrances
- ytx_slideInDownAnimtionWithDurationTime:
- ytx_slideInLeftAnimtionWithDurationTime:
- ytx_slideInRightAnimtionWithDurationTime:
- ytx_slideInUpAnimtionWithDurationTime:

### Rotating Entrances
- ytx_rotateInDownLeftAnimtionWithDurationTime:
- ytx_rotateInAnimtionWithDurationTime:
- ytx_rotateInDownRightAnimtionWithDurationTime:
- ytx_rotateInUpRightAnimtionWithDurationTime:
- ytx_rotateInUpLeftAnimtionWithDurationTime:

### Rotating Exits
- ytx_rotateOutDownLeftAnimtionWithDurationTime:
- ytx_rotateOutAnimtionWithDurationTime:
- ytx_rotateOutDownRightAnimtionWithDurationTime:
- ytx_rotateOutUpRightAnimtionWithDurationTime:
- ytx_rotateOutUpLeftAnimtionWithDurationTime:

## List of CSShake
- ytx_basicShakeAnimtion
- ytx_littleShakeAnimtion
- ytx_slowShakeAnimtion
- ytx_hardShakeAnimtion
- ytx_horizontalShakeAnimtion
- ytx_verticalShakeAnimtion
- ytx_rotateShakeAnimtion
- ytx_opacityShakeAnimtion
- ytx_crazyShakeAnimtion

## List of Magic.CSS
### Magic Effects
- ytx_magicAnimtionWithDurationTime:
- ytx_twisterInDownAnimtionWithDurationTime:
- ytx_twisterInUpAnimtionWithDurationTime:
- ytx_swapAnimtionWithDurationTime:
### Static Effects
- ytx_openDownLeftAnimtionWithDurationTime:
- ytx_openDownRightAnimtionWithDurationTime:
- ytx_openUpLeftAnimtionWithDurationTime:
- ytx_openUpRightAnimtionWithDurationTime:
- ytx_openDownLeftRetournAnimtionWithDurationTime:
- ytx_openDownRightRetournAnimtionWithDurationTime:
- ytx_openUpLeftRetournAnimtionWithDurationTime:
- ytx_openUpRightRetournAnimtionWithDurationTime:
### Static Effects Out
- ytx_openDownLeftOutAnimtionWithDurationTime:
- ytx_openDownRightOutAnimtionWithDurationTime:
- ytx_openUpLeftOutAnimtionWithDurationTime:
- ytx_openUpRightOutAnimtionWithDurationTime:
### Perspective Effects
- ytx_perspectiveDownAnimtionWithDurationTime:
- ytx_perspectiveUpAnimtionWithDurationTime:
- ytx_perspectiveLeftAnimtionWithDurationTime:
- ytx_perspectiveRightAnimtionWithDurationTime:
- ytx_perspectiveUpRetournAnimtionWithDurationTime:
- ytx_perspectiveDownRetournAnimtionWithDurationTime:
- ytx_perspectiveLeftRetournAnimtionWithDurationTime:
- ytx_perspectiveRightRetournAnimtionWithDurationTime:
### Rotate
- ytx_rotateDownAnimtionWithDurationTime:
- ytx_rotateUpAnimtionWithDurationTime:
- ytx_rotateLeftAnimtionWithDurationTime:
- ytx_rotateRightAnimtionWithDurationTime:
### Slide
- ytx_slideDownAnimtionWithDurationTime:
- ytx_slideLeftAnimtionWithDurationTime:
- ytx_slideRightAnimtionWithDurationTime:
- ytx_slideUpAnimtionWithDurationTime:
- ytx_slideDownRetournAnimtionWithDurationTime:
- ytx_slideLeftRetournAnimtionWithDurationTime:
- ytx_slideRightRetournAnimtionWithDurationTime:
- ytx_slideUpRetournAnimtionWithDurationTime:
### Math
- ytx_swashOutAnimtionWithDurationTime:
- ytx_swashInAnimtionWithDurationTime:
- ytx_foolishOutAnimtionWithDurationTime:
- ytx_foolishInAnimtionWithDurationTime:
- ytx_holeOutAnimtionWithDurationTime:
### Tin
- ytx_tinDownInAnimtionWithDurationTime:
- ytx_tinLeftInAnimtionWithDurationTime:
- ytx_tinRightInAnimtionWithDurationTime:
- ytx_tinUpInAnimtionWithDurationTime:
- ytx_tinDownOutAnimtionWithDurationTime:
- ytx_tinLeftOutAnimtionWithDurationTime:
- ytx_tinRightOutAnimtionWithDurationTime:
- ytx_tinUpOutAnimtionWithDurationTime:
### Boing
- ytx_boingInUpAnimtionWithDurationTime:
- ytx_boingOutDownAnimtionWithDurationTime:
### On The Space
- ytx_spaceOutUpAnimtionWithDurationTime:
- ytx_spaceOutRightAnimtionWithDurationTime:
- ytx_spaceOutDownAnimtionWithDurationTime:
- ytx_spaceOutLeftAnimtionWithDurationTime:
- ytx_spaceInUpAnimtionWithDurationTime:
- ytx_spaceInRightAnimtionWithDurationTime:
- ytx_spaceInDownAnimtionWithDurationTime:
- ytx_spaceInLeftAnimtionWithDurationTime: