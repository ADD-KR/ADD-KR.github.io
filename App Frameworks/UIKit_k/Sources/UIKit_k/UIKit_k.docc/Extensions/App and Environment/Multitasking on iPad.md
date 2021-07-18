# Multitasking on iPad

멀티태스킹 API를 구현하여 앱을 iPadOS와 원활하게 통합합니다.

## Overview

> 최근 수정일: `2021-03-03`
> 
> [원문링크](https://developer.apple.com/documentation/uikit/app_and_environment/multitasking_on_ipad)

앱이 iPad의 foreground에서 실행되는 동안, 다른 앱도 함께 실행될 수 있습니다. 앱이 실행될 수 있는 환경을 인식하고 멀티태스킹 API를 채택하는 것은 앱을 iPadOS와 통합하는데에 있어 필수적인 부분입니다.

사용자에게 훌륭한 멀티태스킹 경험을 제공하기 위한 첫 번째 단계는 앱이 다양한 window 크기에 맞는 레이아웃을 지원하는 것입니다. [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)의 [Adaptivity and Layout](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/adaptivity-and-layout/) 섹션을 읽는 것 부터 시작해보세요. 또한,  앱이 전체화면으로 실행되지 않고 Slide Over 또는 Split View를 통해 더 작은 window에서 실행될 수 있음을 고려하세요. [UITraitCollection](https://developer.apple.com/documentation/uikit/uitraitcollection)을 사용해 앱의 환경을 검색하고 Auto Layout을 사용하거나, 뷰컨트롤러 또는 뷰에서  traitCollectionDidChange(_:)을 재정의하여 앱의 환경 변경에 대응하세요(adapt to it).

iPadOS 13 이상에서는 [UIApplicationSupportsMultipleScenes](https://developer.apple.com/documentation/bundleresources/information_property_list/uiapplicationscenemanifest/uiapplicationsupportsmultiplescenes) property list key를 설정해 앱 UI의 여러 창이 동시에 실행되도록 선택할 수 있습니다. [UISceneDelegate](https://developer.apple.com/documentation/uikit/uiscenedelegate)가 시스템 멀티태스킹 이벤트와 상호작용하는 방법에 대한 개요는 [Scenes](https://developer.apple.com/documentation/uikit/app_and_environment/scenes) 를 구현하고, [Managing Your App's Life Cycle](Managing_App_Life_Cycle.md) 를 참조하세요.

## Topics

### Adaptivity

- [`class UITraitCollection`](https://developer.apple.com/documentation/uikit/uitraitcollection)

  가로 및 세로 사이즈 클래스, 디스플레이 비율, 사용자 인터페이스 종류(pad, phone 등)와 같은 trait을 포함한 앱의 iOS 인터페이스 환경

- [`protocol UITraitEnvironment`](https://developer.apple.com/documentation/uikit/uitraitenvironment)

  앱에서 iOS 인터페이스 환경을 사용할 수 있도록하는 메서드 집합

- [`protocol UIAdaptivePresentationControllerDelegate`](https://developer.apple.com/documentation/uikit/uiadaptivepresentationcontrollerdelegate)

  Presentation controller와 함께 앱의 trait 변경에 응답하는 방법을 결정하는 메서드 집합

- [`protocol UIContentContainer`](https://developer.apple.com/documentation/uikit/uicontentcontainer)

  뷰 컨트롤러의 콘텐츠를 크기 및 trait 변경에 맞게 조정하는 메서드 집합 

---

### Scene 관리

- <doc:Scenes>

  여러 앱 UI 인스턴스를 동시에 관리하고, 리소스를 적절한 인스턴스로 분배하세요.

- [Supporting Multiple Windows on iPad](https://developer.apple.com/documentation/uikit/uiscenedelegate/supporting_multiple_windows_on_ipad)

  인터페이스의 side-by-side 인스턴스를 지원하고 드래그 앤 드롭으로 간단하게 새 window를 생성합니다.


