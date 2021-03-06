# Managing Files and Folders in Your Xcode Project

프로젝트에 새 파일 또는 기존 파일을 추가하고 그룹을 사용하여 Project navigator에서 파일과 폴더를 구성합니다.

## Overview

Project navigator는 프로젝트의 파일을 표시하고, 해당 파일을 열고, 추가하고, 삭제하고, 재정렬할 수 있습니다. Project navigator를 열려면 프로젝트 창의 navigator 영역 상단에서 파일 폴더 같이 생긴 아이콘을 클릭하세요.

![figure1](Managing-Files-and-Folders-in-Your-Xcode-Project-figure1)

네비게이터에서 파일을 선택하면, 인스펙터 창에 해당 파일에 대한 정보를 표시되고, 에디터 영역은 파일의 콘텐츠를 표시합니다. 에디터 영역의 모습은 선택한 파일 유형에 따라 변경됩니다. 예를 들어, 소스 코드 파일은 소스 에디터를 표시하고, property-list 파일은 property-list 에디터를 표시합니다.

키워드 또는 기타 기준에 따라 파일을 찾으려면 네비게이터 영역 하단에 있는 필터 검색 창을 사용하세요:

- 파일을 검색하려면, 필터 검색 창에 키워드를 입력하세요.
- 최근 수정된 파일만 보려면, Recent Files 아이콘을 클릭하세요.
- source-control 상태가 변경된 파일만 보려면 Source Control 아이콘을 클릭하세요.

### Add New Files to a Project

Xcode는 Swift 파일 또는 플레이그라운드와 같이 프로젝트에 추가할 수 있는 일반적인 유형의 파일에 대한 템플릿을 제공합니다. Project navigator에서 파일을 추가하려는 폴더 또는 그룹을 선택하고, 다음 중 한 가지를 수행하세요.

- 필터 표시줄의 Add 버튼(+)을 클릭하고, 팝업 메뉴에서 File을 선택하세요.
- New > File을 선택하세요.
- Control-click하고, New File을 선택하세요.

새 파일 시트에서 새로운 파일의 템플릿을 선택하세요. Xcode는 쉽게 찾을 수 있도록 유형별로 템플릿을 구성합니다.

![figure2](Managing-Files-and-Folders-in-Your-Xcode-Project-figure2)

일부 템플릿에서는 새 파일에 대한 추가 정보를 지정해야 합니다. 예를 들어, Cocoa Touch 템플릿은 부모 클래스 이름을 포함하여 생성 중인 클래스에 대한 정보를 지정하도록 요청합니다. Xcode는 이 정보를 사용해 일부 초기 콘텐츠로 파일을 채웁니다.

최종 단계는 파일을 파일 시스템에 저장하는 것입니다. Xcode가 파일 위치를 묻는 프롬프트를 표시하면, 그룹 및 타겟 정보도 지정하도록 요청합니다. 그룹은 프로젝트에서 파일의 위치를 나타내며, Xcode는 컨텍스트 정보를 기반으로 기본 그룹을 선택합니다. Xcode는 또한 기본 타겟을 선택합니다. 관련된 타겟 및 그룹 으로 변경하고 Create를 클릭하여 파일을 생성합니다.

![figure3](Managing-Files-and-Folders-in-Your-Xcode-Project-figure3)

### Add Existing Files and Folders to a Project

Xcode는 프로젝트에 기존 파일과 폴더를 추가하는 여러 가지 방법을 제공합니다:

- Finder에서 Project navigator로 파일을 드래그하세요.
- Project navigator의 필터 표시줄에서 Add 버튼(+)을 클릭하고 Add Files to "projectName"를 선택하세요.
- File > Add Files to "projectName"을 선택하세요.

Xcode는 파일과 폴더를 선택하고 프로젝트에 추가할 방법을 설정하라는 프롬프트를 표시합니다. (만약 설정 옵션이 표시되지 않으면, 시트 하단에 있는 Options 버튼을 클릭하세요.) 파일 및 폴더를 프로젝트에 통합하는 방법에 대한 옵션과 하나 이상의 타겟을 선택하세요.

 프로젝트에 파일과 폴더를 추가할 때, 다음 옵션 중 한 가지를 선택하세요:

