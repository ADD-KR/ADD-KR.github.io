# Writing Symbol Documentation in Your Source Files

심볼을 사용하는 방법을 설명하는 레퍼런스 문서를 심볼에 추가하세요.

## Overview

잘 만들어진 API의 일반적인 특징은 읽기 쉽고 거의 그 자체로 문서가 된다는 것입니다. 하지만 API만으로는 다음 항목들 처럼 명확한 문서와 같은 중요한 정보를 전달할 수 없습니다:
- 프레임워크 또는 패키지의 전반적인 아키텍처
- API 구성요소 간의 관계 및 의존성
- API를 사용 시 발생하는 경계 조건, 부작용 및 오류

예를 들어, DocC는 다음 메소드에 대한 문서에 항목을 생성하지만, 메서드를 호출할 때 어떤 일이 발생하는지 또는 전달하는 값에 제한이 있는지에 대한 자세한 내용은 전달하지 않습니다.

```swift
// Eat the provided specialty sloth food.
mutating public func eat(_ food: Food, quantity: Int) throws -> Int {
    ...
}
```

API를 사용하는 사람들이 API를 더 잘 이해할 수 있도록 아래 섹션의 단계에 따라 프로젝트의 공개 심볼에 문서 주석을 추가하세요. DocC는 이 주석을 컴파일하고, 사용자와 공유하는 형식화된 문서를 생성합니다.

### 각 심볼에 대한 기본 설명 추가

훌륭한 문서를 작성하기 위한 첫 번째 단계는 단일 문장 초록 또는 요약을 추가하고, 필요한 경우 *Discussion* 섹션을 프레임워크의 각 공개 심볼에 추가하는 것입니다. 

요약은 심볼을 설명하고, 추가적인 세부 정보로 이름을 보완합니다. 요약을 짧고 정확하게 유지하세요. 이상적으로는 150자 이하의 단일 문장이나 문장의 단편을 사용하세요. 일반적인 텍스트를 사용하고 링크, 기술 용어 또는 다른 심볼 이름을 포함하지 마세요. 요약은 Xcode의 Quick Help, 코드 완성 제안 및 DocC가 생성하는 문서 페이지에 나타납니다.

