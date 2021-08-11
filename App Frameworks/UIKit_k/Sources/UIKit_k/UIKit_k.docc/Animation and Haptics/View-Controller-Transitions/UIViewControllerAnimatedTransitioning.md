# ``UIKit_k/UIViewControllerAnimatedTransitioning``

커스텀 뷰컨트롤러 트랜지션에 대한 애니메이션을 구현하기 위한 메서드 집합

## Overview

이 프로토콜의 메서드를 사용하면 고정된 시간 내에 뷰컨트롤러를 화면 안팎으로 전환하기 위한 애니메이션을 생성하는 애니메이션 객체를 정의할 수 있습니다. 이 프로토콜을 사용해 만드는 애니메이션은 인터랙티브하지 않아야 합니다. 인터랙티브 트랜지션을 생성하려면, 애니메이터 객체를 애니메이션 타이밍을 제어하는 다른 객체와 결합해야합니다.

애니메이터 객체에서, ``transitionDuration(using:)`` 메서드를 구현해 트랜지션 지속시간을 지정하고 ``animateTransition(using:)`` 메서드를 구현해 애니메이션 자체를 생성합니다. 트랜지션에 관련된 객체에 대한 정보는 컨텍스트 객체의 형태로 animateTransition(using:) 메서드에 전달됩니다. 이 객체에서 제공하는 정보를 사용해 지정된 지속시간 동안 타겟 뷰컨트롤러의 뷰를 화면 안팎으로 이동합니다.

[UIViewControllerTransitioningDelegate](https://developer.apple.com/documentation/uikit/uiviewcontrollertransitioningdelegate) 프로토콜을 준수하는 객체인 트랜지셔닝 델리게이트에서 애니메이터 객체를 만드세요. 뷰컨트롤러가 나타날 떄, presentation style을 [UIModalPresentationStyle.custom](https://developer.apple.com/documentation/uikit/uimodalpresentationstyle/custom) 으로 설정하고 트랜지셔닝 델리게이트를 뷰컨트롤러의 [transitioningDelegate](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621421-transitioningdelegate) 프로퍼티에 할당합니다. 뷰컨트롤러는 트랜지셔닝 델리게이트에서 애니메이터 객체를 검색하고 이를 사용해 애니메이션을 수행합니다. 뷰컨트롤러가 나타나고(presenting), 사라질(dismissing) 때 사용되는 애니메이터 객체를 따로 제공할 수 있습니다. 

뷰컨트롤러 트랜지션에 사용자 인터랙션을 추가하려면, [UIViewControllerInteractiveTransitioning](https://developer.apple.com/documentation/uikit/uiviewcontrollerinteractivetransitioning) 프로토콜을 채택한 커스텀 객체인 **인터랙티브 애니메이터 객체**와 함께 애니메이터 객체를 사용해야 합니다. 인터랙티브 트랜지션 정의에 대한 자세한 내용은 [UIViewControllerInteractiveTransitioning](https://developer.apple.com/documentation/uikit/uiviewcontrollerinteractivetransitioning) 을 참조하세요.

## Topics

### Performing a Transition

- ``animateTransition(using:)``
- ``animationEnded(_:)``

### Reporting Transition Duration

- ``transitionDuration(using:)``

### Returning an Interruptible Animator

- ``interruptibleAnimator(using:)``

## See Also

### Non-Interactive Transitions

- ``UIViewControllerContextTransitioning``
