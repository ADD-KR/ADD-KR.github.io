# Adding Supplemental Content to a Documentation Catalog

아티클 및 확장 파일을 포함하여 소스 문서 주석을 확장하거나 개념적인 컨텐츠 지원을 제공하세요.

## Overview

문서 카탈로그에는 소스 문서 주석을 보충하는 파일이 포함되어 있습니다. 문서 카탈로그가 포함할 수 있는 두 가지 유형의 파일은 *아티클*과 *extension* 파일입니다.

일반적으로, 소스 코드의 문서 주석은 특정 API의 작동하는 방식을 설명하지만, 프로젝트의 모든 부분이 개념적인 수준에서 어떻게 함께 맞춰지는지 설명하지 않는 경우가 많습니다. 문서 카탈로그에 아티클을 추가하는 것은 이런 개념적인 내용을 포함하는 한 가지 방법입니다. 아티클은 특정 심볼과 관련이 없는 정보가 포함된 마크업 파일입니다. 아티클을 사용하여:

- 패키지 또는 프레임워크의 개요를 포함하는 랜딩 페이지를 제공하세요.
- 시작 안내 가이드 또는 튜토리얼과 같이 독자가 프로젝트 사용 방법을 이해할 수 있는 학습 경로를 만드세요.

확장 파일은 소스 문서 주석을 보완하는 마크업 파일입니다. 확장 파일을 사용하여:

- 심볼에 포함된 프로퍼티와 메서드를 구성하세요.
- 소스 문서 주석 이외의 추가 콘텐츠를 제공하세요.
- 소스 문서 주석을 재정의하세요.

랜딩 페이지를 추가하고 확장 파일을 사용해 심볼을 구성하는 것에 대한 자세한 내용은 <doc:Adding-Structure-to-Your-Documentation-Pages>을 확인하세요.

훌륭한 문서를 만드는 과정은 예술입니다. 콘텐츠는 고유합니다. 소스 문서 주석 외에 어떤 요소가 독자에게 가장 큰 가치를 제공하는지 알고 있습니다. 프로젝트에 문서를 추가하고 문서 카탈로그를 생성하는 것에 대한 자세한 내용은 <doc:Documenting-a-Swift-Framework-or-Package>를 참고하세요.

### Add Articles to Explain Concepts or Describe Tasks

문서 카탈로그에 아티클을 추가하면 독자가 프로젝트의 타입과 메서드가 시스템으로 작동하는 방식을 이해하는 데 도움이 됩니다. 또한 이것은 작업을 완료하는 방법을 설명하거나 특정 심볼에 대한 Overview 섹션에 맞지 않는 더 넓은 개념에 대해 논의(discuss)할 수 있게 합니다.

예를 들어, 문서 카탈로그에 `GettingStarted.md`라는 이름의 아티클 파일이 있는 경우, XCode는 문서 뷰어에서 문서 아이콘과 함께 이 아티클을 표시합니다.

![figure1](Adding-Supplemental-Content-to-a-Documentation-Catalog-figure1)

아티클의 구조는 첫 번째 H1이 심볼 참조가 아닌 일반 콘텐츠라는 점을 제외하고는 심볼 파일이나 최상위 랜딩 페이지와 비슷합니다. 예를 들어, Getting Started with Sloths 아티클에는 제목, 단일 문장 초록 또는 요약, Overview 섹션이 포함되어 있습니다:

```markdown
# Getting Started with Sloths

Create a sloth and assign personality traits and abilities.

## Overview

Sloths are complex creatures that require careful creation and a suitable
habitat.
...
```

문서 카탈로그에 아티클을 추가하려면 다음을 수행하세요:

1. Xcode의 Project navigator에서 문서 카탈로그를 선택하세요.
2. File > New > File 을 선택해 파일 템플릿 선택화면을 여세요.
3. Documentation 섹션의 Article File 템플릿을 선택하고 Next를 클릭하세요. Xcode는 기본 이름과 함께 새로운 아티클 파일을 생성합니다.
4. 파일의 첫 번째 줄을 문서의 제목으로 수정하세요.
5. 파일의 요약 및 플레이스홀더를 적절한 콘텐츠로 대체하세요.

![figure2](Adding-Supplemental-Content-to-a-Documentation-Catalog-figure2)