심볼이 두 개의 포워드 슬래시(//)로 시작하는 소스 주석을 가졌다면, 문서 주석으로 변환하기 위해 추가 포워드 슬래시(/)를 삽입하세요. DocC는 문서 주석의 첫 번째 라인을 요약으로 사용합니다.

```swift
/// Eat the provided specialty sloth food.
mutating public func eat(_ food: Food, quantity: Int) throws -> Int {
```

> Tip: DocC는 멀티라인 문서 주석도 지원합니다. 포워드 슬래시와 두 개의 애스터리스크 (/\**)로 주석을 시작하고 애스터리스크와 포워드 슬래시(*/)로 종료하세요. 중간에 추가한 콘텐츠는 문서가 됩니다. 

그렇지 않으면, Xcode의 Code Actions 메뉴를 사용해 작성할 템플릿을 생성합니다. 소스 에디터의 심볼을 Command-click하고 Code Actions 메뉴의 Add Documentation을 선택하세요.

![figure1](Writing-Symbol-Documentation-in-Your-Source-Files-figure1.png)

Description 플레이스홀더를 심볼의 요약으로 대치하세요.

> Tip: Add Documentation 액션은 심볼의 타입을 알아보고 매개변수 및 반환 값과 같은 필요한 모든 요소에 대한 플레이스홀더를 포함한 템플릿을 생성합니다.

요약을 추가한 후, 심볼을 Option-click하여 Xcode의 Quick Help에서 변경사항을 리뷰하세요. Summary 헤더의 마로 아래에 추가한 텍스트가 표시됩니다.

![figure2](Writing-Symbol-Documentation-in-Your-Source-Files-figure2.png)

예를 들어 심볼에 대한 추가 콘텐츠를 제공해야하는 경우, Discussion 섹션을 생성하기 위해 심볼의 요약 바로 아래에 하나 이상의 단락을 추가하세요. 포함하는 내용은 문서화하는 심볼의 타입에 따라 다릅니다:
- 프로퍼티의 경우, 해당 속성이 부모에 어떤 영향을 미치는지 설명하세요. 일반적인 사용법과 허용되는 것 또는 기본 값을 설명하세요.
- 메서드의 경우, 사용 패턴과 부작용 또는 추가적인 동작에 대해 설명하세요. 메서드가 비동기로 실행되는지 아니면 비용이 많이 드는 작업을 수행하는지 강조하세요.
- 열거형의 케이스 또는 상수의 경우, 나타내는 것을 간결하게 설명하세요.

텍스트를 별도의 단락으로 나누려면 빈 라인을 삽입하세요.

```swift
/// Eat the provided specialty sloth food.
///
/// Sloths love to eat while they move very slowly through their rainforest 
/// habitats. They are especially happy to consume leaves and twigs, which they 
/// digest over long periods of time, mostly while they sleep.
/// 
/// When they eat food, a sloth's `energyLevel` increases by the food's `energy`.
mutating public func eat(_ food: Food, quantity: Int) throws -> Int {
```

추가한 모든 단락은 Xcode의 Quick Help의 Discussion 헤더 아래 및 DocC가 생성한 심볼의 레퍼런스 페이지에 나타납니다.

Discussion 섹션을 추가한 후, Quick Help를 호출하여 업데이트된 문서 주석을 보세요. 또는 Product > Build Documentation을 선택하여 프레임워크의 문서를 컴파일하고 문서 뷰어에서 이를 여세요.

![figure3](Writing-Symbol-Documentation-in-Your-Source-Files-figure3.png)

Discussion 섹션에 대한 콘텐츠를 작성할 때, *documentation markup*을 사용하세요. 자세한 정보는 [Formatting Your Documentation Content](https://developer.apple.com/documentation/xcode/formatting-your-documentation-content)를 확인하세요.

### 메서드의 매개변수 설명

매개변수를 가진 메서드의 경우, 요약 바로 아래에 해당 매개변수를 문서화하거나 Discussion 섹션에 문서화하세요(Discussion 섹션을 포함한다면). 매개변수의 목적과 필요한 경우, 허용되는 값의 범위에 대해 설명하세요.

DocC는 메서드의 매개변수를 문서화하기 위한 두개의 접근 방식을 지원합니다. *Parameters* 섹션 또는 하나 이상의 *parameter fileds*를 추가할 수 있습니다. 이는 모두 마크다운의 리스트 구문을 사용합니다. 

Parameter 섹션은 `Paramaters` 키워드가 포함된 단일 리스트 아이템으로 시작하여 콜론(:)으로 끝납니다. 각 매개변수는 중첩된 리스트 아이템으로 나타납니다. 콜론은 매개변수의 이름과 설명을 구분합니다. 

```swift
/// - Parameters:
///   - food: The food for the sloth to eat.
///   - quantity: The quantity of the food for the sloth to eat.
mutating public func eat(_ food: Food, quantity: Int) throws -> Int {
```

Parameter fileds는 부모 리스트 아이템을 생략하고, 각 리스트 아이템이 리스트 아이템 마커와 매개변수의 이름 사이에 `Parameter` 키워드를 포합합니다.

```swift
/// - Parameter food: The food for the sloth to eat.
/// - Parameter quantity: The quantity of the food for the sloth to eat.
mutating public func eat(_ food: Food, quantity: Int) throws -> Int {
```

메서드 매개변수에 대한 문서를 추가하면 Xcode의 Quick Help과 Product > Build Documentation 을 선택할 때 DocC가 생성하는 심볼 레퍼런스 페이지에 나타납니다.

![figure4](Writing-Symbol-Documentation-in-Your-Source-Files-figure4.png)

### 매서드의 반환 값 설명

값을 반환하는 메서드의 경우 문서 주석에 *Returns* 섹션을 포함하여 반환된 값을 설명합니다. 반환 값이 옵셔널인 경우, 메서드가 `nil`을 반환하는 시점에 대한 정보를 제공하세요.

문서 주석에서 Returns 섹션을 추가하는 위치에 대한 제한은 없지만, 요약 뒤에 위치해야하고, Discussion 섹션이 포함된 경우에는, Discussion 섹션 뒤에 위치해야 합니다.

Returns 섹션에는 `Returns` 키워드를 포함하는 단일 리스트 아이템이 있습니다. 반환 값 설명은 콜론(:) 뒤에 옵니다.


```swift
/// - Returns: The sloth's energy level after eating.
mutating public func eat(_ food: Food, quantity: Int) throws -> Int {
```

> Note: DocC는 단일 Returns 섹션을 지원합니다. 둘 이상의 섹션을 포함하면 정의되지 않은 동작이 발생합니다.

DocC가 생성한 심볼 레퍼런스 페이지와 Xcode의 Quick Help에서 Returns 섹션을 확인할 수 있습니다.

![figure5](Writing-Symbol-Documentation-in-Your-Source-Files-figure5.png)

### 메서드의 Thrown 에러 설명

메서드가 에러를 던질 수 있는 경우, 문서 주석에 *Throws* 섹션을 추가하세요. 메서드가 에러를 발생시키는 상황을 설명하고, 가능한 에러 타입을 나열하세요.

Returns 섹션과 비슷하게, Throws 섹션을 추가하는 위치에 대한 제한은 없지만, 요약 뒤에 위치해야하고, Discussion 섹션이 포함된 경우에는, Discussion 섹션 뒤에 위치해야 합니다.

Throws 섹션에는 `Throws` 키워드를 포함하는 단일 리스트 아이템이 있습니다. 에러 설명은 콜론(:) 뒤에 옵니다.

```swift
/// - Throws: `SlothError.tooMuchFood` if the quantity is more than 100.
mutating public func eat(_ food: Food, quantity: Int) throws -> Int {
```

> Note: DocC는 단일 Returns 섹션을 지원합니다. 둘 이상의 섹션을 포함하면 정의되지 않은 동작이 발생합니다.

Throws 섹션은 심볼의 레퍼런스 페이지, Quick Help 팝업 및 Command-Option-3을 사용하여 볼 수 있는 Quick Help 인스펙터에 나타납니다.

![figure6](Writing-Symbol-Documentation-in-Your-Source-Files-figure6.png)

### 심볼 문서를 위한 풍부한 경험 생성

이전에 언급한 각 섹션을 포함하는 문서 주석은 다음 예제와 같이 단일 소스 주석보다 개발자에게 훨씬 더 많은 정보를 제공합니다.

```swift
/// Eat the provided specialty sloth food.
///
/// Sloths love to eat while they move very slowly through their rainforest 
/// habitats. They're especially happy to consume leaves and twigs, which they 
/// digest over long periods of time, mostly while they sleep.
///
/// When they eat food, a sloth's `energyLevel` increases by the food's `energy`.
///
/// - Parameters:
///   - food: The food for the sloth to eat.
///   - quantity: The quantity of the food for the sloth to eat.
///
/// - Returns: The sloth's energy level after eating.
///
/// - Throws: `SlothError.tooMuchFood` if the quantity is more than 100.
mutating public func eat(_ food: Food, quantity: Int) throws -> Int {
```

또한, DocC에는 심볼에 대해 더욱 풍부한 문서를 만들 수 있는 기능이 포함되어 있습니다.
- 프레임워크에서 다른 심볼을 참조할 때 *code voice* 대신 *심볼 링크(symbol links)*를 사용합니다. 심볼 링크를 사용하면 문서 뷰어에서 프레임워크의 문서를 빠르게 탐색할 수 있으며, Quick Help를 사용하면 팝오버와 인스펙터에서 프레임워크 문서를 표시할 수 있습니다. 더 자세한 정보는 [Formatting Your Documentation Content](https://developer.apple.com/documentation/xcode/formatting-your-documentation-content)를 확인하세요.
- *확장 파일(extension files)*을 사용해 코드 예제 및 이미지와 같은 심볼에 대한 추가 콘텐츠를 제공하고, in-source 주석의 크기를 관리가능한 수준으로 유지하세요. 더 자세한 정보는 [Adding Supplemental Content to a Documentation Catalog](https://developer.apple.com/documentation/xcode/adding-supplemental-content-to-a-documentation-catalog)를 확인하세요.
