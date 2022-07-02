# Testing at All Stages of Development with Xcode and Sandbox

개발 전반에 걸쳐 코드를 테스트하여 인앱 구매 구현을 검증하세요.

## Overview

Xcode 및 Sandbox의 Apple 테스트 환경을 사용해 StoreKit 프레임워크를 사용한 인앱 구매 구현을 테스트하세요. 종합적인 테스트가 도움이 될 수 있습니다:

- 원활한 구매 플로우를 보장하여 앱에서 긍정적인 사용자 경험을 제공하세요.
- 구매, 구매 복원, 구독 오퍼와 같은 모든 시나리오를 커버하는 견고한 로직을 구현하세요.
- 앱 스토어에서 앱을 사용할 수 있게 되면 프로덕션 환경에서 구매가 올바르게 작동하는지 확인하세요.

초기 개발 단계부터 베타 테스트까지 인앱 구매, 비갱신 구독, 자동갱신 구독을 테스트하는 데 필요한 도구는 다음과 같습니다:

StoreKit Testing in Xcode
  - 초기 개발, CI, 디버깅 용

Sandbox
  - App Store Connect에 설정한 데이터를 사용한 테스트 시나리오 용. 자세한 내용은 [Create a sandbox tester account](https://help.apple.com/app-store-connect/#/dev8b997bee1)를 확인하세요.

TestFlight
  - 내부 및 외부 테스터의 베타 테스트 관리용. 자세한 내용은 [Beta Testing Made Simple with TestFlight](https://developer.apple.com/testflight/)를 확인하세요.

필요한 테스트 시나리오를 지원하는 도구를 선택하세요. 선택한 도구에 필요한 설정을 수행할 수 있는지 확인하세요.

개발 초기 단계에서는, App Store Connect에서 인앱 구매를 구성할 준비가 되지 않았을 수 있습니다. Xcode의 StoreKit 테스트를 통해 정보를 로컬에서 구성할 수 있습니다. 네트워크 연결 없이 Sandbox Apple IDs를 생성하기 전에 StoreKit 트랜잭션을 테스트할 수 있습니다. 시뮬레이터 또는 실제 디바이스에서 앱을 테스트할 수 있습니다.

App Store Connect에서 인앱 구매를 설정한 후, sandbox를 사용하여 앱이 프로덕션에서 사용할 제품 정보를 테스트합니다. sandbox 환경에서 테스트하면 end-to-end 및 client to server로의 트랜잭션을 테스트할 수 있습니다. 또한 영수증 검증 및 [App Store Server Notifications](https://developer.apple.com/documentation/appstoreservernotifications)과 같이 앱의 의존하는 server-to-server 기능을 테스트할 수도 있습니다.

TestFlight는 팀의 멤버 또는 외부 테스터로부터 피드백을 받을 수 있도록 해줍니다. TestFlight는 인앱 구매를 위해 sandbox 환경을 사용합니다. sandbox에서 완료된 트랜잭션 및 구매에는 요금이 부과되지 않습니다. 다음 표는 테스트 환경과 기능을 비교합니다.

테스트 환경 | App Store Connect 설정 필요 | App Store에서 서명한 영수증 및 JSON Web Signature 거래 제공 | App Store에서 서명한 재구독 정보 제공
--- | --- | --- | ---
StoreKit Testing in Xcode | No | No (signed by Xcode) | No (signed by Xcode)
Sandbox | Yes | Yes | Yes
TestFlight (uses sandbox) | Yes | Yes | Yes

어떤 테스트 환경도 사용자가 제품 구매를 테스트할 때 비용을 청구하지 않습니다. App Store는 테스트 환경에서 발생한 구매 또는 환불에 대한 메일을 전송하지 않습니다.

### Control the Test Environment

테스트 시나리오를 설정하고 실행하려면 테스트 환경을 제어해야 하는 경우가 많습니다. 예를 들어, 테스트 계정을 재설정하여 동일한 테스트를 여러 번 다시 실행하거나 사용자가 앱 외부에서 테스트 조건에 영향을 미치는 작업을 모방할 수 있습니다. 다음 표는 각 도구가 테스트 환경을 제어하는 데 필요한 기능을 보여줍니다.

테스트 시나리오 | Sandbox | StoreKit Testing In Xcode
--- | --- | ---
price tiers 및 locale에 영향을 미치는 다양한 storefronts 테스트 | No | Limited (no price tiers)
구매 내역 초기화 | Yes | Yes
구독 업그레이드, 다운그레이드, 크로스그레이드 그리고 자동갱신 취소 테스트 | Yes | Yes
introductory offers에 대한 자격 재설정 | Yes | Yes
테스트를 위한 강제 StoreKit 오류 발생 | No | Yes
구독 갱신 테스트 시간 속도 증감 | Yes | Yes

테스트를 위한 갱신 기간 증가에 대한 자세한 정보는 [Test in-app purchases](https://help.apple.com/app-store-connect/#/dev7e89e149d)를 확인하세요.

### Test Common StoreKit Scenarios

인앱 구매를 제공하는 모든 앱은 구매 복원, 고객에게 인앱 구매 표시 그리고 기본 거래 처리를 지원해야 합니다. 다음 표는 일반적인 테스트 시나리오와 sandbox 또는 Xcode에서의 테스트 가능 여부를 나타냅니다.

테스트 시나리오 | Sandbox | StoreKit Testing In Xcode
--- | --- | ---
구매 복원 | Yes | Yes
[finish()](https://developer.apple.com/documentation/storekit/transaction/3749694-finish) 또는 [finishTransaction(_:)](https://developer.apple.com/documentation/storekit/skpaymentqueue/1506003-finishtransaction)를 사용하여 거래 완료 | Yes | Yes
소모성 또는 비소모성 인앱 구매 구입 | Yes | Yes
반복 테스트를 위한 비소모성 구매 재구입 | Yes | Yes
자동 갱신 구독 구매 | Yes | Yes
비갱신 구독 구매 | Yes | Yes
인앱 구매 환불 | Yes | Yes
사용자가 앱 외부에서 작업을 완료해야 하는 interrupted 구매 테스트 | Yes | Yes
결제 승인 실패 시 실패한 구매 시도 테스트 | No | Yes
App Store Connect에서 구성된 인앱 구매 조회 | Yes | No (StoreKit 설정 파일의 데이터를 반환)
[showManageSubscriptions(in:)](https://developer.apple.com/documentation/storekit/appstore/3803198-showmanagesubscriptions), [manageSubscriptionsSheet(isPresented:)](https://developer.apple.com/documentation/swiftui/view/managesubscriptionssheet(ispresented:)를 사용하여 앱 내 구독 관리 | Yes | Yes
[beginRefundRequest(in:)](https://developer.apple.com/documentation/storekit/transaction/3803220-beginrefundrequest), [beginRefundRequest(for:in:)](https://developer.apple.com/documentation/storekit/transaction/3803219-beginrefundrequest)를 사용하여 환불 요청 | Yes | No

### Test Subscriptions and Ask to Buy

앱에서 제공하는 인앱 구매에 따라 자동갱신 구독, introductory offers, promotional offers 그리고 구매 요청과 관련된 시나리오를 테스트해야 할 수 있습니다. 다음 표는 일반적인 테스트 시나리오와 sandbox 또는 Xcode에서의 테스트 가능 여부를 나타냅니다.

테스트 시나리오 | Sandbox | StoreKit Testing In Xcode
--- | --- | ---
deferred state를 초래하는 구매 요청 거래 시작 | Yes | Yes
구매 요청 거래를 승인하거나 거부하여 Resolve | No | Yes
자동 갱신 구독에 대한 Introductory Offer Redeem | Yes | Yes
자동 갱신 구독에 대한 Promotional Offer Redeem | Yes | Yes
구독 갱신 처리 | Yes | Yes
무효하거나 환불된 구독 처리 | Yes | Yes
고객의 구독 취소 및 자동 갱신 비활성화 처리 | Yes | Yes
만료된 구독 처리 | Yes | Yes
구독 업그레이드 또는 다운그레이드 처리 | Yes | Yes
동일하거나 다른 기간으로의 구독 크로스 그레이드 처리 | Yes | Yes

더 자세한 내용은 [Approve what kids buy with Ask to Buy](https://support.apple.com/en-us/HT201089)와 [Testing Introductory Offers](https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase/subscriptions_and_offers/testing_introductory_offers)을 확인하세요.
