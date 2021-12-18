# ADD-KR

🍎 Apple Developer Document 한국어 번역 프로젝트입니다. DocC 프레임워크를 사용해 [Apple Developer 홈페이지](https://developer.apple.com/)를 기반으로 번역합니다.

> 질문, 요청사항이 있다면 언제든지 acone1128@gmail.com으로 문의주세요!

## 개요

- Swift 문서만 번역합니다.
- 규칙을 준수하지 않을 경우, 수정요청되고, 수정사항이 반영되기 전까지 병합될 수 없습니다.
- 기본적으로 DocC의 문법과 규칙을 따르지만, DocC에서 지원하지 않는 예외 케이스 등을 포함한 작업 시 [문서 작성 가이드](documentation-guide.md)를 꼭 읽어주세요.

## 문서 사용 방법

1. 패키지별 doccarchive를 다운로드하여 Xcode의 문서 뷰어에서 직접 사용
2. ~~Web에 호스팅된 페이지를 통해 사용~~ (준비중입니다)

## 작업 단계

1. 번역을 시작하기 전에 [Issue template](.github/ISSUE_TEMPLATE/issue-template.md)에 맞춰 **반드시** 이슈를 등록합니다.
   - 불필요한 동시 작업을 방지하기 위함이니 준수해주세요.
   - 이슈를 생성하기 전 작업하려는 문서가 이미 작업 중인지, 혹은 작업이 완료되었는지 확인해주세요.
2. `Issue type/이슈 번호` 로 브랜치를 생성합니다.
   - 예시: create/#1
3. 생성한 브랜치에서 [문서 작성 가이드](documentation-guide.md)를 준수하여 문서를 작성하고 커밋합니다.
   - commit message는 `Create AppleSilicon`과 같이 간단명료하게 명시해주세요.
   - commit description에 세부사항을 명시해주세요.
   - commit 단위는 생성하는 경우에는 파일 단위, 수정하는 경우에는 리뷰를 고려해 자유롭게 지정해주세요.
4. [PR template](.github/PULL_REQUEST_TEMPLATE.md)에 맞춰 PR을 생성합니다.
5. 검수 후 문제가 없다면 main 브랜치로 병합되고, issue 또한 close 됩니다.
   - 검수 시 문제가 발생한다면 [문서 작성 가이드](documentation-guide.md)에 맞게 수정해야 합니다.
   - Organization의 구성원만 병합할 수 있는 권한을 가집니다.
     - 구성원으로서 함께하고 싶으시다면 acone1128@gmail.com로 메일 주세요 :)

## Contributor

언제든지 모든 형태의 기여를 환영합니다. 프로젝트에 함께 해주세요! 🙌

