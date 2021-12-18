# Adding Structure to Your Documentation Pages

심볼을 쉽게 찾을 수 있도록 그룹 및 컬렉션으로 정렬합니다.

## Overview

기본적으로 DocC는 프로젝트에 대한 문서를 생성할 때 모든 공개 심볼을 나열하고 종류별로 그룹화하는 최상위 페이지를 생성합니다. 그런다음 프레임워크가 작동하는 방식과 및 다양한 심볼끼리의 연관성을 설명하는 추가 컨텍스트를 제공할 수 있습니다. 보다 맞춤화된 학습 경험을 위해서는 다음 접근 방법 중 하나 이상을 사용하세요:

- 문서 카탈로그의 메인 랜딩 페이지를 커스텀하여 프레임워크를 소개하고 최상위 심볼을 조직합니다.
- 매서드, 프로퍼티와 같은 중첩된 심볼을 구성하는 심볼별 확장 파일을 추가합니다.
- 컬렉션을 사용해 여러 심볼을 그룹화하고 문서 페이지 탐색에 계층구조를 도입합니다.

더 자세한 내용은 <doc:Writing-Symbol-Documentation-in-Your-Source-Files>를 참고하세요.

### 문서의 랜딩 페이지를 커스텀하세요

*랜딩 페이지*는 프레임워크에 대한 개요를 제공하고, 중요한 용어를 소개하며, 사용자의 학습 경로를 쉽게 하기 위해 *문서 카탈로그* 내의 리소스를 구성합니다. 이는 프레임워크의 주요 기능에 대해 논의하고, 사용자가 프레임워크를 사용하고 싶어할 때 동기를 부여할 수 있는 기회입니다.

문서 카탈로그가 포함되지 않은 프로젝트의 경우, DocC는 프레임워크의 심볼 문서에 대한 진입점을 제공하는 기본 랜딩 페이지를 생성합니다. 그러나 문서 카탈로그를 추가하면, 프레임워크 사용자에게 풍부하고 매력적인 경험을 재공하는 커스텀 랜딩 페이지를 포함할 수 있습니다.

![figure1](Adding-Structure-to-Your-Documentation-Pages-figure1.png)

프레임워크에 문서 카탈로그를 추가하면, Xcode는 자동으로 빈 랜딩 페이지를 포함합니다. 더 자세한 정보는 <doc:Documenting-a-Swift-Framework-or-Package>를 참고하세요.

문서 카탈로그에 랜딩 페이지를 수동으로 추가해야 하는 경우, 다음 단계를 따르세요:

1. Xcode의 Project navigator에서 문서 카탈로그를 선택합니다.
2. File > New > File 을 선택해 file template chooser를 엽니다.
3. Documentation 섹션에서 Empty 템플릿을 선택하고, Next를 클릭합니다. Xcode는 페이지 제목에 대한 플레이스홀더만 포함하는 마크다운 템플릿을 생성합니다.

![figure2](Adding-Structure-to-Your-Documentation-Pages-figure2.png)

프레임워크의 이름을 파일에 맞게 수정하세요. 예를 들어 `SlothCreator` 프레임워크의 경우, 파일 이름은 `filename은 SlothCreator.md`입니다.

