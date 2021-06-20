# App and Environment

life-cycle 이벤트 및 앱의 UI scene을 관리하고, 앱이 실행되는 traits 및 환경에 대한 정보를 얻으세요.

## Overview

> 최근 수정일: `2021-03-06`
> 
> [원문링크](https://developer.apple.com/documentation/uikit/app_and_environment)

iOS 13 이상 버전에서, 사용자는 사용자 인터페이스의 여러 인스턴스를 동시에 만들고 관리할 수 있고, app switcher를 사용해 인스턴스 간의 전환이 가능합니다. iPad에서 사용자는 앱의 여러 인스턴스를 나란히 표시할 수도 있습니다. UI의 각 인스턴스는 다른 콘텐츠를 표시하거나, 다른 방식으로 동일한 콘텐츠를 표시합니다. 예를 들어, 사용자는  특정 날짜를 표시하는 캘린더 앱의 한 인스턴스와 한달 전체를 표시하는 다른 인스턴스를 나타낼 수 있습니다.

UIKit은 기기 설정, 인터페이스 설정 및 사용자 선호도의 조합을 반영한 trait collections을 사용해 현재 환경에 대한 세부 정보를 전달합니다. 예를 들어, traits를 사용해 현재 뷰 또는 뷰컨트롤러에 대해 다크모드가 활성화되어 있는지 감지합니다. 현재 환경을 기반으로 콘텐츠를 커스텀하려면 ``UIView`` 또는 [UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller) 객체의 현재 trait collection을 참조하세요. trait 변경사항 알림을 받기 원할 때는 [UITraitEnvironment](https://developer.apple.com/documentation/uikit/uitraitenvironment) 프로토콜을 채택하세요.

## Topics

### 생명 주기

- <doc:Managing-Your-App's-Life-Cycle>
- <doc:Scenes>

### 멀티태스킹

- 
