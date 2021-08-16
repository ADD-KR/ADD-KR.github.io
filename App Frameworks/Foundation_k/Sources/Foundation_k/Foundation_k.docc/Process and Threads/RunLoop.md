# ``Foundation_k/RunLoop``

@Metadata {
    @DocumentationExtension(mergeBehavior: override)
}

입력 소스를 관리하는 객체의 인터페이스

## Overview

RunLoop 객체는 window 시스템, [Port](https://developer.apple.com/documentation/foundation/port) 객체 및 [NSConnection](https://developer.apple.com/documentation/foundation/nsconnection/) 객체의 마우스 및 키보드 이벤트 같은 소스에 대한 입력을 처리합니다. 또한 RunLoop객체는 ``Timer`` 이벤트를 처리합니다.

앱이 RunLoop 객체를 생성하거나 명시적으로 관리하지 않습니다. 앱의 메인 스레드를 포함한 각 [Thread](https://developer.apple.com/documentation/foundation/thread) 객체는 필요에 따라 자동으로 생성된 RunLoop 객체를 가집니다. 만약 현재 스레드의 런루프에 접근해야 하는 경우 ``current`` 클래스 메서드를 사용할 수 있습니다.

RunLoop의 관점에서 보면, ``Timer`` 객체는 "입력"이 아닙니다. 타이머는 특별한 타입이며, 즉, 타이머가 작동할 때 런루프의 복귀를 유발하지 않는다는 것을 뜻합니다.

> Warning: RunLoop 클래스는 일반적으로 스레드가 안전하다고 간주되지 않으며, RunLoop의 메서드들은 현재 스레드의 컨텍스트에서만 호출되어야 합니다. 다른 스레드에서 실행되는 RunLoop 객체의 메서드를 호출해서는 안됩니다. 호출한다면 예기치 않은 결과가 발생할 수 있습니다.

## Topics

### Accessing Run Loops and Modes

- ``current``
- ``currentMode``
- ``limitDate(forMode:)``
- ``main``
- ``Mode``

### Managing Timers

- ``add(_:forMode:)-8dx6e``

### Managing Ports

- ``add(_:forMode:)-6nmry``
- ``remove(_:forMode:)``

### Running a Loop

- ``run()``
- ``run(mode:before:)``
- ``run(until:)``
- ``acceptInput(forMode:before:)``

### Scheduling and Canceling Tasks

- ``perform(_:)``
- ``perform(inModes:block:)``
- ``perform(_:target:argument:order:modes:)``
- ``cancelPerform(_:target:argument:)``
- ``cancelPerformSelectors(withTarget:)``

### Scheduling Combine Publishers

- ``schedule(options:_:)``
- ``schedule(after:tolerance:options:_:)``
- ``schedule(after:interval:tolerance:options:_:)``
- ``minimumTolerance``
- ``now``
- ``SchedulerTimeType``
- ``SchedulerOptions``