랜딩 페이지 콘텐츠의 첫 번째 줄은 프레임워크의 이름으로, 앞에 하나의 해시(#)가 붙고 두개의 백틱(\`\`) 세트로 캡슐화됩니다.

```markdown
# ``SlothCreator``
```

> important: 사용하는 이름은 컴파일된 프레임워크의 프로덕트 이름과 일치해야 합니다.

새로운 문단을 만들려면 페이지 제목을 빈 줄로 따라갑니다. 그런 다음 DocC가 페이지의 초록 또는 요약으로 사용하는 단일 문장 또는 문장 조각을 추가합니다.

```markdown
# ``SlothCreator``

Catalog sloths you find in nature and create new adorable virtual sloths.
```

요약 다음에 다른 빈 줄을 추가한 다음 프레임워크를 소개하는 하나 이상의 단락을 추가하여 랜딩 페이지의 Overview 섹션을 구성합니다. 개요를 간략하게 유지하세요. 일반적으로 화면의 콘텐츠 분량보다 적습니다. 프레임워크의 모든 기능을 자세히 설명하지 마세요. 대신, 사용자가 프레임워크가 해결하는 문제를 이해하는 데 도움이 되는 콘텐츠를 제공하세요.

*문서 마크업*을 사용해 Overview를 작성하세요; 이미지, 목록, 다른 콘텐츠 및 심볼에 대한 링크를 포함할 수 있는 가벼운 마크업 언어입니다. 더 자세한 내용은 [Formatting Your Documentation Content](https://developer.apple.com/documentation/xcode/formatting-your-documentation-content)을 참고하세요.

커스텀 랜딩 페이지는 풍부한 콘텐츠를 제공하는 것 외에도 문서 계층 구조의 최상위 기호 및 기타 콘텐츠 구성을 제공합니다.

### Topic Groups를 사용해 최상위 심볼을 정렬하세요.

기본적으로 DocC는 프레임워크의 심볼을 종류별로 정렬합니다. 예를 들어, 컴파일러는 클래스, 구조체, 프로토콜 등에 대한 topic groups를 생성합니다. 그런 다음 해당 심볼 간의 관계를 설명하는 정보를 추가합니다.

사용자의 보다 쉬운 프레임워크 탐색을 위해, 심볼을 의미있는 이름을 가진 그룹으로 정렬하세요. 중요한 심볼은 페이지의 위쪽에 배치하고, supporting symbol은 다른 기호 안에 중첩하세요. 고유하고, 상호 배타적이며 명확한 의미를 지닌 그룹 이름을 사용하세요. 가장 잘 맞는 것을 찾기 위해 다양한 배열을 시도하세요.

![figure3](Adding-Structure-to-Your-Documentation-Pages-figure3.png)

기본 구성을 재정의하고 프레임워크의 최상위 심볼을 수동으로 정렬하려면, 프레임워크의 랜딩 페이지에 *Topics* 섹션을 추가하세요. 마크다운 파일의 이미 있는 콘텐츠 아래에 두 개의 해시(##)와 공백 그리고 `Topics` 키워드를 추가하세요.

```markdown
## Topics
```

Topics 헤더 뒤에 세 개의 해시(###)를 사용해 각 그룹에 대해 명명된 섹션을 생성하고, 각 섹션에 하나 이상의 최상위 심볼을 추가하세요. 각 심볼에 앞에는 대시(-)를 붙이고 두개의 백틱(\`\`)으로 캡슐화하세요. 

```markdown
## Topics

### Creating Sloths

- ``SlothGenerator``
- ``NameGenerator``
- ``Habitat``

### Caring for Sloths

- ``Activity``
- ``CareSchedule``
- ``FoodGenerator``
- ``Sloth/Food``
```

DocC는 두 개의 백틱 형식을 사용해 심볼 링크를 생성하고, 심볼의 타입 정보 및 요약을 추가합니다. 더 자세한 내용은 [Formatting Your Documentation Content](https://developer.apple.com/documentation/xcode/formatting-your-documentation-content)에서 확인하세요.

문서를 재빌드할 때, 문서뷰어는 위의 이미지와 같이 탐색 창과 프레임워크의 랜딩 페이지에 이런 조직 상의 변경 사항을 반영합니다.

### 확장 파일에 중첩 심볼을 정렬하세요.

모든 공개 심볼이 프레임워크의 최상위 수준에 나타나야하는 것은 아닙니다. 예를 들어, 클래스와 구조체는 메서드와 프로퍼티를 정의하고, 어떤 경우에는 중첩된 클래스 또는 구조체가 추가적인 계층의 수준을 시작합니다.

프레임워크의 랜딩 페이지와 마찬가지로, DocC는 타입에 따라 중첩 심볼에 대한 기본 topic groups을 생성합니다. 확장 파일을 사용해 이 기본 구성을 재정의하고 심볼에 보다 적절한 구조를 제공하세요.

![figure4](Adding-Structure-to-Your-Documentation-Pages-figure4.png)

특정 심볼에 대한 문서 카탈로그에 확장 파일을 추가하려면 다음을 수행하세요:

1. Xcode의 Project navigator에서 문서 카탈로그를 선택하세요.
2. File > New > File 을 선택하여 파일 템플릿 선택기를 엽니다.
3. Documentation 섹션에서 Extension File 템플릿을 선택하고 Next를 클릭합니다. Xcode는 기본 이름이 Extension.md인 새 확장 파일을 생성합니다.

![figure5](Adding-Structure-to-Your-Documentation-Pages-figure5.png)

`Extension.md` 파일에서 `Symbol` 플레이스홀더를 조직화하려는(organizing) 심볼의 이름으로 바꾸고 이에 따라 파일 이름을 바꿉니다.

```markdown
# ``SlothCreator/Sloth``
```

> Important: 확장 파일의 페이지 제목으로 반드시 프레임워크 또는 패키지의 이름을 포함하는 심볼의 절대경로를 사용해야합니다. DocC는 이 컨텍스트에서 심볼의 상대경로를 지원하지 않습니다. 

확장 파일 템플릿에는 작성할 준비가 된 하나의 그룹이 있는 Topics 섹션이 포함되어 있습니다. 또는 문서 카탈로그에 특정 심볼에 대한 확장 파일이 이미 포함되어 있는 경우, 이전 섹션의 단계에 따라 `Topics` 섹션을 추가하세요.

랜딩 페이지와 마찬가지로, 세 개의 해시(###)를 사용하여 각 topic 그룹에 대한 명명된 섹션을 만들고, 두 개의 백틱(\`\`) 구문을 사용해 각 섹션에 필요한 심볼을 추가합니다. 

```markdown
# ``SlothCreator/Sloth``

## Topics

### Creating a Sloth

- ``init(name:color:power:)``
- ``SlothGenerator``

### Activities

- ``eat(_:quantity:)``
- ``sleep(in:for:)``

### Schedule

- ``schedule``
```

> Tip: 문서 계층 구조의 다른 곳에서 심볼을 포함하려면 심볼의 전체 경로를 사용하세요.

확장 파일에서 중첩된 심볼을 정렬한 후, Product > Build Documentation 를 선택해 변경 사항을 컴파일하고 Xcode의 문서 뷰어에서 검토하세요.

### 탐색에서 계층을 통합하세요.

랜딩 페이지나 확장 파일에서 심볼을 조직하는 것과 마찬가지로, 심볼 컬렉션을 만들어 문서에 계층을 추가하거나 프레임워크의 타입 계층에서 정의한 것과 다른 관계가 있는 심볼을 그룹화할 수 있습니다. 더 자세한 내용은 <doc:Adding-Supplemental-Content-to-a-Documentation-Catalog>에서 확인하세요. 

컬렉션은 다음 두 가지를 제외하고는 articles과 거의 동일합니다:

- 컬렉션에는 `Topics` 섹션이 포함되어 있는데, 이 섹션은 DocC에게 article이 아닌 컬렉션으로 처리하도록 지시합니다.
- 컬렉션에는 섹션으로 나누기에 충분한 설명 콘텐츠가 거의 없습니다. 요약 및 Overview 섹션을 포함합니다. Overview가 길어지면, article로 변환하고 컬렉션의 topic 그룹 중 하나에서 링크하는 것을 고려하세요.

컬렉션을 링크하려면, 부등호(\<), `doc` 키워드, 콜론(:), 컬렉션 이름 및 부등호(\>)를 사용하세요. 이름에 컬렉션의 파일 확장자를 포함하지 마세요.

```markdown
### Creating Sloths

- <doc:SlothGenerators>
```

DocC는 컬렉션의 파일 이름을 URL로 사용하고, 링크 텍스트로 페이지 제목을 사용합니다.

컬렉션은 문서의 순서를 지정하는 중요한 도구이지만, 너무 많은 수준의 계층을 생성하면 사용자에게 혼란을 줄 수도 있습니다. 상위 수준의 topic 그룹이 동일한 결과를 얻을 수 있는 경우에는 컬렉션을 사용하지 마세요.
