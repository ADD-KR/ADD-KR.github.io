# Distributing Documentation to External Developers

문서를 Xcode 사용자와 직접 공유하거나 웹서버에 문서를 호스팅하세요.

## Overview

Xcode에서 Swift 프레임워크 또는 패키지를 생성하는 즉시 DocC는 프로젝트의 공개 타입에 대한 구조화된 문서를 생성할 준비가 됩니다. 소스파일에 문서 주석만 있든 아티클 및 튜토리얼을 포함하는 모든 학습 경험을 제공하든 상관없이 Xcode는 다른 개발자와 프로젝트의 문서를 공유할 수 있는 변리한 방법을 제공합니다.

문서를 공유하려면, 다음을 포함하여 필요한 모든 것이 포함된 self-contained 번들인 *문서 아카이브*를 생성하세요:
- in-source 주석, 아티클, 튜토리얼 및 리소스에서 컴파일된 문서
- 문서를 렌더링하는 single-page 웹 앱

문서 배포에는 다음 단계가 포함됩니다:
1. Xcode의 문서 뷰어에서, 또는 `xcodebuild` 커맨드라인 도구를 사용해 문서를 내보냅니다.
2. Xcode 사용자에게 직접 문서뷰어에서 문서를 열도록 하거나 웹 사이트에서 호스팅하여 문서를 공유하십시오.

### 문서의 게시 가능한 아카이브 생성

문서 아카이브를 생성하려면, 문서 뷰어에서 내보내거나 또는 `xcodebuild docbuild` 커맨드라인 도구를 사용하세요. `xcodebuild`를 사용하면 CI(Continuous Intergration) 워크플로우와 통합할 수 있습니다.

Xcode의 문서 뷰어에서 문서 아카이브를 내보내려면:
1. Workespace Documentation 섹션에서 컴파일된 문서 카탈로그 위에 포인터를 놓으면 More 버튼이 표시됩니다.
2. More 버튼을 클릭하고 Export 메뉴 항목을 선택합니다. 또는 문서 카탈로그 항목에서 컨텍스트 메뉴를 호출하여 내보내기 메뉴에 액세스합니다.
3. 문서 아카이브 저장 위치를 선택하고, Save를 클릭하세요.

![figure1](Distributing-Documentation to-External-Developers-figure1.png)

Xcode가 내보낸 문서 아카이브는 `.doccarchive` 파일 확장자를 사용합니다.

커맨드 라인에서 문서 아카이브를 내보내려변, 터미널에서 `xcodebuild docbuild`를 실행하고, derived data 디렉토리에서 `.doccarchive` 번들을 복사하세요. 프로젝트 구성에 따라 추가적인 커맨드라인 옵션을 전달해야할 수도 있습니다. 더 자세한 내용은, `xcodebuild` 매뉴얼 페이지를 참고하세요.

예를 들어, 문서 아카이브를 빌드하려면 다음과 같은 명령어를 사용하세요.

```
xcodebuild docbuild -scheme SlothCreator -derivedDataPath ~/Desktop/SlothCreatorBuild
```

> Tip: `-derivedDataPath`가 필수 옵션은 아니지만 이를 포함하면 자동화된 스크립트가 쉽게 빌드 결과를 식별하고 `.doccarchive` 번들을 찾을 수 있습니다.

빌드 프로세스의 일부로, `xcodebuild`는 derived data 경로에 많은 파일을 생성합니다. 빌드 결과에서 문서 아카이브를 찾는 한 가지 방법은 `find` 명령어를 사용하는 것입니다. 예를 들어, 다음을 사용해 위의 `xcodebuild` 명령이 생성하는 문서 아카이브를 찾습니다.

```
find ~/Desktop/SlothCreatorBuild -type d -name '*.doccarchive`
```

### 개발자에게 직접 문서 아카이브 보내기

문서 아카이브는 self-contained 번들이기 때문에, 쉽게 다른 개발자와 공유할 수 있습니다. 예를 들어, 일반 문서처럼 이메일로 보내거나, 프레임워크 또는 패키지의 바이너리 배포에 포함하거나, 웹사이트에서 다운로드할 수 있도록 만들 수 있습니다. 수신자가 문서 아카이브를 열면 Xcode는 문서 뷰어의 Imported Documentation 섹션에 문서 아카이브를 추가합니다.

![figure2](Distributing-Documentation to-External-Developers-figure2.png)

가져온 문서 아카이브를 제거하려면, 항목 위에 포인터를 놓아 More 버튼을 표시한 다음 Remove를 선택합니다.

### 웹사이트에 문서 아카이브 호스팅

Xcode가 문서 아카이브를 내보낼 때 번들에 single-page 웹 앱에 포함됩니다. 이 웹 앱은 문서 콘텐츠를 HTML로 렌더링하므로 웹 서버에서 문서 아카이브를 호스팅할 수 있습니다.

웹 앱은 레퍼런스 문서 및 아티클에 대해 `/documentation`으로 시작하는 URL 경로를 사용합니다. 튜토리얼에 대해서는 `/tutorials`로 시작하는 URL 경로를 사용합니다. 예를 들어, 프로젝트가 `SlothGenerator`라는 이름의 프로토콜을 포함하는 경우, `SlothGenerator` 문서를 볼 수 있는 URL은 다음과 비슷할 것입니다:

```
https://www.example.com/documentation/SlothCreator/SlothGenerator
```

> Note: 다음 섹션에서는 Apache를 예시로 사용합니다. 다른 웹 서버 설치에도 유사한 메커니즙이 있습니다. 유사한 구성을 수행하는 방법에 대한 자세한 내용은 서버 설명서를 참고하세요.

웹사이트에 문서 아카이브를 호스팅하려면 다음을 수행하세요:
1. 문서 아카이브를 웹 서버가 파일을 제공하는 데 사용하는 디렉토리에 복사하세요. 이 예제에서 문서 아카이브는 `SlothCreator.doccarchive`입니다.
2. `SlothCreator.doccarchive/index.html`에 `/documentation` 또는 `/tutorial`로 시작하는 URL을 rewirte하는 규칙을 서버에 추가합니다.
3. CSS 파일 및 이미지 에셋과 같은 문서 아카이브의 번들 리소스를 지원하기 위해 들어오는 요청에 대해 다른 규칙을 추가합니다.

다음 예제 `.htaccess` 파일은 Apache와 함께 사용하기에 적합한 규칙을 정의합니다.

```
# Enable custom routing.
RewriteEngine On

# Route documentation and tutorial pages.
RewriteRule ^(documentation|tutorials)\/.*$ SlothCreator.doccarchive/index.html [L]

# Route files and data for the documentation archive.
#
# If the file path doesn't exist in the website's root ...
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d

# ... route the request to that file path with the documentation archive.
RewriteRule .* SlothCreator.doccarchive/$0 [L]
```

이러한 규칙이 적용되면 웹 서버는 문서 아카이브의 콘텐츠에 대한 액세스를 제공합니다.

문서 아카이브를 호스팅하도록 웹 서버를 구성한 후 `xcodebuild docbuild`를 사용하여 문서 아카이브를 빌드하고 `.doccarchive`를 웹 서버에 복사하는 CI(Continuous Intergration) 워크플로우를 사용하여 최신 상태로 유지하세요.