- **Copy items if needed.** Project navigator에 추가하기 전에 모든 파일과 폴더를 프로젝트 풀더에 복사합니다. 원본 버전 대신 파일 복사본에서 작업하려면 이 옵션을 사용하세요.
- **Create groups.** 디스크에서 선택한 필드 및 폴더의 구조와 일치하는 그룹 구조를 프로젝트에 생성합니다. Xcode는 추가한 각 폴더에 대해 Project navigator에 그룹을 만들고 폴더의 콘텐츠를 해당 그룹에 추가합니다.
- **Create folder references.** Project navigator에 폴더를 표시하지만, 프로젝트에 복사하지는 않습니다. Project navigator에서 추가된 각 폴더는 파일 시스템의 폴더를 가리킵니다.

### Organize Project Files in the Navigator

대부분의 새 프로젝트에는 생성된 프로덕트에서 소스 파일을 분리하는 것과 같이 프로젝트 콘텐츠를 구성하기 위한 몇 가지 구조가 포함되어 있습니다. 추가 그룹과 폴더를 만들어 콘텐츠를 구성하고, 대규모 프로젝트를 더 쉽게 탐색할 수 있습니다.

- 폴더는 프로젝트에서 참조하는 파일 시스템 디렉토리입니다. Xcode에는 프로젝트의 폴더 폴더 콘텐츠가 포합됩니다.
- 그룹은 프로젝트의 리소스 모음입니다. 기본적으로, Xcode는 각 그룹을 프로젝트 디렉토리의 폴더에 매핑하지만, 기본 파일 시스템 폴더 없이 그룹을 만들 수도 있습니다. 디스크에 있는 파일의 기본 구성을 변경하지 않고 프로젝트의 파일을 관리하려는 경우 폴더가 없는 그룹을 사용할 수 있습니다.

Project navigator에서 직접 인터랙션 또는 메뉴 커맨드를 사용해 그룹을 만들고 수정하세요:

- **폴더로 매핑되는 새 그룹을 생성하세요.** 항목을 선택하고 File > New > Group을 선택하거나 항목을 Control-click하고 상황에 맞는 메뉴에서 New Group을 선택하세요.
- **폴더 없이 새 그룹을 생성하세요.** 항목을 선택하고 File > New > Group without Folder을 선택하거나 항목을 Control-click하고 상황에 맞는 메뉴에서 New Group without Folder를 선택하세요.
- **그룹을 생성하고 항목을 그룹으로 이동하세요.** 항목을 선택하고, File > New > Group from Selection을 선택하거나 선택한 항목을 Control-click하고, New Group from Selection을 선택합니다.
- **파일 또는 그룹의 이름을 변경하세요.** 파일 또는 그룹을 더블클릭하고, 새 이름을 입력하세요.
- **그룹에 연결된 폴더를 변경합니다.** 그룹을 선택하고 View > Inspectors > Show File Inspector를 선택하세요. Finder에서 File inspector의 Location 아래에 있는 이전 폴더 이름으로 새 폴더를 드래그하세요.

> Important: 그룹이 폴더와 연결되어 있으면 Xcode는 파일 시스템의 폴더에서 모든 이름 바꾸기, 삭제, 이동 및 복사 작업을 수행합니다. 소스 컨트롤이 적용된 프로젝트의 경우 Xcode는 소스 컨트롤 시스템을 사용하여 작업을 수행하고 변경 사항을 추적합니다. 동일한 Git 레포지토리의 그룹 간에 파일을 이동하면 Xcode가 파일 시스템의 파일을 이동합니다. 파일이 다른 리포지토리에 있는 경우 Xcode는 파일을 새 리포지토리의 폴더에 복사합니다.

### Delete Files and Folders

프로젝트에서 파일 또는 폴더를 삭제하려면, 해당 항목을 선택하고 Delete 키를 누르거나 Edit > Delete를 선택하세요. Xcode는 선택한 항목에 대한 삭제 방법을 묻는 프롬프트를 표시합니다.

- **Move to Trash** 이 옵션은 프로젝트 및 파일 시스템에서 파일과 폴더를 삭제합니다. 파일의 정보가 더이상 필요하지 않은 경우, 이 옵션을 사용하세요.
- **Remove Reference** 이 옵션은 프로젝트에서만 파일과 폴더를 삭제합니다. Xcode는 파일 시스템에서 항목들을 삭제하지 않습니다.
