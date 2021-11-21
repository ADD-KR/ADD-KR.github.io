# Documenting a Swift Framework or Package

in-source 주석으로부터 풍부하고 매력적인 문서를 만들고, 프로젝트에 문서 카탈로그를 추가하여 추가 콘텐츠를 제공하세요.

## Overview

*DocC* 또는 *문서 컴파일러*를 사용하면 Swift 프레임워크 및 패키지에 대한 문서를 쉽게 생성할 수 있습니다. 컴파일러는 in-source 주석과 함께 Xcode의 프로젝트의 extension 파일, articles 및 기타 리소스를 결합하여 문서를 작성하므로 개발자를 위한 풍부하고 매력적인 문서를 만들 수 있습니다.

DocC를 사용하면 레퍼런스 및 개념적인 콘텐츠의 조합을 제공하고 강력한 구성 및 링킹 기능을 사용하여 이를 연결할 수 있습니다. 컴파일러는 Xcode와 직접 통합되어 코드 완성, 빠른 도움말 등을 포함한 기존 워크플로우를 향상시킵니다. 또한 소스에서 직접 문서를 작성하기 때문에 Git과 같이 이미 익숙한 도구를 사용하여 변경 사항을 추적할 수 있습니다.

### 소스 주석에서 간단한 문서 빌드

Xcode는 DocC는 문서를 컴파일하기 위해, 먼저 Swift 프레임워크 또는 패키지를 빌드하고 컴파일된 artifact와 함께 공개(public) API에 대한 추가 정보를 저장합니다. DocC는 해당 정보를 사용하여 문서를 DocC 아카이브로 컴파일합니다. 이 프로세스는 타겟이 의존성을 가지는 모든 Swift 프레임워크 또는 패키지에 대해 반복됩니다.

![figure1](Documenting-a-Swift-Framework-or-Package-figure1.png)

Swift 프레임워크 또는 패키지에 대한 문서를 빌드하려면, Product > Build Documentation을 선택하세요. DocC는 문서를 컴파일하고 Xcode의 문서 뷰어에서 엽니다.

![figure2](Documenting-a-Swift-Framework-or-Package-figure2.png)

DocC는 소스 코드에 작성한 주석을 생성하는 문서 페이지의 내용으로 사용합니다. 최소한 DocC가 한줄 개요 또는 요약으로 사용할 기본 *문서 주석*을 프레임워크의 공개 심볼에 추가하세요. 또는 매개변수, 더 자세한 내용을 제공하기 위해 반환 값 및 에러에 대한 정보를 포함한 철저한 문서 주석을 추가합니다. 더 자세한 내용은 [Writing Symbol Documentation in Your Source Files](https://developer.apple.com/documentation/xcode/writing-symbol-documentation-in-your-source-files)을 확인하세요.

### 더 풍부한 문서 경험 구성

기본적으로 DocC는 in-source 심볼 문서만 컴파일한 다음 프로토콜, 클래스, 열거형 등과 같은 종류별로 해당 심볼을 그룹화합니다. 추가 콘텐츠를 제공하거나 프레임워크 심볼의 구성을 커스텀하려면 *문서 카탈로그*를 사용하세요. 

DocC는 Swift 컴파일러의 공개 API 정보를 문서 카탈로그의 내용과 결합해 훨씬 더 풍부한 DocC 아카이브를 생성합니다. 

![figure3](Documenting-a-Swift-Framework-or-Package-figure3.png)

다음을 포함하려면 문서 카탈로그를 사용하세요:
- 프레임워크를 소개하고 최상위 심볼을 정렬하는 랜딩 페이지와 심볼의 프로퍼티 및 메서드에 대한 커스텀 구성을 제공하는 extension 파일. 더 자세한 정보는 <doc:Adding-Structure-to-Your-Documentation-Pages>에서 확인하세요.
- in-source 주석을 보완하는 extension 파일과 개념적인 콘텐츠를 지원하는 article. 더 자세한 정보는 [Adding Supplemental Content to a Documentation Catalog](https://developer.apple.com/documentation/xcode/adding-supplemental-content-to-a-documentation-catalog)에서 확인하세요.
- 단계별 인터랙티브 콘텐츠를 통해 개발자에게 프레임워크의 API를 가르칠 수 있는 튜토리얼. 더 자세한 정보는 [Building an Interactive Tutorial](https://developer.apple.com/documentation/DocC/building-an-interactive-tutorial)에서 확인하세요.
- 문서에서 사용할 이미지 및 비디오와 같은 리소스 파일

기존 프로젝트에 문서 카탈로그를 추가하려면 다음 단계를 따르세요:
1. Xcode의 Project navigator에서 프로젝트 또는 패키지를 선택하세요.
2. File > New > File을 선택하여 file template chooser를 엽니다.
3. Documentation 섹션에서 Documentation Cataloag 템플릿을 선택하고, Next를 클릭하세요. Xcode는 이름을 변경할 수 있는 새로운 카탈로그를 기본 이름으로 생성합니다.

![figure4](Documenting-a-Swift-Framework-or-Package-figure4.png)

새로운 Swift 프레임워크 프로젝트를 생성할 때 Include Documentatioon 옵션을 선택하여 문서 카탈로그를 포함할 수 있습니다.

![figure5](Documenting-a-Swift-Framework-or-Package-figure5.png)

### 빌드 프로세스에 문서 통합

Product > Build Documentation을 선택하여 온디맨드 문서를 빌드하는 것 외에도, DocC에서 제공하는 빌드 설정을 활성화하여 프레임워크를 빌드할 때마다 자동으로 컴파일할 수 있습니다.

문서 컴파일러 빌드 설정을 활성화하라면:
1. Xcode의 Project Navigator에서 프레임워크의 프로젝트를 선택하세요.
2. 프로젝트 에디터에서 프레임워크의 타겟을 선택하세요.
3. Build Settings 탭을 클릭하세요.
4. Build Documentation during ‘Build’ setting을 찾기 위해 검색창에 “build documentation”을 입력합니다.
5. 설정의 팝업 버튼에서 Yes를 선택하여 빌드 설정을 활성화합니다.

![figure6](Documenting-a-Swift-Framework-or-Package-figure6.png)

> Note: 기존 프레임워크 프로젝트의 경우, 문서 카탈로그를 추가한 후에만 빌드 설정이 나타납니다. Swift 패키지에는 빌드 설정을 사용할 수 없습니다.

DocC는 `xcodebuild` 와도 통합됩니다. 따라서 커맨드라인에서도 문서를 빌드할 수 있습니다. 이는 문서 빌드를 지속적인 CI(Continuous Intergration) 프로세스에 통합하려는 경우에 유용합니다. 더 자세한 정보는 [Distributing Documentation to External Developers](https://developer.apple.com/documentation/xcode/distributing-documentation-to-external-developers)에서 확인하세요.
