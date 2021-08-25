# Scheduling a Notification Locally from Your App

사용자의 주의를 끌기 위해 앱에서 알림을 만들고 예약하세요.

## Overview

사용자의 주의를 끌기 위해 로컬 알림을 사용하세요. 얼럿을 띄우거나, 소리를 재생하거나, 앱 아이콘에 뱃지를 표시할 수 있습니다. 예를 들어 특정 작업이 끝났을 때 백그라운드앱은 시스템에 얼럿을 띄우도록 요청할 수 있습니다. 항상 로컬 알림을 사용하여 사용자가 원하는 중요한 정보를 전달하세요.

알림 전달은 지정한 시간이나 위치에 따라 시스템에서 처리됩니다. 앱이 실행되고 있지 않거나 백그라운드 상태일 때 알림이 전달되면, 시스템은 사용자와 상호작용합니다. 만약 앱이 포어그라운드 상태라면 시스템은 앱에게 알림을 전달해 처리할 수 있도록 합니다.

### 알림 컨텐츠 생성

[UNMutableNotificationContent](https://developer.apple.com/documentation/usernotifications/unmutablenotificationcontent) 객체의 프로퍼티를 알림의 세부 정보로 채우세요. 입력한 필드는 알림 전달 방법을 정의합니다. 예를 들어, 소리를 재생하기 위해, 객체의 [sound](https://developer.apple.com/documentation/usernotifications/unnotificationcontent/1649871-sound) 프로퍼티에 값을 할당합니다. Listing 1은 띄워질 얼럿의 제목과 본문을 담은 컨텐츠 객체를 보여줍니다. 같은 요청에 여러 인터랙션 타입을 지정할 수 있습니다.

**Listing 1** Configuring the notification content

```swift
let content = UNMutableNotificationContent()content.title = "Weekly Staff Meeting"
content.body = "Every Tuesday at 2pm"
```

### 전달을 위한 조건 지정

[`UNCalendarNotificationTrigger`](https://developer.apple.com/documentation/usernotifications/uncalendarnotificationtrigger), [`UNTimeIntervalNotificationTrigger`](https://developer.apple.com/documentation/usernotifications/untimeintervalnotificationtrigger), 또는 [`UNLocationNotificationTrigger`](https://developer.apple.com/documentation/usernotifications/unlocationnotificationtrigger) 객체를 사용해 알림 전달의 조건을 지정하세요. 각 트리거 객체는 다른 파라미터를 요구합니다. 예를 들어 캘린더 기반 트리거는 알림이 전달될 날짜와 시간을 지정하도록 요구합니다.

Listing 2는 매주 화요일 오후 2시에 알림을 전달하기 위한 설정 방법을 보여줍니다. [DateComponents](https://developer.apple.com/documentation/foundation/datecomponents) 구조체는 이벤트의 타이밍을 지정합니다. repeats 파라미터를 true로 설정해 트리거를 생성하면 시스템은 알림이 전달된 후에 이벤트를 다시 예약합니다.

**Listing 2** Configuring a recurring date-based trigger

```swift
// Configure the recurring date.
var dateComponents = DateComponents()
dateComponents.calendar = Calendar.current

dateComponents.weekday = 3  // Tuesday
dateComponents.hour = 14    // 14:00 hours
   
// Create the trigger as a repeating event.    
let trigger = UNCalendarNotificationTrigger(
         dateMatching: dateComponents, repeats: true)
```

### 알림 요청 생성 및 등록

컨텐츠와 트리거 조건을 담은 UNNotificationRequest 객체를 생성하고 시스템이 요청을 예약할 수 있도록 [add(_:withCompletionHandler:)](https://developer.apple.com/documentation/usernotifications/unusernotificationcenter/1649508-add) 메서드를 호출하세요. Listing 3은 Listing 1과 Listing 2의 컨텐츠를 사용해 request 객체를 생성한 예제입니다.

**Listing 3** Registering the notification request

```swift
// Create the request
let uuidString = UUID().uuidString
let request = UNNotificationRequest(identifier: uuidString, 
            content: content, trigger: trigger)

// Schedule the request with the system.
let notificationCenter = UNUserNotificationCenter.current()
notificationCenter.add(request) { (error) in
   if error != nil {
      // Handle any errors.
   }
}
```

### 예약된 알림 요청 취소

한번 예약된 알림 요청은 트리거 조건에 부합하거나, 명시적으로 취소하기 전까지 활성화되어 남아있게 됩니다. 일반적으로, 상태가 바뀌었거나 더이상 사용자에게 알림을 전달할 필요가 없을 때 요청을 취소합니다. 예를 들어, 사용자가 리마인더를 완료하면, 리마인더와 관련된 모든 활성화 상태의 요청을 취소합니다. 활성화 상태의 알림 요청을 취소하기 위해 UNUserNotificationCenter의 [removePendingNotificationRequests(withIdentifiers:)](https://developer.apple.com/documentation/usernotifications/unusernotificationcenter/1649517-removependingnotificationrequest) 메서드를 호출하세요.
