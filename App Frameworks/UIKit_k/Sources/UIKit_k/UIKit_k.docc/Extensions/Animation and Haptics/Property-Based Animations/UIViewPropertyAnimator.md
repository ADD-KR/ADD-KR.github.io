# ``UIViewPropertyAnimator``

@Metadata {
    @DocumentationExtension(mergeBehavior: override)
}

## Overview

> 최근 수정일: `2021-03-06`
> 
> [원문링크](https://developer.apple.com/documentation/uikit/uiviewpropertyanimator)

UIViewPropertyAnimator 객체를 사용하면 뷰 변경 사항을 애니메이션화할 수 있고, 애니메이션이 완료되기 전에 애니메이션을 동적으로 수정할 수 있습니다. 프로퍼티 애니메이터를 사용하면, 애니메이션을 처음부터 끝까지 정상적으로 실행하거나 상호적인(interactive) 애니메이션으로 전환하고 직접 타이밍을 제어할 수 있습니다. animator는 [frame](https://developer.apple.com/documentation/uikit/uiview/1622621-frame), [center](https://developer.apple.com/documentation/uikit/uiview/1622627-center), [alpha](https://developer.apple.com/documentation/uikit/uiview/1622417-alpha) 그리고 [transform](https://developer.apple.com/documentation/uikit/uiview/1622459-transform)과 같은 뷰의 animatable 프로퍼티에서 작동하여, 사용자가 제공한 블록에서 필요한 애니메이션을 만듭니다.

프로퍼티 애니메이터 객체를 생성할 때는, 다음을 지정합니다:

- 하나 이상의 뷰 프로퍼티를 수정하는 코드를 포함한 블록
- 실행 과정에서 애니메이션 속도를 정의하는 타이밍 곡선
- 애니메이션의 지속 시간(초단위)
- 애니메이션이 완료될 때 실행할 옵셔널 completion block

애니메이션 블록에서, animatable 프로퍼티의 값을 해당 뷰에 반영할 최종 값으로 설정합니다. 예를 들어 뷰를 fade out하려면, 블록에서 alpha 프로퍼티를 0으로 설정합니다. 프로퍼티 애니메이터 객체는 해당 프로퍼티의 값을 초기값에서 블록에서 지정한 새로운 값으로 조장하는 애니메이션을 생성합니다.

프로퍼티 값이 변경되는 속도는 프로퍼티 애니메이터를 생성할 때 지정한 타이밍 커브에 의해 제어됩니다. 프로퍼티 애니메이터는 linear, ease-in 그리고 ease-out과 같은 빌트인 UIKit 애니메이션 커브를 지원합니다. 또한 cubic Bezier curve 또는 spring 함수를 사용해 애니메이션 타이밍을 제어할 수 있습니다.

표준 이니셜라이저 중 하나를 사용해 애니메이터를 생성할 경우, 애니메이션을 명시적으로 시작하기 위해 [startAnimation()](https://developer.apple.com/documentation/uikit/uiviewanimating/1649786-startanimation) 메서드를 호출해야 합니다. 만약 애니메이터 생성 직후 애니메이션을 시작하고 한다면, 표준 이니셜라이저 대신 [runningPropertyAnimator(withDuration:delay:options:animatons:completion:)](https://developer.apple.com/documentation/uikit/uiviewpropertyanimator/1648367-runningpropertyanimator) 메서드를 사용하세요.

이 클래스는 애니메이션 시작, 중지 및 수정을 위한 메서드를 정의하는 [UIViewanimating](https://developer.apple.com/documentation/uikit/uiviewanimating)과 [UIViewImplictlyAnimating](https://developer.apple.com/documentation/uikit/uiviewimplicitlyanimating) 프로토콜을 채택합니다. 이 프로토콜들의 메서드에 대한 더 자세한 내용은 [UIViewanimating](https://developer.apple.com/documentation/uikit/uiviewanimating)과 [UIViewImplictlyAnimating](https://developer.apple.com/documentation/uikit/uiviewimplicitlyanimating)에서 확인하세요.

### 동적 애니메이션 수정

프로퍼티 애니메이터를 사용하면 애니메이션의 타이밍과 실행을 프로그래밍적으로 제어할 수 있습니다. 특히, 다음 작업을 할 수 있습니다:

- 시작, 일시중지, 재개 그리고 중지. [UIViewAnimating](https://developer.apple.com/documentation/uikit/uiviewanimating) 프로토콜의 메서드를 확인하세요.
- [addAnimations(\_:)](https://developer.apple.com/documentation/uikit/uiviewpropertyanimator/1648374-addanimations)과 [addAnimations(_:delayFactor:)](https://developer.apple.com/documentation/uikit/uiviewpropertyanimator/1648370-addanimations) 메서드를 사용해 기존 애니메이션 시작 후 애니메이션 블록을 추가합니다.
- [fractionComplete](https://developer.apple.com/documentation/uikit/uiviewanimating/1649787-fractioncomplete) 프로퍼티를 수정해 일시정지된 애니메이션을 건너뜁니다.(Scrub through)
- [isReversed](https://developer.apple.com/documentation/uikit/uiviewanimating/1649804-isreversed) 프로퍼티를 사용해 애니메이션의 방향을 변경합니다.
- 애니메이션을 일시중지해 부분적으로 완료된 애니메이션의 타이밍 및 지속시간을 수정하고, [continueAnimation(withTimingParameters:durationFactor:)](https://developer.apple.com/documentation/uikit/uiviewpropertyanimator/1648371-continueanimation) 메서드를 사용해 완료합니다.

대부분의 기본동작은 이 클래스가 채택한 [UIViewAnimating](https://developer.apple.com/documentation/uikit/uiviewanimating) 프로토콜 프로퍼티에 의해 제어됩니다. 이러한 메서드와 프로퍼티를 사용해 애니메이션을 시작, 일시중지, 재개 및 중지합니다. 또한 이 메서드와 프로퍼티를 사용해 애니메이션을 건너뛰고 방향을 변경할 수 있습니다. 이 클래스의 메서드와 프로퍼티를 사용해 애니메이션 블록 자체를 수정하고 타이밍 정보를 업데이트합니다.

## Topics

### Initializing a Property Animator

- ``UIViewPropertyAnimator/init(duration:curve:animations:)``
- ``UIViewPropertyAnimator/init(duration:controlPoint1:controlPoint2:animations:)``
- ``UIViewPropertyAnimator/init(duration:dampingRatio:animations:)``
- ``UIViewPropertyAnimator/init(duration:timingParameters:)``
- ``UIViewPropertyAnimator/runningPropertyAnimator(withDuration:delay:options:animations:completion:)``

### Modifying Animations

- ``UIViewPropertyAnimator/addAnimations(_:)``
- ``UIViewPropertyAnimator/addAnimations(_:delayFactor:)``
- ``UIViewPropertyAnimator/addCompletion(_:)``
- ``UIViewPropertyAnimator/continueAnimation(withTimingParameters:durationFactor:)``

### Accessing the Animation Parameters

- ``UIViewPropertyAnimator/duration``
- ``UIViewPropertyAnimator/delay``
- ``UIViewPropertyAnimator/timingParameters``
- ``UIViewPropertyAnimator/isInterruptible``
- ``UIViewPropertyAnimator/isUserInteractionEnabled``
- ``UIViewPropertyAnimator/isManualHitTestingEnabled``
- ``UIViewPropertyAnimator/scrubsLinearly``
- ``UIViewPropertyAnimator/pausesOnCompletion``
