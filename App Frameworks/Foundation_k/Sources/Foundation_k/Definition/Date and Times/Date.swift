//
//  Date.swift
//  
//
//  Created by DaEun Kim on 2021/08/04.
//

@available(iOS 7.0, macOS 10.9, macCatalyst 13.0, tvOS 9.0, watchOS 2.0, *)
public struct Date: Comparable, CustomDebugStringConvertible, CustomReflectable, CustomStringConvertible,
              Decodable, Encodable, Equatable {

  // Creating a Date

  /// 현재 날짜 및 시간으로 초기화된 날짜 값을 생성합니다.
  public init() { }
  /// 현재 날짜 및 시간을 기준으로 주어진 초 단위 숫자만큼 초기화된 날짜 값을 생성합니다.
  public init(timeIntervalSinceNow: TimeInterval) { }
  /// 주어진 날짜를 기준으로 주어진 초 단위 숫자만큼 초기화된 날짜 값을 생성합니다.
  public init(timeInterval: TimeInterval, since: Date) { }
  /// 2001년 1월 1일 00:00:00 UTC를 기준으로 주어진 초단위 시간만큼 초기화된 날짜 값을 생성합니다.
  public init(timeIntervalSinceReferenceDate: TimeInterval) { }
  /// 1970년 1월 1일 00:00:00 UTC를 기준으로 주어진 초단위 시간만큼 초기화된 날짜 값을 생성합니다.
  public init(timeIntervalSince1970: TimeInterval) { }

  // Getting Temporal Boundaries

  /// 먼 미래의 날짜를 나타내는 날짜 값
  public static let distantFuture: Date = Date()
  /// 먼 과거의 날짜를 나타내는 날짜 값
  public static let distantPast: Date = Date()

  // Comparing Dates

  /// 두 날짜 값이 동일한 시점을 나타내는 경우 true인 Boolean 값을 반환합니다.
  public static func == (_ lhs: Date, _ rhs: Date) -> Bool { return true }
  /// 두 날짜 값이 동일한 시점을 나타내지 않는 경우 true인 Boolean 값을 반환합니다.
  public static func != (_ lhs: Date, _ rhs: Date) -> Bool { return true }
  /// 첫 번째 인수의 값이 두 번째 인수의 값보다 큰지 여부를 나타내는 Boolean 값을 반환합니다.
  public static func > (_ lhs: Date, _ rhs: Date) -> Bool { return true }
  /// 첫 번째 인수의 값이 두 번째 인수의 값보다 큰거나 같은지 여부를 나타내는 Boolean 값을 반환합니다.
  public static func >= (_ lhs: Date, _ rhs: Date) -> Bool { return true }
  /// 첫 번째 인수의 값이 두 번째 인수의 값보다 작은지 여부를 나타내는 Boolean 값을 반환합니다.
  public static func < (_ lhs: Date, _ rhs: Date) -> Bool { return true }
  /// 첫 번째 인수의 값이 두 번째 인수의 값보다 작거나 같은지 여부를 나타내는 Boolean 값을 반환합니다.
  public static func <= (_ lhs: Date, _ rhs: Date) -> Bool { return true }
  /// 두 날짜 값을 비교합니다.
  public func compare(_ other: Date) -> ComparisonResult { return .orderedSame }
  /// 이 날짜에서 다른 날짜까지의 거리를 시간 간격으로 반환합니다.
  public func distance(to: Date) -> TimeInterval { return 0 }

  // Getting Time Intervals

  /// 이 날짜와 주어진 다른 날짜 사이의 간격을 반환합니다.
  public func timeIntervalSince(_ date: Date) -> TimeInterval { return 0 }
  /// 현재 날짜 및 시간과 date 값 사이의 시간 간격
  public var timeIntervalSinceNow: TimeInterval { return 0 }
  /// 2001년 1월 1일 00:00:00 UTC와 date 값 사이의 간격
  public var timeIntervalSinceReferenceDate: TimeInterval { return 0 }
  /// 1970년 1월 1일 00:00:00 UTC와 date 값 사이의 간격
  public var timeIntervalSince1970: TimeInterval  { return 0 }
  /// 2001년 1월 1일 00:00:00 UTC와 현재 날짜 및 시간 사이의 간격
  public static var timeIntervalSinceReferenceDate: TimeInterval { return 0 }
  /// 1970년 1월 1일부터 기준 일자인 2001년 1월 1일까지의 초단위 숫자
  public static let timeIntervalBetween1970AndReferenceDate: Double = 1
  /// 날짜의 보폭을 정의하는 type alias
  public typealias Stride = TimeInterval

  // Adding or Subtracting a Time Interval

  /// 이 날짜에 시간 간격을 더합니다.
  public mutating func addTimeInterval(_ timeInterval: TimeInterval) { }
  /// 이 날짜에 시간 간격을 더해 새로운 날짜 값을 생성합니다.
  public func addingTimeInterval(_ timeInterval: TimeInterval) -> Date { return Date() }
  /// 이 날짜로부터 지정된 시간 간격의 날짜 offset을 반환합니다.
  public func advanced(by n: TimeInterval) -> Date { return Date() }
  /// 지정된 시간이 더해진 날짜를 반환합니다.
  public static func + (_ lhs: Date, _ rhs: TimeInterval) -> Date { return Date() }
  /// 날짜에 시간간격을 더합니다.
  public static func += (_ lhs: inout Date, _ rhs: TimeInterval) { }
  /// 지정된 시간에서 뺀 날짜를 반환합니다.
  public static func - (_ lhs: Date, _ rhs: TimeInterval) -> Date { return Date() }
  /// 날짜에서 시간간격을 뺍니다.
  public static func -= (_ lhs: inout Date, _ rhs: TimeInterval) { }

  // Creating Date Ranges

  /// 하한에서 위쪽으로 확장된 부분 범위를 반환합니다.
  public postfix static func ... (_ minimum: Date) -> PartialRangeFrom<Date> {
    return PartialRangeFrom(minimum)
  }
  /// 상한을 포함하여 부분 범위를 반환합니다.
  public prefix static func ... (_ maximum: Date) -> PartialRangeThrough<Date> {
    return PartialRangeThrough(maximum)
  }
  /// 두 경계를 모두 포함하는 닫힌 범위를 반환합니다.
  public static func ... (_ minimum: Date, _ maximum: Date) -> ClosedRange<Date> {
    return ClosedRange(uncheckedBounds: (minimum, maximum))
  }
  /// 상한을 포함하지 않는 부분 범위를 반환합니다.
  public prefix static func ..< (_ maximum: Date) -> PartialRangeUpTo<Date> {
    return PartialRangeUpTo(maximum)
  }
  /// 하한은 포함하지만 상한은 포함하지 않는 반 개방 범위를 반환합니다.
  public static func ..< (_ minimum: Date, _ maximum: Date) -> Range<Date> {
    return Range(uncheckedBounds: (minimum, maximum))
  }

  // Encoding Dates

  /// 이 날짜를 지정된 인코더로 인코딩합니다.
  public func encode(to encoder: Encoder) throws { }

  // Describing Dates

  /// 날짜 값에 대한 텍스트 설명
  public var description: String { return "" }
  /// 주어진 locale을 사용해 날짜의 문자열 표현을 반환합니다.
  public func description(with locale: Locale?) -> String { return "" }
  /// 디버깅에 적합한 날짜에 대한 텍스트 설명
  public var debugDescription: String { return "" }
  /// 날짜를 나타내는 Mirror
  public var customMirror: Mirror { return Mirror(reflecting: self) }
  /// 날짜의 계산된 hash 값
  public var hashValue: Int { return 0 }
  /// 이 값의 필수 컴포넌트를 지정된 hasher에 넣어 해시합니다.
  public func hash(into hasher: inout Hasher) { hasher.combine(timeIntervalSinceReferenceDate) }

  // Using Reference Types

  /// 이 값 타입의 해당 참조 참조타입에 대한 별칭
  public typealias ReferenceType = NSDate
}
