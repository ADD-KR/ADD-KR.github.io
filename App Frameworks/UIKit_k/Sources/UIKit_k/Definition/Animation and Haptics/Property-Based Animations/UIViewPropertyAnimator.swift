//
//  UIViewPropertyAnimator.swift
//  
//
//  Created by DaEun Kim on 2021/07/18.
//

import Foundation

@available(iOS 10.0, macCatalyst 13.0, tvOS 10.0, *)
public class UIViewPropertyAnimator: NSObject, NSCopying {

  // Initializing a Property Animator

  /// 빌트인 UIKit 타이밍 커브를 사용해 애니메이터를 초기화합니다.
  public init(duration: TimeInterval, curve: UIView.AnimationOptions, animations: (() -> Void)?) { }
  /// cubic Bézier 타이밍 커브를 사용해 애니메이터 객체를 초기화합니다.
  public init(
    duration: TimeInterval,
    controlPoint1: CGPoint,
    controlPoint2: CGPoint,
    animations: (() -> Void)?
  ) { }
  /// spring 기반 타이밍 정보를 사용해 애니메이터 객체를 초기화합니다.
  public init(duration: TimeInterval, dampingRatio: CGFloat, animations: (() -> Void)?) { }
  /// 커스텀 타이밍 커브 객체를 사용해 애니메이터 객체를 초기화합니다.
  public init(duration: TimeInterval, timingParameters: UITimingCurveProvider) { }
  /// 애니메이션 실행을 즉시 시작하는 애니메이터 객체를 생성하고 반환합니다.
  public class func runningPropertyAnimator(
    withDuration duration: TimeInterval,
    delay: TimeInterval,
    options: UIView.AnimationOptions,
    animations: () -> Void,
    completion: ((UIViewAnimatingPosition) -> Void)?
  ) -> Self {
    return UIViewPropertyAnimator(duration: duration, dampingRatio: 0, animations: nil) as! Self
  }

  // Modifying Animations

  /// 애니메이터에 지정된 애니메이션 블록을 추가합니다.
  public func addAnimations(_ animation: @escaping () -> Void) { }
  /// 지연과 함께 애니메이터에 지정된 애니메이션 블록을 추가합니다.
  public func addAnimations(_ animation: @escaping () -> Void, delayFactor: CGFloat) { }
  /// 애니메이터에 지정된 애니메이션 블록을 추가합니다.
  public func addCompletion(_ completion: @escaping (UIViewAnimatingPosition) -> Void) { }
  /// 일시정지된 애니메이션의 타이밍과 지속기간을 조정합니다.
  public func continueAnimation(
    withTimingParameters parameters: UITimingCurveProvider?,
    durationFactor: CGFloat
  ) { }

  // Accessing the Animation Parameters

  /// 메인 애니메이션의 총 지속 시간(초)
  public var duration: TimeInterval { return 0 }
  /// 애니메이션이 시작되기까지의 지연 시간(초)
  public var delay: TimeInterval { return 0 }
  /// 애니메이션의 타이밍 커브를 결정하는데 사용되는 정보 (@NSCopying)
  public var timingParameters: UITimingCurveProvider? { return nil }
  /// 애니메이터가 중단 가능하고 일시중지 또는 중지될 수 있는지 여부를 나타내는 불린 값
  public var isInterruptible: Bool = true
  /// 애니메이션이 실행되는 동안 뷰가 터치 이벤트를 받을 수 있는지 여부를 나타내는 불린 값
  public var isUserInteractionEnabled: Bool = true
  /// 애니메이션이 진행 중일 때 앱이 hit-testing을 관리하는지 여부를 나타내는 불린 값
  public var isManualHitTestingEnabled: Bool = false
  /// 일시중지된 애니메이션이 선형으로 스크럽되는지 지정된 타이밍 정보를 사용하는지 나타내는 불린 값
  public var scrubsLinearly: Bool = true
  /// 완료된 애니메이션이 활성 상태로 유지되는지 나타내는 불린 값
  public var pausesOnCompletion: Bool = false

  // Others

  public func copy(with zone: NSZone? = nil) -> Any { return 0 }
}
