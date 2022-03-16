# Migrating Your Objective-C Code to Swift

마이그레이션 시 권장하는 단계를 학습하세요.

## Overview

Objective-C 앱의 일부를 Swift로 대체하여 아키텍쳐, 로직, 성능을 개선할 수 있습니다. 상호 운영성을 통해 Swift로 마이그레이션된 기능을 번거로움 없이 Objective-C 코드에 통합할 수 있습니다. Swift에서 전체 앱을 다시 작성할 필요가 없습니다.

### Clean Up Your Code

Objective-C 코드베이스를 정리하고 현대화(modernizing)하여 Objective-C 코드와 Swift 코드가 최적의 호환성을 갖도록 하세요. 예를 들어, 코드베이스의 nullablilty 어노테이션을 추가하지 않은 부분이 있는 경우 이제 추가해야 합니다. 현대 코딩 방식을 따라야 Swift와 더 효과적으로 상호작용할 수 있습니다.

### Migrate Your Code

Swift 코드로 마이그레이션하는 가장 효과적인 접근 방식은 파일 단위, 즉 한 번에 하나의 클래스를 기반으로 하는 것입니다. Objective-C에서는 Swift클래스를 서브클래싱할 수 없기 때문에 앱에서 하위 클래스가 없는 클래스를 선택하는 것이 가장 좋습니다. 해당 클래스의 `.m`과 `.h` 파일을 단일 `.swift` 파일로 교체합니다. 구현과 인터페이스의 모든 것이 이 단일 Swift 파일에 직접 들어갑니다. 헤더파일을 생성하지 않습니다. Xcode는 참조가 필요한 경우 헤더를 자동으로 생성합니다.

1. File > New > File > (iOS, watchOS, tvOS, or macOS) > Source > Swift File을 선택하여 Objective-C .m과 .h 파일에 상응하는 Swift 클래스를 생성하세요. Objective-C 클래스와 같거나 다른 이름을 사용할 수 있습니다. 클래스 접두사는 Swift에서 선택사항입니다.
2. 관련 시스템 프레임워크를 import합니다.
3. Swift 파일에서 같은 앱 타겟의 Objective-C 코드에 접근해야 하는 경우, Objective-C birdging header을 작성하세요.
4. Objective-C에서 Swift 클래스에 접근하고 다시 사용할 수 있도록 하려면, 자손(descendant)으로 만드세요. Objective-C에서 사용할 클래스의 특정 이름을 지정하려면, `@objc(name)`으로 표시합니다. 여기서 name은 Objective-C 코드가 Swift 클래스를 참조하는 데 사용하는 이름입니다.

#### As You Work

1. Objective-C 클래스를 서브클래싱하고, Objective-C 프로토콜을 채택하는 등의 방법을 Swift 클래스를 설정하여 Objective-C 동작을 통합할 수 있습니다.
2. Objective-C API로 작업할 때, Swift가 특정 Objective-C 언어 기능을 어떻게 번역하는지 알아야 합니다. 자세한 내용은 [Objective-C and C Code Customization](https://developer.apple.com/documentation/swift/objective-c_and_c_code_customization)을 참고하세요.
3. @objc(name) 속성을 사용해 필요한 경우 프로퍼티와 메서드에 대한 Objective-C 이름을 제공합니다.
4. `func`와 `class func`를 사용해 인스턴스(-)와 클래스(+) 메서드를 각각 나타냅니다.
5. 단순한 매크로를 전역 상수로 선언하고, 복잡한 매크로를 함수로 변환합니다.

#### After You Finish

1. 새로운 Swift 코드를 참조하도록 Objective-C 코드의 import 구문을(`#import "ProductModuleName-Swift.h"`로) 업데이트합니다.
2. 타겟 멤버십 체크박스를 선택해제하여 원본 Objective-C `.m` 파일을 타겟에서 제거합니다. 트러블 슈팅에 사용하기 위해 `.m`과 `.h` 파일을 바로 삭제하지 않습니다.
3. Swift 클래스를 다른 이름으로 변경했다면 Objective-C 이름 대신 Swift 클래스 이름을 사용하도록 코드를 수정합니다.

### Troubleshooting Tips and Reminders

마이그레이션 경험은 기존 코드베이스에 따라 다르지만, 프로세스 문제를 해결하는 데 도움이 되는 몇 가지 일반적인 단계와 도구는 다음과 같습니다:

- Objective-C에서 Swift 클래스를 서브클래싱할 수 없습니다. 따라서 마이그레이션하는 클래스는 Objective-C 서브 클래스를 가질 수 없습니다.
- 클래스를 Swift로 한 번 마이그레이션한 후에는 중복 심볼 오류를 방지하기 위해 빌드 하기 전에 타겟에서 상응하는 `.m` 파일을 제거해야 합니다.
- Objective-C에서 Swift 클래스를 사용가능하도록 하려면, Objective-C 클래스의 자손(descendant)으로 만드세요.
- 생성된 헤더를 보려면, Swift 클래스 이름을 Command-click하세요.
- 심볼을 Option-click하면 타입, 속성 및 문서 주석과 같은 암시적 정보를 볼 수 있습니다.
