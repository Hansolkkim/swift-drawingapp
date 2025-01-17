<img src="https://user-images.githubusercontent.com/92504186/177108167-3b3537e4-2195-4b26-95ee-b9bca465a79e.png" alt="1024" width="20%;" />

## Drawing App 🎨

### Explaination 📝

1. `사각형 생성` 에 해당하는 버튼을 누르면 임의의 좌표에 임의의 배경색, 임의의 투명도를 가진 사각형이 생성됩니다.
2. 생성된 사각형을 터치하면 오른쪽의 `배경색 버튼` 과 `투명도 조절 버튼`, 그리고 `투명도 조절 슬라이더` 가 활성화됩니다.
  1. `배경색 버튼`을 누르면 선택된 사각형의 **배경색**이 랜덤으로 변경됩니다.
  2. `투명도 버튼`을 누르거나, `투명도 슬라이더` 를 조절하면 선택된 사각형의 **투명도**가 변경됩니다.
3. 빈공간을 터치하면 오른쪽의 버튼, 슬라이더가 비활성화됩니다.
4. `사진 생성` 에 해당하는 버튼을 누르면 ImagePicker가 등장하게 되고, 이미지를 선택한 후 `Use` 버튼을 누르면 임의의 좌표에 임의의 투명도를 가진 사진 사각형이 생성됩니다.
5. 생성된 사진 사각형을 터치하면 오른쪽의 `투명도 조절 버튼`, `투명도 조절 슬라이더`가 활성화되고, `배경색 버튼`은 비활성화(숨겨짐) 됩니다.
  1. `투명도 버튼`을 누르거나, `투명도 슬라이더`를 조절하면 선택된 사각형의 **투명도**가 변경됩니다.
6. 두 손가락을 이용해 사각형을 이동시킬 수 있습니다.
	1. 이동 시에는 선택된 뷰를 임시로 복사하여 움직임을 볼 수 있고, 이동이 끝나면 복사된 뷰는 제거되고 선택된 뷰가 해당 위치로 이동합니다.
7. 우측의 위치, 크기 버튼을 이용해 선택된 뷰의 위치와 크기를 단계적으로 조정할 수 있습니다.
  1. 단, X, Y, Width, Height 의 최솟값은 1.0 으로 그 이하로 수정할 수 없습니다.

### Screenshots 👀

| Main                                                         | Add Rectangle                                                |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![SS2022-07-04PM04 56 10](https://user-images.githubusercontent.com/92504186/177108803-3d49a466-f80c-4ec4-bfcc-5243498d44b2.jpg) | ![SS2022-07-04PM04 57 23](https://user-images.githubusercontent.com/92504186/177109097-cd6bccdb-839c-4a0e-bf4c-46c7b1d07134.jpg) |

| Add Picture                                                  | Drag & Drop                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![SS2022-07-04PM04 58 30](https://user-images.githubusercontent.com/92504186/177109239-f9ed2cb0-ff29-4cfe-81d0-2848d9e66bcf.jpg) | ![SS2022-07-04PM05 02 56](https://user-images.githubusercontent.com/92504186/177110081-a446b358-052c-455f-89f3-3e96742e452f.jpg) |

| Demo                                                         |
| ------------------------------------------------------------ |
| ![SS2022-07-04PM05 08 07](https://user-images.githubusercontent.com/92504186/177111134-cff48e78-ccf2-4afb-adb5-cd01193353e5.gif) |





### Step별 주요 작업 내용

| Step | 주요 작업 내용                                               | 완성 일시        |
| ---- | ------------------------------------------------------------ | ---------------- |
| 1    | [주요 객체 구현](./docs/Step1README.md)                      | 2022.03.02 17:35 |
| 2    | [사각형 추가 기능 및 속성 변경 동작 구현](./docs/Step2README.md) | 2022.03.11 01:29 |
| 3    | [관찰자(Observer) 패턴 적용](./docs/Step3README.md)          | 2022.03.14 10:40 |
| 4    | [사진 추가 기능 구현](./docs/Step4README.md)                 | 2022.03.15 19:00 |
| 5    | [드래그 기능 구현](./docs/Step5README.md)                    | 2022.03.17 01:30 |
| 6    | [위치와 크기 속성 변경 기능 구현](./docs/Step6README.md)     | 2022.03.28 21:59 |



### Troubls Shooting

1. BackgroundColor 타입을 설정할 때의 입력값에 대한 유효성 검사를 컴파일 타임에 확인할 수 있도록 설정
	- BackgroundColor 타입에 대한 프로그래밍 요구 조건 중, 해당 타입을 직접 구현하고, 입력값에 대한 유효성 검사를 컴파일 타임에 확인할 수 있도록 해보라는 내용이 있었습니다.
	- 해당 조건을 충족시키기 위해, BackgroundColor 타입의 프로퍼티(r,g,b)의 타입을 `UInt8`로 설정하여, 0~255 이외의 값으로 초기화하려는 경우, BackgroundColor 타입이 초기화가 되지 않도록 했습니다.
	- 위의 설정으로 앞서 말한 프로그래밍 요구 조건을 만족시킬 수 있었습니다.
