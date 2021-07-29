//
//  UIView.swift
//  
//
//  Created by DaEun Kim on 2021/06/20.
//

@available(iOS 2.0, macCatalyst 13.0, tvOS 9.0, *)
public class UIView {

  /// 블록 객체를 사용해 뷰를 애니메이팅하기 위한 옵션
  @available(iOS 4.0, macCatalyst 13.0, tvOS 9.0, *)
  public struct AnimationOptions {

    /// 커밋할 때, (commit time) 서브뷰를 배치하여 부모와 함께 애니메이션되도록 합니다.
    public static var layoutSubviews: UIView.AnimationOptions = Self(1 << 0)
    /// 뷰가 애니메이팅될 떄, 해당 뷰에 대한 유저 인터랙션을 허용합니다.
    public static var allowUserInteraction: UIView.AnimationOptions = Self(1 << 1)
    /// 이미 진행 중인 애니메이션과 관련된 현재 설정에서 애니메이션을 시작합니다.
    public static var beginFromCurrentState: UIView.AnimationOptions = Self(1 << 2)
    /// 애니메이션을 무기한 반복합니다.
    public static var `repeat`: UIView.AnimationOptions = Self(1 << 3)
    /// 애니메이션을 실행했다가 원상태로 되돌립니다.(repeat옵션과 함께 사용)
    public static var autoreverse: UIView.AnimationOptions = Self(1 << 4)
    /// 애니메이션이 제출될 때, 지정된 기존 duration 값을 사용하도록 애니메이션을 강제합니다.
    public static var overrideInheritedDuration: UIView.AnimationOptions = Self(1 << 5)
    /// 애니메이션이 제출될 때, 지정된 기존 curve 값을 사용하도록 애니메이션을 강제합니다.
    public static var overrideInheritedCurve: UIView.AnimationOptions = Self(1 << 6)
    /// 프로퍼티 값을 동적으로 변경하고, 뷰를 다시 그려서 뷰를 애니메이션합니다.
    public static var allowAnimatedContent: UIView.AnimationOptions = Self(1 << 7)
    /// 뷰가 트랜지션될 때, 뷰를 숨기거나 표시합니다.
    public static var showHideTransitionViews: UIView.AnimationOptions = Self(1 << 8)
    /// 애니메이션 타입 또는 옵션을 상속하지 않는 옵션
    public static var overrideInheritedOptions: UIView.AnimationOptions = Self(1 << 9)

    /// 애니메이션이 느리게 시작되고, duration 동안 가속된 다음, 완료되기 전에 다시 느리게하는 ease-in ease-out curve를 지정합니다.
    public static var curveEaseInOut: UIView.AnimationOptions = Self(0 << 16)
    /// ease-in curve는 애니메이션을 천천히 시작한 다음, 다음 진행에 따라 속도를 높입니다.
    public static var curveEaseIn: UIView.AnimationOptions = Self(1 << 16)
    /// ease-out curve는 애니메이션을 빠르게 시작한 다음, 완료됨에 따라 느려집니다.
    public static var curveEaseOut: UIView.AnimationOptions = Self(2 << 16)
    /// linear 애니메이션 curve는 애니메이션이 duration 동안 균등하게 발생하도록 합니다.
    public static var curveLinear: UIView.AnimationOptions = Self(3 << 16)

    /// 수직축을 중심으로 뷰를 왼쪽에서 오른쪽으로 뒤집는 트랜지션(뷰의 왼쪽은 앞으로, 오른쪽은 뒤로 이동)
    public static var transitionFlipFromLeft: UIView.AnimationOptions = Self(0 << 20)
    /// 수직축을 중심으로 뷰를 오른쪽에서 왼쪽으로 뒤집는 트랜지션(뷰의 오른쪽은 앞으로, 왼쪽은 뒤로 이동)
    public static var transitionFlipFromRight: UIView.AnimationOptions = Self(1 << 20)
    /// 뷰를 아래쪽에서 위로 컬링하는 트랜지션
    public static var transitionCurlUp: UIView.AnimationOptions = Self(2 << 20)
    /// 뷰를 위쪽에서 아래로 컬링하는 트랜지션
    public static var transitionCurlDown: UIView.AnimationOptions = Self(3 << 20)
    /// 다음 뷰로 디졸브되는 트랜지션
    public static var transitionCrossDissolve: UIView.AnimationOptions = Self(4 << 20)
    /// 수평축을 중심으로 뷰를 위에서 아래로 뒤집는 트랜지션(뷰의 윗면이 앞으로, 아랫면이 뒤로 이동)
    public static var transitionFlipFromTop: UIView.AnimationOptions = Self(5 << 20)
    /// 수평축을 중심으로 뷰를 아래에서 위로 뒤집는 트랜지션(뷰의 아랫면이 앞으로, 윗면이 뒤로 이동)
    public static var transitionFlipFromBottom: UIView.AnimationOptions = Self(6 << 20)

    /// 초당 30 프레임의 프레임 속도
    public static var preferredFramesPerSecond30: UIView.AnimationOptions = Self(7 << 24)
    /// 초당 60 프레임의 프레임 속도
    public static var preferredFramesPerSecond60: UIView.AnimationOptions = Self(3 << 24)

    public init(rawValue: UInt) {  }
    private init(_ rawValue: Int) { }
  }
}
