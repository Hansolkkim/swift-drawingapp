# iOS - Drawing App



## 프로그램 설명

1. `사각형 생성` 에 해당하는 버튼을 누르면 임의의 좌표에 임의의 배경색, 임의의 투명도를 가진 사각형이 생성됩니다.
2. 생성된 사각형을 터치하면 오른쪽의 `배경색 버튼` 과 `투명도 조절 버튼`, 그리고 `투명도 조절 슬라이더` 가 활성화됩니다.
	1. `배경색 버튼`을 누르면 선택된 사각형의 **배경색**이 랜덤으로 변경됩니다.
	2. `투명도 버튼`을 누르거나, `투명도 슬라이더` 를 조절하면 선택된 사각형의 **투명도**가 변경됩니다.
3. 빈공간을 터치하면 오른쪽의 버튼, 슬라이더가 비활성화됩니다.
4. `사진 생성` 에 해당하는 버튼을 누르면 ImagePicker가 등장하게 되고, 이미지를 선택한 후 `Use` 버튼을 누르면 임의의 좌표에 임의의 투명도를 가진 사진 사각형이 생성됩니다.
5. 생성된 사진 사각형을 터치하면 오른쪽의 `투명도 조절 버튼`, `투명도 조절 슬라이더`가 활성화되고, `배경색 버튼`은 비활성화(숨겨짐) 됩니다.
	1. `투명도 버튼`을 누르거나, `투명도 슬라이더`를 조절하면 선택된 사각형의 **투명도**가 변경됩니다.
5. 두 손가락을 이용해 사각형을 이동시킬 수 있습니다.
	1. 이동 시에는 선택된 뷰를 임시로 복사하여 움직임을 볼 수 있고, 이동이 끝나면 복사된 뷰는 제거되고 선택된 뷰가 해당 위치로 이동합니다.



## 프로그램 데모

<img src="https://user-images.githubusercontent.com/92504186/158521188-12d0840a-fba2-4931-a356-9115ea63c823.gif" alt="SS 2022-03-16 PM 02 10 07" width="50%;" />



## Step별 주요 작업 내용

| Step | 주요 작업 내용                                               | 완성 일시        |
| ---- | ------------------------------------------------------------ | ---------------- |
| 1    | [주요 객체 구현](./docs/Step1README.md)                      | 2022.03.02 17:35 |
| 2    | [사각형 추가 기능 및 속성 변경 동작 구현](./docs/Step2README.md) | 2022.03.11 01:29 |
| 3    | [관찰자(Observer) 패턴 적용](./docs/Step3README.md)          | 2022.03.14 10:40 |
| 4    | [사진 추가 기능 구현](./docs/Step4README.md)                 | 2022.03.15 19:00 |
| 5    | [드래그 기능 구현](./docs/Step5README.md)                    | 2022.03.17 01:30 |

