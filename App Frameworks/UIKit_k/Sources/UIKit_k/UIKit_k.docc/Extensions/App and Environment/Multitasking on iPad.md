# Multitasking on iPad

멀티태스킹 API를 구현하여 앱을 iPadOS와 원활하게 통합합니다.

## Overview

앱이 iPad의 foreground에서 실행되는 동안, 다른 앱도 함께 실행될 수 있습니다. 앱이 실행될 수 있는 환경을 인식하고 멀티태스킹 API를 채택하는 것은 앱을 iPadOS와 통합하는데에 있어 필수적인 부분입니다.

사용자에게 훌륭한 멀티태스킹 경험을 제공하기 위한 첫 번째 단계는 앱이 다양한 window 크기에 맞는 레이아웃을 지원하는 것입니다. [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)의 [Adaptivity and Layout](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/adaptivity-and-layout/) 섹션을 읽는 것 부터 시작해보세요. 또한,  앱이 전체화면으로 실행되지 않고 Slide Over 또는 Split View를 통해 더 작은 window에서 실행될 수 있음을 고려하세요. [UITraitCollection](https://developer.apple.com/documentation/uikit/uitraitcollection)을 사용해 앱의 환경을 검색하고 Auto Layout을 사용하거나, 뷰컨트롤러 또는 뷰에서  traitCollectionDidChange(_:)을 재정의하여 앱의 환경 변경에 대응하세요(adapt to it).

iPadOS 13 이상에서는 [UIApplicationSupportsMultipleScenes](https://developer.apple.com/documentation/bundleresources/information_property_list/uiapplicationscenemanifest/uiapplicationsupportsmultiplescenes) property list key를 설정해 앱 UI의 여러 창이 동시에 실행되도록 선택할 수 있습니다. [UISceneDelegate](https://developer.apple.com/documentation/uikit/uiscenedelegate)가 시스템 멀티태스킹 이벤트와 상호작용하는 방법에 대한 개요는 <doc:Scenes> 를 구현하고, <doc:Managing-Your-App's-Life-Cycle> 를 참조하세요.

## Topics


### Scene 관리

- <doc:Scenes>
