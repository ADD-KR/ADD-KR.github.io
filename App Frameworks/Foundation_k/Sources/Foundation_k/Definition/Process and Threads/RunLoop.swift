//
//  RunLoop.swift
//  
//
//  Created by DaEun Kim on 2021/08/12.
//

import Combine
import Foundation

@available(iOS 2.0, macOS 10.0, macCatalyst 13.0, tvOS 9.0, watchOS 2.0, *)
public class RunLoop: NSObject, Scheduler {

  private override init() { super.init() }

  // Accessing Run Loops and Modes

  /// 현재 스레드의 런루프를 반환합니다.
  public class var current: RunLoop { return RunLoop() }
  /// 리시버의 현재 입력 모드
  public var currentMode: Mode? = nil
  /// 지정된 모드에서 런루프를 한 번 돈 후 다음 타이머가 실행되도록 스케줄된 날짜를 반환합니다.
  public func limitDate(forMode mode: Mode) -> Date? { return nil }
  /// 현재 스레드의 런루프를 반환합니다.
  public class var main: RunLoop { return RunLoop() }
  // TODO: CFRunLoop 추가 후 주석 제거
  // public func getCFRunLoop() -> CFRunLoop { return CFRunLoop() }
  /// 런루프가 작동하는 모드
  public struct Mode { }

  // Managing Timers

  /// 지정된 타이머를 지정된 입력 모드로 등록합니다.
  public func add(_ timer: Timer, forMode mode: Mode) { }

  // Managing Ports

  /// 지정된 런루프의 모드에 포트를 입력 소스로 추가합니다.
  public func add(_ port: Port, forMode mode: Mode) { }
  /// 지정된 런루프의 입력 모드에서 포트를 삭제합니다.
  public func remove(_ port: Port, forMode: Mode) { }

  // Running a Loop

  /// 리시버를 영구적인 루프에 넣고, 연결된 모든 입력 소스의 데이터를 처리합니다.
  public func run() { }
  /// 루프를 한번 실행하여, 지정된 날짜까지 지정된 모드의 입력을 차단합니다.
  public func run(mode: Mode, before limitDate: Date) -> Bool { return true }
  /// 지정된 날짜까지 루프를 실행하는 동안 연결된 모든 입력 소스의 데이터를 처리합니다.
  public func run(until limitDate: Date) { }
  /// 한번 또는 지정된 날짜까지 루프를 실행하여 지정된 모드의 입력만 받습니다.
  public func acceptInput(forMode mode: RunLoop.Mode, before limitDate: Date) { }

  // Scheduling and Canceling Tasks

  /// 리시버에 대한 메시지 전송을 예약합니다.
  public func perform(_ block: @escaping () -> Void) { }
  /// 런루프가 지정된 모드에서 실행 중일 때 호출하는 블록을 예약합니다.
  public func perform(inModes modes: [Mode], block: @escaping () -> Void) { }
  /// 리시버에서 메시지 전송을 예약합니다.
  public func perform(_ aSelector: Selector, target: Any, argument arg: Any?, order: Int, modes: [RunLoop.Mode]) { }
  /// 이전에 예약된 메시지 전송을 취소합니다.
  public func cancelPerform(_ aSelector: Selector, target: Any, argument arg: Any?) { }
  /// 지정된 타겟에 아직 전달되지 않았고, 실행이 예약된 모든 명령을 취소합니다.
  public func cancelPerformSelectors(withTarget target: Any) { }

  // Scheduling Combine Publishers

  /// 스케줄러의 최소 허용오차를 사용해 지정된 날짜 이후 작업을 수행합니다.
  @available(iOS 13.0, macOS 10.15, macCatalyst 13.0, tvOS 13.0, watchOS 6.0, *)
  public func schedule(options: SchedulerOptions?, _ action: @escaping () -> Void) { }
  /// 지정된 허용오차와 옵션을 사용해 지정된 날짜 이후 작업을 수행합니다.
  @available(iOS 13.0, macOS 10.15, macCatalyst 13.0, tvOS 13.0, watchOS 6.0, *)
  public func schedule(after date: SchedulerTimeType,
                       tolerance: SchedulerTimeType.Stride,
                       options: SchedulerOptions?, _
                       action: @escaping () -> Void) { }
  /// 지정된 허용오차와 옵션을 사용해 지정된 날짜 이후 지정된 빈도에 작업을 수행합니다.
  @available(iOS 13.0, macOS 10.15, macCatalyst 13.0, tvOS 13.0, watchOS 6.0, *)
  public func schedule(after date: SchedulerTimeType,
                       interval: SchedulerTimeType.Stride,
                       tolerance: SchedulerTimeType.Stride,
                       options: SchedulerOptions?,
                       _ action: @escaping () -> Void) -> Cancellable { return [Cancellable]().first! }
  /// 런루프 스케줄러가 허용하는 최소 허용오차
  public var minimumTolerance: SchedulerTimeType.Stride = SchedulerTimeType.Stride()
  /// 현재 시간에 대한 런루프 스케줄러의 정의
  public var now: SchedulerTimeType = SchedulerTimeType()
  // TODO: 수정 필요
  /// 런루프가 사용하는 스케줄러 시간 타입
  @available(iOS 7.0, macOS 10.9, macCatalyst 13.0, tvOS 9.0, watchOS 2.0, *)
  public struct SchedulerTimeType: Decodable, Encodable, Hashable, Strideable {
    @available(iOS 7.0, macOS 10.9, macCatalyst 13.0, tvOS 9.0, watchOS 6.0, *)
    public struct Stride: Comparable, Decodable, Encodable, ExpressibleByFloatLiteral, SchedulerTimeIntervalConvertible, SignedNumeric {

      public init(floatLiteral value: Float) { }
      public init(integerLiteral value: Int) { }
      public init(_ timeInterval: TimeInterval = 0) { }
      public init?<T>(exactly source: T) where T : BinaryInteger { }

      public typealias FloatLiteralType = Float
      public typealias Magnitude = Float
      public typealias IntegerLiteralType = Int
      public var magnitude: Float = 0

      public static func + (_ lhs: Stride, _ rhs: Stride) -> Stride { return Stride() }
      public static func < (_ lhs: Stride, _ rhs: Stride) -> Bool { return true }
      public static func * (_ lhs: Stride, _ rhs: Stride) -> Stride { return Stride() }
      public static func *= (_ lhs: inout Stride, _ rhs: Stride) { }
      public static func - (_ lhs: Stride, _ rhs: Stride) -> Stride { return Stride() }

      public static func seconds(_ s: Int) -> Stride { return Stride() }
      public static func seconds(_ s: Double) -> Stride { return Stride() }
      public static func milliseconds(_ ms: Int) -> Stride { return Stride() }
      public static func microseconds(_ us: Int) -> Stride { return Stride() }
      public static func nanoseconds(_ ns: Int) -> Stride { return Stride() }
    }

    public func distance(to other: SchedulerTimeType) -> Stride { return 0 }
    public func advanced(by n: Stride) -> SchedulerTimeType { return SchedulerTimeType() }
  }
  /// 런루프 스케줄러 작동에 영향을 미치는 옵션 집합
  @available(iOS 7.0, macOS 10.9, macCatalyst 13.0, tvOS 9.0, watchOS 2.0, *)
  public struct SchedulerOptions { }
}
