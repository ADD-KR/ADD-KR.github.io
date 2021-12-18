# Choosing Background Strategies for Your App

앱의 백그라운드 런타임을 예약하기에 가장 적합한 방법을 선택합니다.

## Overview

만약 앱이 포어그라운드에서 실행되고 있지 않을 때 작업을 완료하기 위해 컴퓨팅 리소스를 필요로 한다면, 여러 전략 중 적합한 전략을 선택해 백그라운드 런타임을 얻을 수 있습니다. 앱이 백그라운드에서 어떻게 동작하는지에 따라 올바른 전략을 선택하세요.

일부 앱은 포어그라운드에서 잠시 작업을 수행하며 백그라운드에 진입하는 경우 작업이 중단 없이 계속돼야 합니다. 다른 앱은 나중에 또는 기기가 충전되는 밤에 백그라운드에서 실행되도록 작업을 연기합니다. 그리고 어떤 앱은 외부 이벤트가 전달되었거나 메시지가 도착했을 때와 같이 다양하고 예측할 수 없는 시간에 백그라운드 실행 시간을 필요로 합니다.

앱의 백그라운드 활동을 예약하는 방법에 따라 하나 또는 여러 개의 방법을 선택하세요.

### Continue Foreground Work in the Background

시스템은 언제든지 앱을 백그라운드 상태로 변경할 수 있습니다. 만약 앱이 백그라운드에서 실행될 동안에도 중요한 작업을 계속해야 한다면, 시스템에 알리기 위해 [beginBackgroundTask(withName:expirationHandler:)](https://developer.apple.com/documentation/uikit/uiapplication/1623051-beginbackgroundtask) 를 사용하세요. 만약 앱이 메시지 전송이나 파일 저장을 완료해야할 경우 이 접근법을 고려해보세요.

시스템은 앱이 백그라운드에 진입하면 작업을 수행하는 데 제한된 시간을 부여합니다. 이 시간을 초과하지 말고, expiration handler를 사용해 작업 취소 또는 연기로 인해 시간이 만료된 경우를 처리하세요.

작업이 완료되면, 시간 제한이 만료되기 전에 [endBackgroundTask(_: )](https://developer.apple.com/documentation/uikit/uiapplication/1622970-endbackgroundtask) 를 호출해 앱이 suspend 상태에 적절하게 진입하도록 하세요. 이 메서드 호출을 실패하면 시스템은 앱을 종료시킵니다.

파일 다운로드 또는 업로드 같이 시간이 걸리는 작업일 경우, [URLSession](https://developer.apple.com/documentation/foundation/urlsession)을 사용하세요. 자세한 내용은 [Downloading Files in the Background](https://developer.apple.com/documentation/foundation/url_loading_system/downloading_files_in_the_background)를 확인하세요.

### Defer Intensive Work

배터리 생명과 성능을 보존하기 위해, 기기가 충전되는 새벽과 같이 사용자의 활동이 적은 기간에 백그라운드 작업을 예약할 수 있습니다. 앱이 머신러닝 모델 학습이나 데이터베이스 유지 관리 같은 무거운 작업을 관리할 때 이 접근법을 사용하세요.

[BGProcessingTask](https://developer.apple.com/documentation/backgroundtasks/bgprocessingtask)를 사용해 이러한 유형의 백그라운드 작업을 예약하면, 시스템이 백그라운드 작업 실행에 최적의 시간을 정해줍니다.

### Update Your App’s Content

앱이 컨텐츠 새로고침 또는 기타 작업을 수행하려면 짧은 백그라운드 시간이 필요할 수 있습니다. 예를 들어, 앱이 주기적으로 서버에서 컨텐츠를 가져와야 하거나, 정기적으로 내부 상태를 업데이트해야할 수 있습니다. 이런 상황에서는, [BGAppRefreshTaskRequest](https://developer.apple.com/documentation/backgroundtasks/bgapprefreshtaskrequest)를 요청해 [BGAppRefreshTask](https://developer.apple.com/documentation/backgroundtasks/bgapprefreshtask)를 사용하세요.

시스템은 앱이 백그라운드 작업을 실행하기에 최적의 시간을 정하고, 30초 정도의 백그라운드 실행시간을 제공합니다. 이 기간내에 작업을 완료하고 [setTaskCompleted(success:)](https://developer.apple.com/documentation/backgroundtasks/bgtask/3142236-settaskcompleted)를 호출하지 않으면, 시스템은 앱을 종료시킵니다. [Background Tasks](https://developer.apple.com/documentation/backgroundtasks)에서 더 자세한 정보를 확인하세요.

### Wake Your App with a Background Push

백그라운드 푸시는 백그라운드에서 앱을 자동으로 깨웁니다. 얼럿 띄우기, 소리 재생 또는 앱 아이콘에 뱃지를 표시하지 않습니다. 앱이 서버에서 드물게 또는 불규칙적으로 가져오는 경우, 새로운 컨텐츠가 사용가능해졌을 때 백그라운드 푸시를 사용해 앱에 알립니다. 뮤트된 대화가 있는 메시징 앱은 백그라운드 푸시 솔루션을 사용할 수 있고, 이는 사용자에게 얼럿을 띄우지 않고 수신 메일을 처리하는 이메일 앱도 마찬가지입니다.

백그라운드 푸시를 보낼 때, `alert, sound, badge` 없이  `content-available:` 을 1로 설정하세요. 시스템은 컨텐츠를 다운로드하기 위해 앱을 실행할 시기를 결정합니다. 앱의 실행을 보장하기 위해 `apns-priority`를 5로 설정하고 `apns-push-type`을 `background`로 설정하세요.

시스템이 한번[application(_:didReceiveRemoteNotification:fetchCompletionHandler:)](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623013-application)로 원격 알림을 전달하면, 앱은 작업을 완료하는데 30초 정도의 시간을 가집니다. 앱에서 작업을 수행하면, 전원을 절약하기 위해 가능한 빨리 전달된 completion handler를 호출합니다. 백그라운드 푸시를 시간당 세 번 이상 보내는 경우, 시스템은 속도 제한을 부과합니다. [Pushing Background Updates to Your App](https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/pushing_background_updates_to_your_app)에서 자세한 내용을 확인하세요.

### Request Background Time and Notify the User

앱이 백그라운드에서 작업을 수행하고 사용자에게 알림을 표시해야 하는 경우, Notification Service Extension을 사용할 수 있습니다. 예를 들어, 이메일 앱은 새로운 이메일을 다운로드한 후 사용자에게 알려야 할 수 있습니다. [UNNotificationServiceExtension](https://developer.apple.com/documentation/usernotifications/unnotificationserviceextension)을 상속하고 앱과 함께 시스템 익스텐션을 번들로 제공합니다. 푸시 알림을 받으면, 서비스 익스텐션이 깨어나 [didReceive(_:withContentHandler:)](https://developer.apple.com/documentation/usernotifications/unnotificationserviceextension/1648229-didreceive)를 통해 백그라운드 런타임을 얻습니다.

익스텐션이 작업을 끝내면, 사용자에게 전하고 싶은 컨텐츠와 함께content handler를 반드시 호출해야 합니다. 익스텐션은 컨텐츠를 수정하고 contentHandler 블록을 실행하기 위한 제한된 시간을 갖습니다.
