//
//  AVAudioSession.swift
//  
//
//  Created by DaEun Kim on 2021/08/21.
//

@available(iOS 3.0, macCatalyst 13.0, tvOS 10.0, watchOS 2.0, *)
public class AVAudioSession {

  @available(iOS 6.0, macOS 10.15, macCatalyst 13.0, tvOS 9.0, watchOS 7.0, *)
  public struct CategoryOptions: OptionSet {
    public var rawValue: UInt

    // Audio Session Options

    /// 이 세션의 오디오가 다른 오디오 앱의 활성 세션의 오디오와 혼합되는지 여부를 나타내는 옵션
    public static var mixWithOthers: CategoryOptions { CategoryOptions(rawValue: 1) }
    /// 이 세션의 오디오가 재생되는 동안 다른 오디오의 볼륨을 줄이는 옵션
    public static var duckOthers: CategoryOptions { CategoryOptions(rawValue: 1) }
    /// 앱에서 오디오를 재생할 때 다른 세션의 오디오 콘텐츠를 일시 중지할지 여부를 결정하는 옵션
    public static var interruptSpokenAudioAndMixWithOthers: CategoryOptions { CategoryOptions(rawValue: 1) }
    /// 블루투스 핸즈프리 기기가 사용 가능한 입력 경로로 표시되는지 여부를 결정하는 옵션
    public static var allowBluetooth: CategoryOptions { CategoryOptions(rawValue: 1) }
    /// 이 세션의 오디오를 A2DP(Advanced Audio Distribution Profile)을 지원하는 블루투스 기기로 스트리밍할 수 있는지 여부를 결정하는 옵션
    public static var allowBluetoothA2DP: CategoryOptions { CategoryOptions(rawValue: 1) }
    /// 이 세션에서 AirPlay 장치로 오디오를 스트리밍할 수 있는지 여부를 결정하는 옵션
    public static var allowAirPlay: CategoryOptions { CategoryOptions(rawValue: 1) }
    /// 세션의 오디오가 리시버 대신 내장 스피커로 기본 설정되는지 여부를 결정하는 옵션
    public static var defaultToSpeaker: CategoryOptions { CategoryOptions(rawValue: 1) }
    /// 내장 마이크를 음소거할 때 시스템이 오디오 세션을 중단하는지 여부를 나타내는 옵션
    public static var overrideMutedMicrophoneInterruption: CategoryOptions { CategoryOptions(rawValue: 1) }

    // Initializers

    /// 카테고리 옵션 인스턴스를 생성합니다.
    public init(rawValue: UInt) { self.rawValue = rawValue }
  }
}
