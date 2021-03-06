# Formatting Your Documentation Content

텍스트, 링크 및 기타 페이지 요소에 대한 특별한 서식과 스타일을 사용하여 콘텐츠의 외형(presentation)을 향상시키십시오.

## Overview

경량 마크업 언어인 [Markdown](https://daringfireball.net/projects/markdown/syntax)을 사용해 문서의 구조와 스타일을 부여하세요. DocC에는 심볼 링킹, 향상된 이미지 지원, 용어 목록등과 같은 기능을 포함하도록 Markdown의 구문을 확장하는 커스텀 규칙(dialect)이 포함되어 있습니다.

일관된 구조와 스타일을 보장하려면 작성하는 모든 문서에 DocC의 문서 마크업을 사용하세요.

### Add a Page Title and Section Headers

페이지 제목을 추가하려면 해시(#)와 공백을 사용하려는 텍스트 앞에 둡니다. 아티클 또는 API 컬렉션의 페이지 제목에는 일반 텍스트만 사용하십시오.

```markdown
# Getting Started with Sloths
```

> Important: 페이지 제목은 문서 파일에서 콘텐츠의 첫 번째 줄이어야 합니다. 하나 이상의 빈 줄이 페이지 제목 앞에 올 수 있습니다.

프레임워크 랜딩 페이지나 확장 파일의 페이지 제목은 *심볼 링크*를 사용하세요. 심볼 링크를 생성하려면 프레임워크 이름 또는 심볼 이름(필요한 경우 프레임워크 내 계층 구조 포함)을 이중 백틱(\`\`) 세트로 래핑합니다.

```markdown
# ``SlothCreator``
# ``SlothCreator/CareSchedule/Event``
```

심볼 링크를 생성할 때 DocC는 Xcode와 통합되어 코드 완성 기능을 제공합니다. 자세한 내용은 [Link to Symbols and Other Content](#Link-to-Symbols-and-Other-Content)를 참조하십시오.

콘텐츠에 대한 추가 정보를 제공하는 짧고 간결한 한 문장 요약 또는 요약으로 모든 페이지 제목을 보강하십시오. 페이지 제목 바로 아래에 새 단락을 사용하여 요약을 추가합니다.

```markdown
# Getting Started with Sloths

Create a sloth and assign personality traits and abilities.
```

Overview 또는 Discussion 섹션에 대한 헤더를 추가하려면 이중 해시(##)와 공백을 사용한 다음, 두 용어 중 하나를 일반 텍스트로 포함합니다.

```markdown
## Overview
```

다른 모든 섹션 헤더의 경우, 트리플 해시(###)와 공백을 사용한 다음 헤더 제목을 일반 텍스트로 추가합니다.

```markdown
### Create a Sloth
```

프레임워크 랜딩 페이지, 최상위 페이지, 아티클 및 더 자세한 정보를 제공해야 하는 심볼 참조 페이지에서 이 유형의 섹션 헤더를 사용하십시오.

### Format Text in Bold, Italics, and Code Voice

DocC는 문서의 텍스트 서식을 지정하는 세 가지 방법을 제공합니다. 볼드 또는 기울임 스타일을 적용하거나 지정된 텍스트를 monospace 폰트로 렌더링하는 코드 보이스를 사용할 수 있습니다.

볼드 스타일을 적용하려면 텍스트를 이중 별표(\*\*)로 묶습니다. 또는 이중 밑줄(\_\_)을 사용합니다.

다음 예에서는 나무 늘보 이름에 볼드 스타일을 사용합니다:

```markdown
**Super Sloth**: Likes to eat sticks.
__Silly Sloth__: Prefers twigs for breakfast.
```

이탤릭체로 된 텍스트를 사용하여 독자에게 새로운 용어나 대체 용어를 소개합니다. 기울임 스타일을 추가하려면 단일 밑줄(\_) 또는 단일 별표(\*) 세트로 텍스트를 래핑합니다.

다음 예에서는 *metabolism* 및 _habitat_라는 단어에 기울임꼴을 사용합니다:

```markdown
A sloth's _metabolism_ is highly dependent on its *habitat*.
```

코드 블록(code voice)을 사용하여 인라인으로 심볼을 참조하거나 클래스 이름 또는 메서드 시그니처와 같은 짧은 코드 조각을 포함합니다. 코드 블록을 추가하려면 텍스트를 백틱(\`) 세트로 묶습니다.

다음 예에서 DocC는 monospace 폰트로 *ice*, *fire*, *wind*, *lightning*라는 단어를 렌더링합니다:

```markdown
If your sloth possesses one of the special powers: `ice`, `fire`, 
`wind`, or `lightning`.
```

> Note: 여러 줄의 코드를 포함하려면 코드 리스팅을 사용하세요. 자세한 내용은 [Add Code Listings](#Add-Code-Listings)에서 확인하세요.

Swift 프레임워크 또는 패키지 내에 나타나는 심볼을 참조할 때는 심볼 링크를 사용하십시오. 심볼 링크를 생성하려면 심볼 이름을 이중 백틱(\`\`) 세트로 묶습니다.

다음 예에서 DocC는 참조된 메서드를 monospace 글꼴로 렌더링하고 해당 문서 페이지에 대한 링크로 래핑합니다:

```markdown
You can increase the sloth's energy level by asking them to 
``eat(_:quantity:)`` or ``sleep(in:for:)``.
```

자세한 내용은 [Links to Symbols and Other Content](#Link-to-Symbols-and-Other-Content) 에서 확인하세요.

### Add Code Listings

DocC에는 코드 목록 또는 분리된 코드 블록에 대한 지원이 포함되어 있어 심볼 참조 페이지에서 찾을 수 있는 기본 선언 섹션을 넘어 프레임워크 채택자(adopters)에게 보다 완전한 코드 예제를 제공할 수 있습니다. 소스 내 심볼 문서, 확장 파일, 아티클 및 튜토리얼에 코드 목록을 포함할 수 있습니다.

코드 목록을 만들려면 새 단락을 시작하고 세 개의 백틱(\`\`\`)을 추가하세요. 그런 다음 백틱 바로 뒤에 프로그래밍 언어 이름을 소문자 텍스트로 추가합니다. 한 줄 이상의 코드를 추가한 다음 새 줄을 추가하고 백틱 세 개를 더 추가하여 코드 목록을 종료합니다.

```markdown
\```swift
struct Sightseeing: Activity {
    func perform(with sloth: inout Sloth) -> Speed {
        sloth.energyLevel -= 10
        return .slow
    }
}
\```
```

> Important: 코드 목록의 형식을 지정하는 경우, 문서를 컴파일할 때 DocC가 들여쓰기를 유지하도록 탭 대신 공백을 사용하여 줄을 들여쓰세요.

DocC는 올바른 구문 색상 형식을 적용하기 위해 지정한 프로그래밍 언어를 사용합니다. 위의 예에서 DocC는 다음과 같이 생성합니다:

```swift
struct Sightseeing: Activity {
    func perform(with sloth: inout Sloth) -> Speed {
        sloth.energyLevel -= 10
        return .slow
    }
}
```

### Link to Symbols and Other Content

DocC는 페이지 간 탐색을 활성화하기 위해 다음 링크 유형을 지원합니다.

Type | Usage
--- | ---
Symbol | 문서 내부의 심볼 참조 페이지를 링크합니다.
Article | 문서 카탈로그 내부의 아티클 또는 API 컬렉션을 링크합니다.
Tutorial | 문서 카탈로그 내부의 튜토리얼을 링크합니다.
Web | 외부 URL을 링크합니다.

여는 백틱 쌍을 입력하면 Xcode의 코드 완성 기능이 사용가능한 심볼 목록을 제공하며, 타이핑할 때마다 사용가능한 심볼 목록을 수정합니다. 또는 Esc 키나 Control-Space를 눌러 이 동작을 호출합니다.

중첩된 심볼의 경우, 심볼에 대한 전체 경로를 포함합니다.

```markdown
``SlothCreator/Sloth/eat(_:quantity:)``
```

> Tip: Xcode의 Quick Help는 소스 내 심볼 문서에 추가한 모든 링크를 표시하여 해당 콘텐츠에 대한 빠른 탐색을 제공합니다.

DocC는 심볼 링크가 나타나는 컨텍스트를 기준으로 심볼 링크를 확인합니다. 예를 들어, Sloth 클래스에 인라인으로 표시되고 해당 클래스의 심볼을 대상으로 하는 심볼 링크는 심볼 경로의 `SlothCreator/Sloth/` 부분을 생략할 수 있습니다.

경우에 따라 Swift의 오버로드된 메서드와 같이 심볼의 경로가 고유하지 않습니다. 예를 들어 여러 `update(_:)` 메서드가 있는 `Sloth` 구조체를 고려하세요.

```swift
/// Updates the sloth's power.
///
/// - Parameter power: The sloth's new power.
mutating public func update(_ power: Power) {
    self.power = power
}

/// Updates the sloth's energy level.
///
/// - Parameter energyLevel: The sloth's new energy level.
mutating public func update(_ energyLevel: Int) {
    self.energyLevel = energyLevel
}
```

두 방법 모두 `SlothCreator/Sloth/update(_:)`의 동일한 심볼 경로를 갖습니다. 이 시나리오에서 고유성을 보장하기 위해 DocC는 이름 대신 심볼의 고유 식별자를 사용하여 명확하게 합니다. 심볼 링크를 추가할 때 Escape 키 또는 Control-Space를 눌러 호출할 수 있는 Xcode의 코드 완성 기능을 사용하여 각 심볼에 대한 올바른 식별자를 삽입하세요.

```markdown
### Updating Sloths
- ``Sloth/update(_:)-4ko57``
- ``Sloth/update(_:)-jixx``
```

위의 예에서 두 심볼 경로는 텍스트 대소문자에 관계없이 동일합니다. 그러나 연결하는 심볼에 대해 DocC에 더 많은 컨텍스트를 제공해야 하는 또 다른 시나리오는 심볼 경로의 대소문자를 구분하지 않는 특성이 작용하는 경우입니다. 예를 들어 중첩된 `Color` 열거형와 `color` 프로퍼티가 있는 `Sloth` 구조체를 고려하세요.

```swift
public struct Sloth {
    public enum Color { }
    
    public var color: Color
}
```

심볼 경로는 대소문자를 구분하지 않으므로 두 심볼은 동일한 경로로 확인됩니다. 이 문제를 해결하려면 연결된 심볼 경로에 대상 타입에 접미사를 추가하십시오.

```markdown
``Sloth/Color-swift.enum``
```

DocC는 심볼 링크에 사용하기 위해 다음 심볼 유형을 지원합니다:

Symbol type | Suffix
--- | ---
Enumeration | `-swift.enum`
Enumeration case | `-swift.enum.case`
Protocol | `-swift.protocol`
Operator | `-swift.func.op`
Typealias | `-swift.typealias`
Function | `-swift.func`
Structure | `-swift.struct`
Class | `-swift.class`
Type property | `-swift.type.property`
Type method | `-swift.type.method`
Type subscript | `-swift.type.subscript`
Property | `-swift.property`
Initializer | `-swift.init`
Deinitializer | `-swift.deinit`
Method | `-swift.method`
Subscript | `-swift.subscript`

아티클에 대한 링크를 추가하려면 부등호(less-than) 기호(\<), `doc` 키워드, 콜론(:), 아티클 이름 및 부등호(greater-than) 기호(\>)를 사용하세요. 이름에 아티클의 파일 확장자를 포함하지 마세요.

```markdown
<doc:GettingStarted>
```

DocC가 링크를 확인할 때 아티클의 페이지 제목을 링크의 텍스트로 사용하고 아티클의 파일 이름을 링크의 URL로 사용합니다. 튜토리얼에 대한 링크는 경로에 `/tutorials/` 접두사를 추가해야 한다는 점을 제외하고 동일한 형식을 따릅니다.

```markdown
<doc:/tutorials/SlothCreator>
```

> Tip: \<doc:> 구문을 사용하여 심볼을 링크할 수도 있습니다. 콜론(:)과 마지막 부등호(greater-than) 기호(>) 사이에 심볼의 경로를 삽입하기만 하면 됩니다. 

심볼과 마찬가지로 Xcode의 코드 완성 기능은 \<doc:> 구문을 사용할 때 제안된 아티클 및 튜토리얼 목록을 제공합니다. 제안을 수동으로 호출하려면 링크를 삽입할 위치에서 Esc 키 또는 Control-Space를 누르세요.

일반 웹 링크를 포함하려면 대괄호([]) 세트와 괄호(()) 세트를 추가하세요. 그런 다음 대괄호 사이에 링크의 텍스트를 추가하고 괄호 안에 링크의 URL 대상을 추가합니다.

```markdown
[Apple](https://www.apple.com)
```

### Add Images to Your Content

DocC는 Markdown의 이미지 지원을 확장하여 이미지의 모양을 제공하고 scale-aware 버전을 표시할 수 있습니다. 특정 구성 요소를 사용하여 이미지 파일 이름을 만들고 DocC는 문서를 표시할 때 가장 적절한 버전의 이미지를 사용합니다.

![figure1](Formatting-Your-Documentation-Content-figure1)

Component | Description
--- | ---
Image name | **Required.** 문서 카탈로그 내에서 이미지를 식별합니다. 이름은 별도의 폴더에 저장하더라도 카탈로그의 모든 이미지에서 고유해야 합니다.
Appearance | **Optional** DocC가 이미지를 사용하는 appearance 모드(dark/light)를 식별합니다. 이미지 이름 바로 뒤에 `~dark`를 추가하여 이미지를 다크 모드 변형으로 식별합니다.
Display scale | **Optional** DocC에서 이미지를 사용하는 디스플레이 스케일을 식별합니다. 가능한 값은 `@1x`, `@2x` 및 `@3x`입니다. 디스플레이 스케일을 지정할 때 파일 확장자 바로 앞에 추가하십시오.
File extension | **Required.** .png 또는 .jpeg와 같은 이미지의 타입을 식별합니다.

예를 들어, 다음은 모두 유효한 DocC 이미지 파일이름입니다:

- term `sloth.png`: 모든 appearance 모드 및 디스플레이 스케일과 독립적인 이미지입니다.
- term `sloth~dark.png`: 다크 모드에만 해당되지만 디스플레이 스케일에 독립적인 이미지입니다.
- term `sloth~dark@2x.png`: 다크 모드와 2x 디스플레이 스케일에 특정한 이미지입니다.

> Important: 문서에 포함하는 이미지를 문서 카탈로그에 반드시 저장해야 합니다. 자세한 내용은 <doc:Documenting-a-Swift-Framework-or-Package>를 확인하세요.

이미지를 추가하려면, 느낌표(!)와 대괄호 세트([]), 괄호 세트(())를 사용하세요.

대괄호 사이에 이미지에 표시되는 내용에 대한 설명을 추가하세요.  VoiceOver와 같은 Screen readers는 이 텍스트를 소리 내어 읽습니다. 시각 장애가 있는 사람들이 이미지가 표시하는 내용을 이해할 수 있도록 충분한 세부 정보를 제공하세요.

괄호 안에는 이미지 이름만 포함하세요. appearance, 디스플레이 스케일 및 파일 확장자 구성 요소를 생략합니다. 문서 카탈로그의 폴더에 이미지를 저장하더라도 이미지 경로를 포함하지 마세요.

```markdown
![A sloth hanging off a tree.](sloth)
```

### Add Bulleted, Numbered, and Term Lists

DocC는 다음 목록 유형들을 지원합니다:

Type | Usage
--- | ---
Bulleted list | 임의의 순서로 나타날 수 있는 항목을 그룹화합니다.
Numbered list | 특정 순서로 일련의 이벤트를 설명합니다.
Term list | 일련의 용어 정의 쌍을 정의합니다.

> Important: 목록 항목 사이에 이미지나 코드 목록을 추가하지 마세요. Bulleted 및 Numbered 목록에는 두 개 이상의 항목이 포함되어야만 합니다.

Bulleted 목록을 생성하려면, 목록의 각 항목 앞에 별표(\*)와 공백을 추가하세요. 또는 별표(\*) 대신 대시(-) 또는 더하기 기호(+)를 사용하세요. 목록 마커는 서로 바꿔 사용할 수 있습니다.

```
* Ice
- Fire
* Wind
+ Lightning
```

Numbered 목록을 생성하려면 목록의 각 항목 앞에 단계 번호를 입력한 다음 마침표(.) 및 공백을 입력하세요.

```
1. Give the sloth some food.
2. Take the sloth for a walk.
3. Read the sloth a story.
4. Put the sloth to bed.
```

Term 목록을 생성하려면, 각 용어 앞에 대시(-)와 공백, `term` 키워드 및 다른 공백을 추가하세요. 그런 다음 용어 뒤에 콜론(:), 공백 및 정의를 추가하세요.

```
- term Ice: Ice sloths thrive below freezing temperatures.
- term Fire: Fire sloths thrive at boiling temperatures.
- term Wind: Wind sloths thrive at soaring altitudes.
- term Lightning: Lightning sloths thrive in stormy climates.
```

용어 및 해당 정의를 포함한 목록 항목의 텍스트는 다른 텍스트와 동일한 스타일 속성을 사용할 수 있으며 심볼을 비롯한 다른 콘텐츠에 대한 링크를 포함할 수 있습니다.

### Add Tables of Data

DocC에는 정보를 구성하는 데 사용할 수 있는 표에 대한 지원이 포함되어 있습니다.

표를 만들려면 새 단락을 시작하고, 대시(-)를 사용하여 열을 정의하고, 파이프(|)를 열 구분 기호로 사용합니다. 표를 구성하려면 최소한 세 개의 행이 필요합니다:

- 열 이름이 포함된 행
- 각 열에 대해 세개 이상의 대시(-)만 포함된 대시(-)만 포함하는 셀이 있는 행
- 하나 이상의 콘텐츠 행

```
| Sloth speed  | Description                           |
| ------------ | ------------------------------------- | 
| `slow`       | Moves slightly faster than a snail.   |
| `medium`     | Moves at an average speed.            |
| `fast`       | Moves faster than a hare.             |
| `supersonic` | Moves faster than the speed of sound. |
```

열 너비를 반드시 지정할 필요는 없습니다. 열은 가장 넓은 셀의 내용을 사용하여 너비를 결정합니다. 선행 및 후행 파이프 또한 생략할 수도 있습니다.

```
Sloth speed | Description
--- | ---
`slow` | Moves slightly faster than a snail.
`medium` | Moves at an average speed.
`fast` | Moves faster than a hare.
`supersonic` | Moves faster than the speed of sound.
```

위의 두 예제 모두 같은 결과가 나타납니다:

Sloth speed | Description
--- | ---
`slow` | Moves slightly faster than a snail.
`medium` | Moves at an average speed.
`fast` | Moves faster than a hare.
`supersonic` | Moves faster than the speed of sound.

> Note: 표 셀은 여러 단락, 목록 또는 코드 목록을 지원하지 않습니다.

표 셀의 텍스트는 다른 텍스트와 동일한 스타일 속성을 사용할 수 있으며 심볼을 비롯한 다른 콘텐츠에 대한 링크를 포함할 수 있습니다.

### Add Notes and Other Asides

추가 조언을 제공하거나 일반적인 오류 또는 필수 구성에 대해 경고하기 위해 독자의 주의를 끌고 싶은 상황이 있을 수 있습니다. 이러한 상황에서는 aside를 사용하십시오.

DocC는 다음 유형의 asides를 지원합니다:

Type | Usage
--- | ---
Note | 일부 사용자에게 적용되는 일반적인 정보입니다.
Important | 요구사항과 같은 중요한 정보입니다.
Warning | 잠재적인 데이터 손실 또는 복구 불가능한 상태와 같은 중요한 정보입니다.
Tip | 단축어, 제안 또는 힌트와 같은 유용힌 정보입니다.
Experiment | 학습 목표를 강화하거나 개발자가 프레임워크의 다른 부분을 시도하도록 권장하는 교육 정보입니다.

aside를 생성하려면, 부등호(greater-than) 기호, 공백 추가, aside 유형, 콜론(:), aside의 콘텐츠와 함께 새 줄을 시작하세요.

```markdown
> Tip: Sloths require sustenance to perform activities.
```

위 예제의 경우, DocC는 다음 aside를 렌더링합니다.

> Tip: Sloths require sustenance to perform activities.

aside의 텍스트는 다른 텍스트와 동일한 스타일 속성을 사용할 수 있으며 심볼을 비롯한 다른 콘텐츠에 대한 링크를 포함할 수 있습니다.

### Include Special Characters in Text

하나 이상의 특수 문자를 사용하려면 각 문자 앞에 백슬래시(\)를 붙입니다.

예를 들어, 줄 시작 부분에 별표(\*)를 표시하고 DocC에서 Bulleted 목록 항목으로 변환하지 못하도록 하려면 바로 앞에 백슬래시를 배치합니다.

```
\* Not a bulleted list item.
```

단일(\*) 또는 이중(\*\*) 별표를 사용하여 각각 기울임 또는 볼드 스타일을 적용하는 경우 텍스트에 포함된 별표를 이스케이프 처리하여 DocC가 스타일을 조기에 종료하지 않도록 할 수 있습니다.

```
*Sloths require sustenance\* to perform activities.*

**Sloths require sustenance\*\* to perform activities.**
```
