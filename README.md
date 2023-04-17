# Reconlabs 사전과제


## 최초 프로젝트 구조 
swift package manager 모듈로 구성했으나 
CoreData의 리소스 참조 이슈로 시간관계상 모듈화 구조에서
단일 프로젝트 구조로 변경

````
├── FeatureCamera
│   ├── Sources
│   └── Tests
├── FeatureMain
│   ├── Sources
│   └── Tests
├── Features
│   ├── Sources
│   └── Tests
├── Reconlabs
│   ├── Assets.xcassets
│   ├── Preview Content
│   └── Reconlabs.xcdatamodeld
├── Reconlabs.xcodeproj
│   ├── project.xcworkspace
│   └── xcuserdata
├── ReconlabsTests
├── ReconlabsUITests
├── Sources
│   └── Reconlabs
├── Tests
│   └── ReconlabsTests
├── UserInterface
│   ├── Sources
│   └── Tests
└── Util
    ├── Sources
    └── Tests
````

## 프로젝트 구조
````
├── Reconlabs
│   ├── Assets.xcassets
│   ├── Entities
│   ├── Features
│   ├── Helpers
│   ├── Preview Content
│   ├── Reconlabs.xcdatamodeld
│   ├── UserInterface
│   └── Utils
├── Reconlabs.xcodeproj
│   ├── project.xcworkspace
│   └── xcuserdata
├── ReconlabsTests
├── ReconlabsUITests
└── Tests
    └── ReconlabsTests
````

## 요구사항
### 메인뷰

- [ ]  AR뷰로 들어가기 위한 버튼이 화면 상단에 위치합니다
    - [ ]  글자색: white
    - [ ]  배경색: blue
    - [ ]  테두리 반지름: 20
    - [ ]  width: 250, height: 60
    - [ ]  버튼 액션: AR뷰가 아래에서 위로 화면을 덮습니다


- [ ]  [중요] AR뷰에서 촬영한 이미지들을 3열의 그리드로 나타내 주세요.
    - [ ]  Core Data에 저장되어있는 이미지들을 불러옵니다
    - [ ]  저장된 이미지들은 3열의 그리드로 표현됩니다


### AR뷰

- [ ]  AR뷰를 종료하고 메인뷰로 돌아가기 위한 버튼이 화면 좌상단에 위치합니다
    - [ ]  글자색: white
    - [ ]  배경색: blue
    - [ ]  테두리 반지름: 10
    - [ ]  버튼 액션: AR뷰어 위에서 아래로 내려가면서 메인뷰가 드러나며. AR세션이 종료됩니다.

   
- [ ]  촬영을 위한 원형의 버튼(=촬영버튼)이 화면 중앙 하단에 위치합니다
    - [ ]  원형 디자인의 버튼을 만들어주세요
    - [ ]  [중요] 버튼 클릭 시 현재 AR뷰가 캡쳐되어 Core Data를 통해 기기에 저장됩니다
- [ ]  [중요] Plane Detection(Vertical, Horizontal 무관) 시, 최초로 Detect된 Plane에 가로, 세로, 높이 10cm의 red색상의 Box가 추가됩니다


- [ ]  [중요] AR환경에서의 Model을 회전시키기 위한 버튼 세가지가 촬영버튼 바로 위에 존재합니다
    - [ ]  “x-axis rotation” 버튼 클릭 시, Model이 x축으로 시계방향으로 360도 회전합니다
    - [ ]  “y-axis rotation” 버튼 클릭 시, Model이 y축으로 시계방향으로 360도 회전합니다
    - [ ]  “z-axis rotation” 버튼 클릭 시, Model이 z축으로 시계방향으로 360도 회전합니다
    - [ ]  [중요] 회전을 시키기 위해 사용되는 로직은 4x4 행렬을 이용해 주세요

## 사용기술, 도구 
- SwiftUI
- ARKit
- CoreData
- SF Symbols