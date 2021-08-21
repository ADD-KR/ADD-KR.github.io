# ``Foundation_k/Date``

@Metadata {
    @DocumentationExtension(mergeBehavior: override)
}

달력 또는 표준 시간대와 관계없는 특정 시점

## Overview

Date 값은 특정 캘린더 시스템 또는 표준 시간대와 관계없이 한 시점을 캡슐화합니다. Date 값은 절대 참조 날짜에 상대적인 시간 간격을 나타냅니다.

Date 구조체는 날짜를 비교하고, 두 날짜 간의 시간 간격을 계산하며, 다른 날짜에 상대적인 시간 간격에서 새로운 날짜를 생성하는 메서드를 제공합니다. [DateFormatter](https://developer.apple.com/documentation/foundation/dateformatter) 인스턴스와 함께 날짜 값을 사용해 날짜 및 시간의 지역화된 표현을 만들고 [Calendar](https://developer.apple.com/documentation/foundation/calendar) 인스턴스와 함께 달력 산수를 수행합니다.

Date는 ``NSDate`` 클래스와 연결됩니다. Objective-C API와 상호작용하는 코드에서 상호 교환하여 사용할 수 있습니다.

## Topics

### Creating a Date

- ``init()``
- ``init(timeIntervalSinceNow:)``
- ``init(timeInterval:since:)``
- ``init(timeIntervalSinceReferenceDate:)``
- ``init(timeIntervalSince1970:)``

### Getting Temporal Boundaries

- ``distantFuture``
- ``distantPast``

### Comparing Dates

- ``==(_:_:)``
- ``>(_:_:)``
- ``>=(_:_:)``
- ``<(_:_:)``
- ``<=(_:_:)``
- ``compare(_:)``
- ``distance(to:)``

### Getting Time Intervals

- ``timeIntervalSince(_:)``
- ``timeIntervalSinceNow``
- ``timeIntervalSinceReferenceDate-swift.property``
- ``timeIntervalSince1970``
- ``timeIntervalSinceReferenceDate-swift.type.property``
- ``timeIntervalBetween1970AndReferenceDate``
- ``Stride``

### Adding or Subtracting a Time Interval

- ``addTimeInterval(_:)``
- ``addingTimeInterval(_:)``
- ``advanced(by:)``
- ``+(_:_:)``
- ``+=(_:_:)``
- ``-(_:_:)``
- ``-=(_:_:)``

### Creating Date Ranges

- ``...(_:)-khpo``
- ``...(_:)-2ak70``
- ``...(_:_:)``
- ``..<(_:)``
- ``..<(_:_:)``

### Encoding Dates

- ``encode(to:)``

### Describing Dates

- ``description``
- ``description(with:)``
- ``debugDescription``
- ``customMirror``
- ``hashValue``
- ``hash(into:)``

### Using Reference Types

- ``NSDate``
- ``ReferenceType``
