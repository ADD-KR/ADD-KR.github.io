//
//  Timer.swift
//  
//
//  Created by DaEun Kim on 2021/08/17.
//

import Foundation

@available(iOS 2.0, macOS 10.0, macCatalyst 13.0, tvOS 9.0, watchOS 2.0, *)
public class Timer: NSObject {

  // Creating a Timer

  /// 타이머를 생성한 후 현재 런 루프의 default 모드에 스케줄합니다.
  public class func scheduledTimer(
    withTimeInterval interval: TimeInterval,
    repeats: Bool,
    block: @escaping (Timer) -> Void
  ) -> Timer { return Timer(timeInterval: interval, repeats: repeats, block: block)}
  /// 타이머를 생성한 후 현재 런 루프의 default 모드에 스케줄합니다.
  public class func scheduledTimer(
    timeInterval ti: TimeInterval,
    target aTarget: Any,
    selector aSelector: Selector,
    userInfo: Any?,
    repeats yesOrNo: Bool
  ) -> Timer {
    return Timer(timeInterval: ti,
                 target: aTarget,
                 selector: aSelector,
                 userInfo: userInfo,
                 repeats: yesOrNo)
  }
  /// 새로운 타이머를 생성한 후 현재 런 루프의 default 모드에 스케줄합니다.
  public class func scheduledTimer(
    timeInterval ti: TimeInterval,
    invocation: NSInvocation,
    repeats yesOrNo: Bool
  ) -> Timer {
    return Timer(timeInterval: ti, invocation: invocation, repeats: yesOrNo)
  }
  /// 시간 간격과 block으로 타이머 객체를 초기화합니다.
  public init(timeInterval interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Void) { }
  /// 객체와 셀렉터로 타이머 객체를 초기화합니다.
  public init(
    timeInterval ti: TimeInterval,
    target aTarget: Any,
    selector aSelector: Selector,
    userInfo: Any?,
    repeats yesOrNo: Bool
  ) { }
  /// invocation 객체로 타이머 객체를 초기화합니다.
  public init(timeInterval ti: TimeInterval, invocation: NSInvocation, repeats yesOrNo: Bool) { }
  /// 날짜와 시간 간격, block으로 타이머 객체를 초기화합니다.
  public init(fire date: Date, interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Void) { }
  /// 객체와 셀렉터로 타이머 객체를 초기화합니다.
  public init(
    fireAt: Date,
    interval ti: TimeInterval,
    target t: Any,
    selector s: Selector,
    userInfo ui: Any?,
    repeats rep: Bool
  ) { }

  // Firing a Timer

  /// 타이머의 메시지를 taget으로 보냅니다.
  public func fire() { }

  // Stopping a Timer

  /// 타이머를 다시 실행하지 않도록 멈추고 런 루프에서 제거를 요청합니다.
  public func invalidate() { }

  // Retrieving Timer Information

  /// 타이머의 유효 여부를 나타내는 불 값
  public var isValid: Bool { return true }
  /// 타이머가 작동되는 날짜
  public var fireDate: Date = Date()
  /// 타이머의 시간 간격(초)
  public var timeInterval: TimeInterval { return 0 }
  /// userInfo 객체의 리시버
  public var userInfo: Any? { return nil }

  // Configuring Firing Tolerance

  /// 타이머가 작동될 수 있는 스케줄된 작동 날짜 이후의 시간
  public var tolerance: TimeInterval = 0

  // Firing Messages as a Combine Publisher

  /// 지정된 간격에 따라 현재 날짜를 반복적으로 방출하는 publisher를 반환합니다.
  public static func publish(
    every interval: TimeInterval,
    tolerance: TimeInterval? = nil,
    on runLoop: RunLoop,
    in mode: RunLoop.Mode,
    options: RunLoop.SchedulerOptions? = nil
  ) -> TimerPublisher { return TimerPublisher() }

  // TODO: 수정 필요
  /// 지정된 간격으로 현재 날짜를 반복적으로 방출하는 publisher
  public final class TimerPublisher { }
}
