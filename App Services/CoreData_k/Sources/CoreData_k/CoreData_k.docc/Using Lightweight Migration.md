# Using Lightweight Migration

경량(자동) 마이그레이션을 요청하여 앱의 변경사항에 맞게 데이터 모델을 업데이트합니다.

## Overview

Core Data는 일반적으로 경량 마이그레이션이라고 하는 자동 데이터 마이그레이션을 수행할 수 있습니다. 경량 마이그레이션은 원본과 대상 관리 객체 모델 간의 차이점으로부터 마이그레이션을 추론합니다.

### Generating an Inferred Mapping Model

자동 경량 마이그레이션을 수행하려면, Core Data가 런타임에 원본(source) 및 대상(destination) 관리 객체 모델을 찾을 수 있어야 합니다. Core Data는 [Bundle](https://developer.apple.com/documentation/foundation/bundle) 클래스의 [allBundles](https://developer.apple.com/documentation/foundation/bundle/1413705-allbundles)과 [allFrameworks](https://developer.apple.com/documentation/foundation/bundle/1408056-allframeworks) 메서드에서 반환된 번들에서 모델을 찾습니다. 찾은 다음 Core Data는 영구(Persistant) 엔티티 및 속성에 대한 스키마 변경을 분석하고, 추론된 매핑 모델을 생성합니다. 

추론된 매핑 모델을 생성하려면 명확한 마이그레이션 패턴에 맞는 변경이 필요합니다. 예를 들어:

- 속성의 추가
- 속성의 삭제
- nonoptinal 속성의 optional 속성으로 변경
- optional 속성이 non-optional 속성으로 변경 후 default 값 정의
- 엔티티나 프로퍼티의 이름 변경

### Managing Changes to Entities and Properties

엔티티나 프로퍼티의 이름을 변경하는 경우, 대상 모델의 renaming identifier를 이에 맞는 원본 모델의 프로퍼티 또는 엔티티 이름으로 설정할 수 있습니다. Xcode Data Modeling tool's 프로퍼티 인스펙터를 사용해 (엔티티 또는 속성에 대해) 관리되는 객체 모델의 renaming identifier를 설정할 수 있습니다. 예를 들어, 다음과 같이 할 수 있습니다:

- Car 엔티티의 이름을 Automobile로 변경
- Car의 color 속성의 이름을 paintColor로 변경

Renaming identifier 규범적인(canonical) 이름을 생성합니다. 그러니 renaming identifier를 원본 모델의 프로퍼티 이름을 설정하세요(프로퍼티가 이미 renaming identifier를 가지고 있다면 필요없습니다). 이것은 버전 2 모델의 프로퍼티의 이름을 변경할 수 있고, 버전 3에서 다시 변경할 수 있음을 의미합니다. 이름 변경은 버전 2에서 버전 3 또는 버전 1에서 버전 3으로 올바르게 작동합니다.

### Managing Changes to Relationships

또한 경량 마이그레이션은 관계 및 관계의 타입의 변경 사항을 관리할 수 있습니다. 새로운 관계를 추가하거나 기존 관계를 삭제할 수 있습니다. 또한 속성처럼 renaming identifier를 사용해 관계의 이름을 변경할 수 있습니다. 

게다가, to-one에서 to-many로 변경하거나, 정렬되지 않은 to-many를 정렬되도록 관계를 변경할 수 있습니다. (그리고 반대의 경우도 마찬가지)

### Managing Changes to Hierarchies

계층의 엔티티를 추가, 삭제 및 이름을 변경할 수 있습니다. 또한 새로운 부모 또는 자식 엔티티를 생성하고, 엔티티 계층에서 프로퍼티를 위아래로 이동할 수 있습니다. 엔티티를 계층 밖으로 이동할 수 있습니다. 하지만 엔티티 계층을 병합할 수는 없습니다. 두 개의 기존 엔티티가 원본에서 공통 부모를 공유하지 않는 경우, 대상(destination)에서 공통 부모를 공유할 수 없습니다.

### Confirming Whether Core Data Can Infer the Model

Core Data가 마이그레이션의 작업을 실제로 수행하지 않고도 원본과 대상 모델 사이에서 매핑 모델을 추론할 수 있는지 미리 검증하려는 경우, [NSMappingModel](https://developer.apple.com/documentation/coredata/nsmappingmodel)의 [inferredMappingModel(forSourceModel:destinationModel:)](https://developer.apple.com/documentation/coredata/nsmappingmodel/1506468-inferredmappingmodel) 메서드를 사용할 수 있습니다. Core Data가 추론된 모델을 생성할 수 있다면 이 메서드는 추론된 모델을 번환하고, 생성할 수 없다면 nil을 반환합니다.

만약 데이터 변경 사항이 자동 마이그레이션의 역량을 초과하는 경우, 중량(heavyweight) 마이그레이션을 수행할 수 있습니다(수동 마이그레이션이라고도 합니다).

### Requesting Lightweight Migration

[addPersistentStore(ofType:configurationName:at:options:)](https://developer.apple.com/documentation/coredata/nspersistentstorecoordinator/1468860-addpersistentstore)에 전달하는 options 딕셔너리를 사용해 자동 경량 마이그레이션을 요청할 수 있습니다. [NSMigratePersistentStoresAutomaticallyOption](https://developer.apple.com/documentation/coredata/nsmigratepersistentstoresautomaticallyoption) 키와 [NSInferMappingModelAutomaticallyOption](https://developer.apple.com/documentation/coredata/nsinfermappingmodelautomaticallyoption) 키에 해당하는 값을 true로 설정합니다:

```swift
let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
let options = [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true]
do {
    try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: options)
} catch {
    fatalError("Failed to add persistent store: \(error)")
}
```

이러한 설정을 사용하면, Core Data는 영구 저장소가 더 이상 현재 모델과 일치하지 않음을 탐지할 때 경량 마이그레이션을 시도합니다.