Overview 섹션 다음에 추가 섹션 및 하위 섹션은 H2에 대해 이중 해시(##)를 사용하고 H3에 대해 삼중 해시(###)를 사용합니다. 해쉬 뒤에는 공백과 함께 다음 해당 섹션 또는 하위 섹션의 제목을 적습니다.

> Tip: 독자가 특정 작업을 수행하는 데 도움이 되도록 섹션을 사용하여 작업을 완료하는 데 필요한 단계를 안내합니다. 더 큰 개념의 경우 서로를 기반으로 하는 아티클 시리즈를 추가하는 것이 좋습니다.

문서 카탈로그에 아티클을 추가하면, DocC는 프로젝트의 최상위 페이지에 아티클에 대한 링크를 포함합니다. 아티클의 다른 위치를 선택하려면, 그룹 또는 컬렉션에서 아티클에 대한 링크를 추가하세요. DocC가 아티클에 대한 링크를 렌더링할 때 아티클의 제목을 링크의 텍스트로 사용합니다. 프로젝트 문서 구성에 대한 자세한 내용은 <doc:Adding-Structure-to-Your-Documentation-Pages>를 참고하세요.

### Add Extension Files to Append to or Override Source Documentation Comments

소스 파일에 문서 주석을 작성하면 많은 이점이 있지만 다음과 같이 소스 파일에서 콘텐츠를 분리하는 것이 더 나은 경우도 있습니다:

- 문서의 크기를 늘리고 소스 파일 관리를 어렵게 만드는 코드 목록이나 수많은 이미지를 포함하는 경우
- 소스 문서 주석이 코드 구현에 초점을 맞추고 외부 문서에 적합하지 않은 경우

이러한 경우 DocC는 소스 문서 주석을 확장 파일의 내용으로 보완하거나 완전히 대체하는 것을 지원합니다. 문서 카탈로그에 확장 파일을 추가하려면 다음을 수행하세요:

1. Xcode의 Project navigator에서 문서 카탈로그를 선택하세요.
2. File > New > File 을 선택해 파일 템플릿 선택화면을 여세요.
3. Documentation 섹션의 Extension File 템플릿을 선택하고 Next를 클릭하세요. Xcode는 기본 이름과 함께 새로운 확장 파일을 생성합니다.
4. 파일과 관련된 심볼을 식별하도록 파일의 첫 번째 줄을 수정합니다.

> Important: 확장 파일의 제목은 반드시 심볼의 절대경로를 사용해야하고, 프레임워크 또는 패키지의 이름을 포함해야 합니다. DocC는 이 컨텍스트에서 심볼의 상대경로를 지원하지 않습니다.

![figure3](Adding-Supplemental-Content-to-a-Documentation-Catalog-figure3)

심볼에 이미 소스 문서 주석이 있는 경우 `DocumentationExtension` 지시문을 추가하여 확장 파일의 내용이 소스 문서 주석에 추가되거나 재정의되는지 여부를 지정합니다. 다음 형식을 사용하여 심볼을 지정하는 파일의 첫 번째 줄 뒤에 `DocumentationExtension`을 추가합니다:

```
@Metadata {
    @DocumentationExtension(mergeBehavior: [append or override])
}
```

`mergeBehavior` 파라미터는 DocC가 소스 문서 주석의 맨 아래에 확장 파일의 내용을 추가할지 아니면 소스 문서 주석을 완전히 대체할지를 결정합니다.

소스 문서 주석에 확장 파일의 내용을 추가하려면 `mergeBehavior`에 대해 `append`를 사용하십시오. 예를 들어, `Sloth` 타입에 나무 늘보의 수면 습관에 대한 섹션을 추가하려면 확장 파일에 다음이 포함됩니다:

```
# ``SlothCreator/Sloth``

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
}

## Sleeping Habits

Sloths sleep in trees by curling into a ball and hanging by their claws.

```

또는 소스 문서 주석을 완전히 바꾸려면 `override`를 사용하십시오. 이 경우 DocC가 문서를 생성할 때 사용하는 지시문 뒤에 내용을 추가합니다. 예를 들어, SlothCreator에서 Sloth 유형의 소스 문서 주석을 대체하기 위해 확장 파일에는 다음이 포함됩니다:

```
# ``SlothCreator/Sloth``

@Metadata {
    @DocumentationExtension(mergeBehavior: override)
}

This overrides the in-source summary.

## Overview

This content overrides in-source content.
```

`Metadata` 및 기타 지시문에 대한 자세한 내용은 [Metadata](https://developer.apple.com/documentation/docc/metadata)를 참조하세요.
