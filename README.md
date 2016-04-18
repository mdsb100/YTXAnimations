# YTXAnimations

[![CI Status](http://img.shields.io/travis/baidao/YTXAnimations.svg?style=flat)](https://travis-ci.org/baidao/YTXAnimations)
[![Version](https://img.shields.io/cocoapods/v/YTXAnimations.svg?style=flat)](http://cocoapods.org/pods/YTXAnimations)
[![License](https://img.shields.io/cocoapods/l/YTXAnimations.svg?style=flat)](http://cocoapods.org/pods/YTXAnimations)
[![Platform](https://img.shields.io/cocoapods/p/YTXAnimations.svg?style=flat)](http://cocoapods.org/pods/YTXAnimations)

Reference [animate.css](https://daneden.github.io/animate.css/)

![YTXAnimations](https://github.com/baidao/YTXAnimations/blob/master/YTXAnimations.gif)

## Usage
```objective-c
#import <YTXAnimations/UIView+YTXAnimateCSS.h>

CAAnimation * tada = [view ytx_tadaAnimtionWithDurationTime:1];
tada.repeatCount = CGFLOAT_MAX;
```

```objective-c
//removeAnimationForKey the key is function name. Please pay attention to colon!!! "ytx_tadaAnimtionWithDurationTime:"
[view.layer removeAnimationForKey:@"ytx_tadaAnimtionWithDurationTime:"];
```

## Installation

YTXAnimations is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "YTXAnimations"
```

## License

YTXAnimations is available under the MIT license. See the LICENSE file for more info.

## If you use YTXAnimations in one of your apps, I'd love to hear about it.

## List of animation
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