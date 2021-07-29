//
//  UIViewControllerAnimatedTransitioning.swift
//  
//
//  Created by DaEun Kim on 2021/07/29.
//

import Foundation

@available(iOS 7.0, macCatalyst 13.0, tvOS 9.0, *)
@objc public protocol UIViewControllerAnimatedTransitioning {

  /// 애니메이터 객체에 트랜지션 애니메이션을 수행하도록 알립니다.
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
  /// 애니메이터 객체에 트랜지션 애니메이션이 완료되었음을 알립니다.
  @objc optional func animationEnded(_ transitionCompleted: Bool)

  /// 애니메이터 객체에 트랜지션 애니메이션의 지속시간(초 단위)을 요청합니다.
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval

  /// 트랜지션 중에 사용할 중단가능한 애니메이터를 반환합니다.
  @objc optional func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating
}
