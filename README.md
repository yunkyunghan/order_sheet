## Technologies used

 * `HTML`
 * `CSS` [Style/Presentation]
 * `Javascript` [Function]
 * `MSSQL`

## 소개
이 프로젝트는 기업 활동의 근간 프로그램 `‘ERP’의 발주 시스템을 구현`한 것입니다. <br>
발주 `넣기(add)`, `목록(list)`, `수정(modify)`, `보기(view)` 4가지로 구성되어 있습니다. <br>
코드와 함께 각각의 코드들이 어떤 역할을 하는지에 대한 주석 달아뒀습니다. 또한 아래에 4가지 모드를 첨부하였습니다. <br>
(만약 발주서가 구현되는 함수 위주로 보고싶다면 `admin폴더의 scm_Order폴더`를 확인해주세요)

___
![ezgif com-gif-maker](https://user-images.githubusercontent.com/75987810/108172122-c3653400-713f-11eb-91ce-3dfd858f64f3.gif)
___
## Function
* (list) 저장 DB 목록을 페이지에 로드
* (add) 품목명 선택 후 단가 및 공급가액 자동 계산 후 SQL에 저장 - 추가하는 데이터에 따른 행 추가 기능 구현
* (modify) 호출 DB 수정 후 저장 기능 - asp박스 데이터를 수정할 수 있는 input 박스 구현
* (view) 저장된 DB 값을 확인하는 페이지 - 데이터 호출을 위한 asp박스와 시각화를 위한 input 박스 구현
