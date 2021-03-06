# 문서 작성 가이드

**애플 개발자 공식 문서**와 동일하게 작성하기 위한 가이드입니다. 애플의 문서를 그대로 한국어로 표현할 수 있다면, 이 문서에 명시된 규칙을 모두 준수할 필요는 없습니다.  만약 가이드에 명시되어 있지 않은 부분이나, 수정이 필요하다고 생각되는 부분이 있으면 언제든지 이슈를 생성해 기여해주세요!

## 작성 단계 

### 프레임워크를 생성해야 하는 경우

1. 프레임워크의 이름을 가진 Swift Package를 생성합니다.
   - 애플 프레임워크와의 중복을 방지하기 위해 접미사(_k)를 사용합니다. (ex: Xcode_k)
2. [디렉토리 구조](##디렉토리 구조 )에 맞춰 패키지 하위에 Package.swift와 Sources 디렉토리를 제외한 모든 파일 및 디렉토리를 삭제합니다.
3. [디렉토리 구조](##디렉토리 구조 )에 맞춰 `Sources/프레임워크 이름` 디렉토리 하위에 Definition 디렉토리와 프레임워크 이름을 가진 문서 카탈로그를 생성합니다.
4. 3에서 생성한 문서 카탈로그 하위에 프레임워크의 이름을 가진 마크다운 파일을 생성합니다.
5. [다음 단계](###해당 프레임워크에 대한 설정이 이미 완료되어 있는 경우)를 따라 문서를 작성합니다.

### 해당 프레임워크에 대한 설정이 이미 완료되어 있는 경우

1. [작성 규칙](##작성 규칙 )에 따라 문서를 작성하고 [디렉토리 구조](##디렉토리 구조 )에 따라 올바른 곳에 문서를 위치시킵니다.
2. Xcode의 Product > Build Documentation를 사용해 문서를 빌드하고, 애플 문서와 비교하여 차이점이 없는지 확인합니다.
3. 워크스페이스(ADD-KR)에 작업한 문서와 매칭되는 애플 문서 링크를 검색하여 작업한 문서로 대치합니다.
   - 같은 프레임워크의 문서의 경우: <doc:> 키워드를 사용해 매칭
   - 다른 프레임워크의 문서의 경우: 준비중

## 디렉토리 구조 

Xcode > Developer Documentation의 구조를 따릅니다.

- 섹션(ex: Developer Tools)
  - 프레임워크별 패키지(ex: Xcode_k)
    - 애플 프레임워크와의 중복을 방지하기 위해 접미사(_k)를 사용합니다.
    - Package.swift
    - Sources
      - 프레임워크 이름과 같은 이름의 디렉토리(ex: Xcode_k)
        - Definition
          - 소스 코드 파일은 프레임워크의 디렉토리 구조와 같은 구조로 관리됩니다.
          - 소스 코드는 문서화를 위한 심볼 정의가 목적이기 때문에, 빌드 성공을 위해 빈 구현 또는 유효하지 않은 구현이 포함될 수 있습니다.
          - 확장 파일이 필요없는 경우, 소스 문서 주석으로 문서화합니다.
          - 소스 코드 파일이 없으면 빌드에 실패하기 때문에 소스 코드 파일이 없는 프레임워크의 경우 빈 파일인 `draft.swift`를 포함합니다.
        - 문서 카탈로그(ex: Xcode_k.docc)
          - 프레임워크에 따른 디렉토리 구조를 가집니다.
          - 아티클이 아닌 하위 문서를 가지는 API 컬렉션 또는 심볼 문서는 구조화를 위해 같은 이름의 디렉토리를 생성한 후 해당 디렉토리의 하위에 같은 이름의 문서를 생성합니다.
          - Resources
            - 이미지, 동영상 등 문서에 포함되는 리소스입니다.
            - 프레임워크의 따른 디렉토리 구조를 가집니다.

## 작성 규칙 

> DocC 문서에 명시되어 있는 부분은 생략되어 있습니다. 기본적인 DocC 사용 방법 및 문법은 DocC 문서를 참고해주세요.

### 기본

- 반드시 애플 개발자 공식 문서와 동일한 문법 및 형식을 사용하세요.
- 모든 헤더(H1, H2, H3)는 번역하지 않고 영어 그대로 기재하세요.
  - 링킹될 가능성이 크기 때문입니다.
  - 주로 H1은 문서의 제목 또는 심볼의 이름, H2는 Overview, Topics과 같은 DocC 규칙을 따르는 헤더(커스텀 불가능), H3은 H2 하위의 섹션을 나타내는 헤더(커스텀 가능)로 사용됩니다.
  - H2인 See Also는 사용자 지정이 불가능합니다. 문서화하지말고 무시하세요.
- 심볼마다 Availability를 명시하면 좋으나, 반드시 명시할 필요는 없습니다. 자유롭게 명시하세요.
- 번역이 애매하거나 어려운 용어 및 개발 용어는 영어 그대로 사용하거나, 번역 후 괄호를 사용해 영어를 함께 명시하세요.
  - ex) GitHub -> 깃허브, low-level, 메서드, 프로퍼티, 구조체, 코드 블록(code voice) 등

### 파일 관리

-  `<doc:> 키워드를 사용했을 때 콜론(:) 뒤의 텍스트 + figure + 문서 내에서 이미지 순서`를 이미지 이름으로 사용하세요.
  - Appearance 모드에 따라 이미지 변경이 필요한 경우에는 확장자 앞에 `~dark`, `~light` 키워드를 사용하세요.
    - 애플 홈페이지에서 다운로드한 이미지 이름에 `~dark` 또는 `~light` 키워드가 포함된 경우에만 시스템 설정을 변경해 두 이미지 모두 다운로드한 후, 리소스로 추가하면 됩니다.
    - 반드시 모든 Appearance 모드를 지원할 필요는 없으나, 기본적으로는 dark 모드를 사용해야 합니다.
  - ex) Distributing-Documentation-to-External-Developers-figure2~light.png
- 패키지를 추가할 때에는, 반드시 상대경로를 사용해 `xcodebuild -list` 명령어를 어떤 환경에서 사용해도 모든 패키지가 출력될 수 있도록 합니다.
  - 자세한 내용은 기존에 추가되어 있는 그룹 및 패키지를 확인해주세요.

### 링킹

- 동일한 문서의 헤더를 링크하는 경우, 마크다운 링크 형식을 사용하며, 링크로 한 개의 해시(#)와 함께 헤더 이름을 사용하세요.
  - 공백은 대시(-)로 대체하세요. 
  - ex) \[Link to Symbols and Other Content](#Link-to-Symbols-and-Other-Content)
- 동일한 프레임워크의 문서를 링크하는 경우, DocC 문법에 따라 링크하세요.
- 번역 전인 문서를 링크하는 경우, 애플 개발자 공식 문서의 링크를 사용하세요.
  - ex) \[Writing Symbol Documentation in Your Source Files](https://developer.apple.com/documentation/xcode/writing-symbol-documentation-in-your-source-files)
- ~~외부 프레임워크의 문서를 링크하는 경우,~~ 준비중(DocC에 해당 기능이 추가된 후 반영 예정)
- 이미지를 링크하는 경우, 표시되는 이름은 `figure + 문서 내에서 이미지 순서`만 사용하고, 링크는 파일명만 사용하세요.
  - ex)`![figure2](Distributing-Documentation-to-External-Developers-figure2)`

## Tips(Optional)

- 문서 업데이트 이력은 커밋 이력으로 확인 가능합니다.
- 배포 방법 및 단계는 [블로그](https://daeun28.github.io/github_pages를_사용한_docc_호스팅/post32/)를 참고해주세요.
