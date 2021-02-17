<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SCM_NoticeAddControl.ascx.cs" Inherits="Admin_SCM_NoticeAddControl" %>

<!DOCTYPE = html>
<html lang="KO">

<head>
    <meta charset="UTF-8">
    <style>
        .top{
            width: 1150px;
            height: 250px;
            display: table;
            margin: 10 auto;
        }
        .top-left{
            width: 500px;
            height: 250px;
            display: table-cell;
            vertical-align: top;
        }
        .top-right{
            width: 650px;
            height: 250px;
            display: table-cell;
            vertical-align: top;
        }
        .top-content1{
            width: 488px;
            height: 248px;
            border: 2px solid black;
            border-collapse: collapse;
            margin-right: 10px;
            font-weight: bold;
        }
        .top-content2{
            width: 638px;
            height: 248px;
            border: 2px solid black;
            border-collapse: collapse;
            margin-left: 10px;
            font-weight: bold;
        }
        .top-content1 tr, .top-content1 tr td, .top-content2 tr, .top-content2 tr td{
            border: 1px solid black;
            font-size:15px;
        }
        .money{
            width: 1150px;
            height: 40px;
            border: 2px solid black;
            display: table;
            margin: 10 auto;
        }
        .money-left{
            width: 643px;
            height: 40px;
            display: table-cell;
            text-align: center;
            font-size: 25px;
            line-height: 50px;
            font-weight: bold;
        }
        .money-right{
            width: 500px;
            height: 40px;
            display: table-coll;
            text-align: center;
            font-size: 25px;
            line-height: 50px;
            font-weight: bold;
        }
        .center{
            width: 1150px;
            margin: 10 auto;
        }
        .center-content{
            width: 1150px;
            border: 1px solid grey;
            border-collapse: collapse;
            font-weight: bold;
            
        }
        .center-content tr, .center-content tr td{
            border: 1px solid grey;
            font-size: 15px;
        }
        .sum{
            width: 1150px;
            height: 40px;
            margin: 10 auto;
        }
        .sum-table{
            width: 1149px;
            height: 40px;
            border: 2px solid black;
            border-collapse: collapse;
            font-weight: bold;
        }
        .sum-table tr, .sum-table tr td{
            border: 1px solid black;
            font-size: 15px;
        }
        .line{
            width: 1150px;
            margin: 0 auto;
        }
        .bottom{
            width: 1150px;
            margin: 0 auto;
        }

        .w50 {width: 50px;}
        .w80 {width: 80px;}
        .w90 {width: 90px;}
        .w100 {width: 100px;}
        .w130 {width: 130px;}
        .w150 {width: 150px;}
        .w200 {width: 200px;}
        .w300 {width: 300px;}
        .w340 {width: 340px;}
        .w490 {width: 490px;}
        .w500 {width: 500px;}
        .w600 {width: 600px;}

        .h30 {height: 30px;}
        .h40 {height: 40px;}

        .text-left {text-align: left;}
        .text-center {text-align: center;}
        .text-right {text-align: right;}

        .back {background-color: #dcdcdc}
        .border-none {border: none;}

        .font-b {font-weight: bold;}
        .font15 {font-size: 15px;}
        .font25 {font-size: 25px;}
        .hidden_form { display: none} // 이 부분을 통해서 asp 박스들을 없애줌
        
    </style>

    <script type= "text/javaScript">
          var cnt = 1;
        
        // 1. [숫자에 세자리마다 콤마 붙이는 함수]
        function comma(num){                                                            // (3000000)
            var len, point, str;

            num = num + "";                                                             // 숫자를 문자열로 바꾸는 효과  ("3000000")
            point = num.length % 3;                                                     // 숫자의 자리수 3으로 나눠서 나머지 값을 point에 넣음   (7%3  -> 1로 나옴)
            len = num.length;                                                           // 숫자의 자리수     ("7")

            str = num.substring(0, point);                                               // 0부터 point까지 잘라서 str에 넣음    ("3")  
            while (point < len) {                                                       // point가 숫자의 자리수보다 작은 동안 반복  
            if (str != "") str += ",";                                                   //  str값이 비어있지 않다면 str = str+","     ("3,"")   ("3,000,")
                str += num.substring(point, point + 3);                                 // str = str + num.substing(point, point+3)     ("3,000")   ("3,000,000")  
                point += 3;                                                              // point = point + 3    (4 -> 7보다 작으므로 반복문 실행)  (7 -> 끝)
            }
            return str;
        }

         // 2. ['품목명' 선택하면 '품목코드'와 '단가' 자동입력 되는 부분]

        var dic={'':0,'www1234':300 , 'A0127':1500 , '0001A5':800, '0085A11':1500000 , '0001A2':27000, '103':540}

       
        function bringValue(form)
        {
            var item_name = form.parentElement.parentElement.getElementsByClassName('item')[0].value;               // class 'item'(품목명)의 value값은 품목코드로 되어있으며, 이 값을 item_name에 넣음
            var item_code = form.parentElement.parentElement.getElementsByClassName('code')[0].value;
            form.parentElement.parentElement.getElementsByClassName('code')[0].value = item_name;                   // item_name을 class 'code'(품목코드)의 value값에 넣음 -> 코드 자동 입력됨

            
            form.parentElement.parentElement.getElementsByClassName('uniprice')[0].value = dic[item_name];          // dic의 'item_name'의 값을 찾아서 class 'uniprice'(단가)의 value값에 넣음 -> 단가 자동 입력됨

            //uniprice에 콤마 적용
            var item_price =  form.parentElement.parentElement.getElementsByClassName('uniprice')[0].value;         // class 'uniprice'(단가)의 값을 item_price에 넣음
            var a = comma(item_price);                                                                              // item_price를 인자로 하여 comma함수 실행한 후 그 값을 a에 넣음
            form.parentElement.parentElement.getElementsByClassName('uniprice')[0].value = a;                       // a를 class 'uniprice'(단가)의 value값에 넣어줌 => 숫자값에 콤마를 붙여서 다시 넣어준 내용
        }

       // 3. ['공급가액', '부가세' 계산하는 부분]
        function calPrice(amount)
        {
            var quantity = Number(amount.parentElement.parentElement.getElementsByClassName('amount')[0].value);        // class 'amount'(수량)의 값을 숫자로 변경 (입력된 값이 문자이므로 숫자로 변경)
            
            var item_name = amount.parentElement.parentElement.getElementsByClassName('item')[0].value;                 // 3.의 uniprice에서 값 가져오지 않고(콤마 붙기 때문에) dic에서 바로 단가 바로 가져올 수 있도록 한 것 (콤마 붙어 있지 않은 숫자)                
            var unitPrice = dic[item_name];
            
            var sp =  quantity * unitPrice;                                                                             // 공급가액 (수량*단가)
            amount.parentElement.parentElement.getElementsByClassName('price')[0].value = sp;

            var vatp = sp * 0.1;                                                                                        // 부가세 (공급가액의 10%)
            amount.parentElement.parentElement.getElementsByClassName('vat')[0].value = vatp;
            
            var sprice = amount.parentElement.parentElement.getElementsByClassName('price')[0].value;                  
            var svat = amount.parentElement.parentElement.getElementsByClassName('vat')[0].value;                     

            var b = comma(sprice);                                                                                      // 공급가액을 인자로 하여 comma함수 실행한 후 결과값을 b에 넣음 
            var c = comma(svat);                                                                                        // 부가세를 인자로 하여 comma함수 실행한 후 결과값을 c에 넣음

            amount.parentElement.parentElement.getElementsByClassName('price')[0].value = b;                            // 공급가액에 콤마 붙어서 나타남
        amount.parentElement.parentElement.getElementsByClassName('vat')[0].value = c;                                  // 부가세에 콤마 붙어서 나타남
        }

        // 4. [맨 밑부분 각 항목 총계산되는 부분]
        function totalprice(form)
        {
            var total_price = 0;
            var total_amount = 0;
            var total_uniprice = 0;
            var total_vat = 0;                                                                                        
        
            for(var i = 0 ; i< document.getElementsByClassName('price').length ; i++){                                  //ex) i=0 이면 length=1이므로 조건이 성립하여 for문이 돌아감. 이때 각 항목들의 [0]값이 출력되어 나옴 ->length는 1부터 출력 됨.
                total_amount += Number((document.getElementsByClassName('amount')[i].value.replaceAll(",", "")))        // 반복문 돌아가면서 total_amount이 쌓임
                total_uniprice += Number((document.getElementsByClassName('price')[i].value.replaceAll(",", "")))       // 공급가액에 있는 모든 ","를 빈칸으로 바꿔줌 (콤마 삭제) -> 문자를 숫자값으로 -> 반복문 돌아가면서 total_price 쌓임
                total_vat += Number((document.getElementsByClassName('vat')[i].value.replaceAll(",", "")))              // 부가세에 있는 모든 ","를 빈칸으로 바꿔줌 (콤마 삭제) -> 문자를 숫자값으로  -> 반복문 돌아가면서 total_vat 쌓임
            };
            document.getElementsByClassName('total_amount')[0].value = total_amount;                    // 총수량
            document.getElementsByClassName('total_uniprice')[0].value = total_uniprice;                // 총공급가액
            document.getElementsByClassName('total_vat')[0].value = total_vat;                          // 총부가세    
            document.getElementsByClassName('total_price')[0].value = total_uniprice + total_vat;       // 총합계금액 (총공급가액+총부가세)

             // 각 부분에 콤마 적용
            var t_amount = document.getElementsByClassName('total_amount')[0].value;
            var t_uprice = document.getElementsByClassName('total_uniprice')[0].value;
            var t_vat = document.getElementsByClassName('total_vat')[0].value;
            var t_price = document.getElementsByClassName('total_price')[0].value;

            var d = comma(t_amount);                                                                     // 총수량에 콤마 적용
            var e = comma(t_uprice);                                                                     // 총공급가액에 콤마 적용   
            var f = comma(t_vat);                                                                        // 총부가세에 콤마 적용
            var g = comma(t_price);                                                                      // 총합계금액에 콤마 적용

            document.getElementsByClassName('total_amount')[0].value = d;
            document.getElementsByClassName('total_uniprice')[0].value = e;
            document.getElementsByClassName('total_vat')[0].value = f;
            document.getElementsByClassName('total_price')[0].value = g;

        }

        // 5. [input박스에 있는 내용들 모아서 asp값 넘기는 박스로 옮겨주는 함수]
            //행을 추가시 동일한 id를 만들 수 없고 다른 id값을 쓰려면 cs코드에도 다 추가해야돼서 복잡  , 같은 발주서끼리 항목을 묶기 위해서 cs코드로 넘겨주기 위해
            // asp박스는 그냥 넘겨주기 위한 수단일 뿐 우리는 그냥 input박스로 행의 데이터들을 묶어서 처리하고 asp박스로 넘겨줌  

            function setsubmit(form) {
           
            var input_codes = "";                           //asp에 넣을 값을 저장하는 변수들
            var input_items = "";
            var input_uniprices ="";
            var input_prices =""; 
            var input_vats ="";
            var input_amount =""; 

            // select의 value가 코드로 되어있고 보이는것만 item값이라서 딕셔너리 구조로 매칭되는 값들을 변경시켜서 저장하기 위해서 가지고 옴
            var dic={'':"전체",'www1234':"점보지우개" , 'A0127':"산토리니 배경액자" , '0001A5':"깨끗한 나라 물티슈", '0085A11':"이카운트 노트북", '0001A2':"편한 슬리퍼", '103':"잘붙어 딱풀"}
            
            for (i=0; i < document.getElementsByClassName('code').length ; i++) {                                           // i가 '코드' 클래스 개수보다 작을면 반복
                       
                 
                if (document.getElementsByClassName('item')[i].value != "") {                                               //item값이 입력이 되어있으면 밑에 if문 실행 =>
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_codes = input_codes + ',';} // 이 부분은 다른 행의 값들을 구분하기 위해서 콤마를 찍어주는 부분 ex) ['산토리니 배경액자깨끗한 나라 물티슈'] 원래 이렇게 저장됨 =>['산토리니 배경액자,깨끗한 나라 물티슈' ...]
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_items = input_items + ',';}  // 꼭 수량이어야 함. 왜냐하면 수량을 입력해야나머지 값들을 불러오기 때문임
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_uniprices = input_uniprices + ',';}
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_prices = input_prices + ',';}
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_vats = input_vats + ',';}
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_amount = input_amount + ',';}
                }                                         
                
                //and 연산을 쓴이유는 db들어갈 때 예를 들어 3,5,2, 이렇게 마지막까지 콤마가 찍히므로 마지막 ,콤마를 없애주는 역할
                if (document.getElementsByClassName('item')[i].value != "") {                                                    // item값이 비어있지 않으면 if문 실행
                input_codes = input_codes + document.getElementsByClassName('code')[i].value;                                    // 이 부분은 눈에 보이는 행의 값들
                input_items = input_items + dic[document.getElementsByClassName('item')[i].value];                               // 이부분에서 딕셔너리 구조를 사용함
                input_uniprices = input_uniprices + document.getElementsByClassName('uniprice')[i].value.replaceAll(",", "");    // replaceAll은 앞에있는 문자나 숫자를 뒤에 있는 문자나 숫자로 바꿀 수 있음
                input_vats = input_vats + document.getElementsByClassName('vat')[i].value.replaceAll(",", "");                  // 세번째 자리마다 콤마를 찍어주는데 우리도 다른 행의 데이터마다 컴마를 찍어주기 때문에 헷갈려서 삭제해주는 리플레이스올을 추가
                input_prices = input_prices + document.getElementsByClassName('price')[i].value.replaceAll(",", ""); 
                input_amount = input_amount + document.getElementsByClassName('amount')[i].value.replaceAll(",", "");
                }

            } 

            // 보다시피 포문 밖에 있는데 인풋 코드스에 모든 행의 값들이 다 저장되고 컴마가 찍힌 후 에이에스피 값에 저장됨

            // 클래스로 값을 불러오는 부분
            document.getElementsByClassName('submit_codes')[0].value = input_codes;                                         // 위에서 계산한 값을 asp박스에 넣어줌 -> 확인 누르면 db에 입력됨
            document.getElementsByClassName('submit_items')[0].value = input_items;
            document.getElementsByClassName('submit_uniprices')[0].value = input_uniprices;
            document.getElementsByClassName('submit_prices')[0].value = input_prices;
            document.getElementsByClassName('submit_vats')[0].value = input_vats;
            document.getElementsByClassName('submit_amounts')[0].value = input_amount;
 
            
        }
      
        // 6. [엔터를 치면 행이 추가되는 함수]
        function addRow(form) 
        {
            var last_line = document.getElementsByClassName('price').length-1                   // 0부터 숫자를 세고 1부터 길이를 세기 때문에 -1을 해줘야함 (length는 1부터 시작, 인덱스 0부터 시작하기 때문에 - 마지막행 인덱스값을 알기 위해서 )
            if (document.getElementsByClassName('price')[last_line].value != "")                // 마지막 행의 price가 비어있지 않으면(채워져있으면) 다음 행 생성, 'price'를 'vat'로 해도 상관없음!! (price가 채워져있을때만 엔터를 눌렀을 때 행 추가. 빈행일때 치면 추가 안 됨) 
            {
                var table = document.getElementsByClassName('center-content')[0];               // class 'center-content'를 가져옴
                var rowlen = table.rows.length;                                                 // table의 행의 개수
                var row = table.insertRow(rowlen);                                              // table에 rowlen번째 행 추가
           
            row.setAttribute("align","center");                                                 // 행에 속성이름과 속성값 추가 (중간정렬로)
            row.setAttribute("height","30");                                                    // 행에 속성이름과 속성값 추가 (높이 30)
             
             // 행추가시 첫번째 행과 동일하게 불러오는 것
           
            row.insertCell(0).innerHTML = '<input  class="code w100 border-none font15" value =""></input>';
            row.insertCell(1).innerHTML = '<select  onChange=bringValue(this),calPrice(this),totalprice(this),setsubmit(this) class="item w500 font15"> <option value="">전체</option> <option value="www1234">점보지우개</option><option value="A0127">산토리니 배경액자[400+400]</option><option value="0001A5">깨끗한 나라 물티슈[100매]</option><option value="0085A11">이카운트 노트북</option><option value="0001A2">편한 슬리퍼[260]</option><option value="103">잘붙어 딱풀</option></select>' ;
            row.insertCell(2).innerHTML = '<input  class="amount w50 text-center font15" onChange=calPrice(this),totalprice(this),pricenum(this),change(this),setsubmit(this) onKeypress="javascript:if(event.keyCode==13) {addRow(calPrice(this),totalprice(this),pricenum(this),change(this)); event.preventDefault();}"  value=""> </input>';
            row.insertCell(3).innerHTML = '<input  class="uniprice w100 text-right border-none font15" value =""></input>';
            row.insertCell(4).innerHTML = '<input  class="price w200 text-right border-none font15" onChange=totalprice(this) value=""></input>';
            row.insertCell(5).innerHTML = '<input  class="vat w150 text-right border-none font15" onChange=totalprice(this), setsubmit(this) value="" ></input>';
            }  
            
            
        }
        
         // 7. ['금액'부분에 총금액 가져오는 함수]
        function pricenum(form)
         {  
            var price_num = document.getElementsByClassName('total_price')[0].value;                    // 정리테이블에 있는 총합계 값 가져옴
            document.getElementsByClassName('price_num')[0].value = price_num;                          // 그 값을 금액테이블의 숫자값 부분에 넣어줌
           
         }


         function viewKorean(num)                                                                           // 금액을 한글로 변경하는 함수
        {   
            var hanA = new Array("","일","이","삼","사","오","육","칠","팔","구","십"); 
            var danA = new Array("","십","백","천","","십","백","천","","십","백","천","","십","백","천"); 
            var result = ""; 
                for(i=0; i<num.length; i++) {                                                              // 예 3000000
                    str = "";  
                    han = hanA[num.charAt(num.length-(i+1))];                                               // charAt(인수) 인수번째에 있는 글자를 읽어줌                                                                           
                    if(han != "")                                                                           
                        str += han+danA[i];                                                                 
                    if(i == 4) str += "만"; 
                    if(i == 8) str += "억"; 
                    if(i == 12) str += "조"; 
                    result = str + result;
                } 
            if(num != 0) 
                result = result + "원"; 
            return result ; 
        }
        

        function change(form)                                                                                   // 금액테이블 숫자값을 한글로 변환
        {   
            var price_kor = document.getElementsByClassName('total_price')[0].value.replaceAll(",", "");        // 정리테이블에 있는 총합계 값에서 콤마 빼서 가져옴
            var p_k = viewKorean(price_kor);                                                                    // 그 값을 인자로 하여 viewKorean함수 실행하여 금액을 한글로 변경
            document.getElementsByClassName('price_kor')[0].value = p_k;                                        // 변경된 값을 금액테이블 한글값 부분에 넣어줌           
        }


        // 8. [회사명 입력하면 회사정보 나오는 부분]
        function corInfo(form){
            var dic1 = {'ETRI':"000-000-000" , 'gs편의점':"111-111-111", 'IBK기업은행':"222-222-222", 'SKT':"333-333-333", '삼성생명':"444-444-444", '세브란스병원':"555-555-555"}
            var dic2 = {'ETRI':"한윤경" , 'gs편의점':"박준용", 'IBK기업은행':"신재현", 'SKT':"윤희정", '삼성생명':"전현지", '세브란스병원':"문상수"}
            var dic3 = {'ETRI':"서울특별시 서초구 서초동" , 'gs편의점':"서울특별시 서대문구 남가좌동", 'IBK기업은행':"서울특별시 강남구 압구정동", 'SKT':"서울특별시 관악구 흑성동", '삼성생명':"서울특별시 용산구 청파동", '세브란스병원': "서울특별시 마포구 연남동"}
            var dic4 = {'ETRI':"김신혜" , 'gs편의점':"류광헌", 'IBK기업은행':"유아영", 'SKT':"고승훈", '삼성생명':"최나리", '세브란스병원':"이태양"}
            var dic5 = {'ETRI':"010-000-000" , 'gs편의점':"010-111-111", 'IBK기업은행':"010-222-222", 'SKT':"010-333-333", '삼성생명':"010-444-444", '세브란스병원':"010-555-555"}
            var dic6 = {'ETRI':"../../fileUpload/Order/ETRi.png" ,'gs편의점':"../../fileUpload/Order/gs.png", 'IBK기업은행':"../../fileUpload/Order/ibk.png", 'SKT':"../../fileUpload/Order/skt.png", '삼성생명':"../../fileUpload/Order/samsung.png", '세브란스병원':"../../fileUpload/Order/severance.png"}
            var dic7 = {'ETRI':"공공" , 'gs편의점':"일반", 'IBK기업은행':"금융", 'SKT':"통신", '삼성생명':"보험", '세브란스병원':"의료"}

        
            document.getElementsByClassName('c_num')[0].value= dic1[document.getElementsByClassName('c_name')[0].value];            // dic1에서 회사명에 해당하는 값을 사업자등록번호에 넣어줌
            document.getElementsByClassName('c_leader')[0].value= dic2[document.getElementsByClassName('c_name')[0].value];         // dic2에서 회사명에 해당하는 값을 대표자에 넣어줌    
            document.getElementsByClassName('c_address')[0].value= dic3[document.getElementsByClassName('c_name')[0].value];        // dic3에서 회사명에 해당하는 값을 주소에 넣어줌
            document.getElementsByClassName('c_charge')[0].value= dic4[document.getElementsByClassName('c_name')[0].value]          // dic4에서 회사명에 해당하는 값을 담당에 넣어줌
            document.getElementsByClassName('c_phonenum')[0].value= dic5[document.getElementsByClassName('c_name')[0].value];       // dic5에서 회사명에 해당하는 값을 전화번호에 넣어줌
            document.getElementsByClassName('img')[0].src = dic6[document.getElementsByClassName('c_name')[0].value];               // dic6에서 회사명에 해당하는 값을 이미지넣는 부분에 넣어줌    
            document.getElementsByClassName('serial_num')[0].value = dic7[document.getElementsByClassName('c_name')[0].value];      // dic7에서 회사명에 해당하는 값을 분류에 넣어줌    
        } 

        
        // 9. [납기일자]
        function getToday(form){
        var today = new Date();                                     // 현재날짜 가져옴

        today.setDate(today.getDate()+3);                           // 현재날짜에 3일 더함
     
        document.getElementsByClassName('deadline')[0].value =today;    // 현재날짜에 3일 더한 값을 납기일자에 넣어줌
        
        }
        
    </script>
</head>

<body >
    
    <!-- 수신처, 발신처-->
    <div class="top">
        <div class="top-left">
            <table class = "top-content1">
                <tr><td class="w150 text-center">분류</td><td class="w340 "><asp:TextBox class="serial_num border-none font15" ID="txtserial_num" runat="server"></asp:TextBox></td></tr>


                <tr><td class="w150 text-center">수신</td><td class="w340">(주)튼튼한기업</td></tr>
                <tr><td class="w150 text-center">참조</td><td class="w340"></td></tr>
                <tr><td class="w150 text-center">TEL</td><td class="w340">010-1234-5678</td></tr>
                <tr><td class="w150 text-center">FAX</td><td class="w340">111-2222-3333</td></tr>
                <tr><td colspan="2" class="text-center"><asp:TextBox class="w490 text-center border-none deadline font15" ID="txtdue_date" runat="server"  ></asp:TextBox></td></tr>
            </table>


  
        </div> 
        <div class = "top-right">
            <table class = "top-content2">
                <tr><td colspan="2" class="text-center h40"><img class = "img" src ="" height="40px"><asp:FileUpload ID="FileUpload1" class="hidden_form" runat="server"/></asp:FileUpload></td></tr>
                <tr><td class="w150 text-center">사업자등록번호</td><td class="w490"><asp:TextBox class="c_num w340 border-none font15" ID="txtc_num" runat="server"  ></asp:TextBox></td></tr>

                <tr><td class="w150 text-center">회사명/대표</td>
                <td class="w490"> <asp:DropDownList  class="c_name font15" ID="txtc_name" runat="server"  onChange="corInfo(this),getToday(this)">
                    <asp:ListItem Value="">회사명</asp:ListItem>
                    <asp:ListItem Value="ETRI">ETRI</asp:ListItem>
                    <asp:ListItem Value="gs편의점">gs편의점</asp:ListItem>
                    <asp:ListItem Value="IBK기업은행">IBK기업은행</asp:ListItem>
                    <asp:ListItem Value="SKT">SKT</asp:ListItem>
                    <asp:ListItem Value="삼성생명">삼성생명</asp:ListItem> 
                    <asp:ListItem Value="세브란스병원">세브란스병원</asp:ListItem>  
                    </asp:DropDownList>&nbsp;<asp:TextBox class="c_leader w150 border-none font15" ID="txtc_leader" runat="server" ></asp:TextBox></td>
                </tr>
                
                <tr><td class="w150 text-center">주소</td><td class="w490"><asp:TextBox class="c_address border-none w490 font15" ID="txtc_address" runat="server" ></asp:TextBox></td></tr>
                <tr><td class="w150 text-center">담당/연락처</td><td class="w490"><asp:TextBox class="c_charge border-none w100 font15" ID="txtc_charge" runat="server" ></asp:TextBox>/<asp:TextBox class="c_phonenum w50 border-none w200 font15" ID="txtc_phonenum" runat="server"></asp:TextBox></td></tr>
            </table>
        </div>
    </div>
    <br>
    <!-- 금액-->

	<div class="money back">
        <div class="money-left ">금액 : <asp:TextBox ID="txtprice_kor" runat="server"  class="text-right border-none font25 price_kor w490 back font-b" value =""></asp:TextBox></div>
        <div class="money-right">(<asp:TextBox ID="txtprice_num" runat="server"  class="text-right border-none font25 price_num back font-b" value =""></asp:TextBox>원) / VAT포함</div>
    </div>


    <br>

    <!--내용테이블-->
    <div class="center">
        <table class="center-content">
            <tr class="text-center">
                <td class="w100 h30">품목코드</td>
                <td class="w500 h30">품목명[규격]</td>
                <td class="w80 h30">수량</td>
                <td class="w100 h30">단가</td>
                <td class="w200 h30">공급가액</td>
                <td class="w150 h30">부가세</td>
            </tr>
          <tr>
                <!--품목코드-->
                <td class="w100 h30 text-center"><input  id="code_1" class="code w100 border-none font15" value =""></input></td>
                <!--품목명-->
                <td  class="w500 h30 text-center">
                    <select id="item_1" class="item w500 font15" onChange=bringValue(this),calPrice(this),totalprice(this),setsubmit(this) >
                        <option value="">전체</option>
                        <option value="www1234">점보지우개</option>
                        <option value="A0127">산토리니 배경액자[400+400]</option>
                        <option value="0001A5">깨끗한 나라 물티슈[100매]</option>
                        <option value="0085A11">이카운트 노트북</option>
                        <option value="0001A2">편한 슬리퍼[260]</option>
                        <option value="103">잘붙어 딱풀</option>
                    </select> 	
                </td>
                <!--수량-->
                <td class="w80 h30 text-center"><input class="amount w50 text-center font15" value="" onchange="calPrice(this),totalprice(this),pricenum(this),change(this),setsubmit(this)" onKeypress="javascript:if(event.keyCode==13) {addRow(calPrice(this),totalprice(this),pricenum(this),change(this)); event.preventDefault();}"></input></td> <!--엔터쳤을 때 다음행으로 가게하는 명령어-->
                <!--단가-->
                <td class="w100 h30 text-center"><input   class="uniprice w100 text-right border-none font15"  value =""></input></td>
                <!--공급가액-->
                <td class="w200  h30 text-center"><input  class="price w200 text-right border-none font15" onChange=totalprice(this) value=""></input></td>
                <!--부가세-->
                <td class="w150 h30 text-center"><input  class="vat w150 text-right border-none font15" onChange=totalprice(this), setsubmit(this) value="" ></input></td>
            </tr>
        </table>
    </div>
    <br>
    <!-- 이 부분은 안보이는 에이에스피 박스들을 만드는 부분-->
    <asp:TextBox ID="submit_codes" runat="server" class = "submit_codes hidden_form" value =""></asp:TextBox>
    <asp:TextBox ID="submit_items" runat="server" class = "submit_items hidden_form" value =""></asp:TextBox>
    <asp:TextBox ID="submit_uniprices" runat="server" class = "submit_uniprices hidden_form" value =""></asp:TextBox>
    <asp:TextBox ID="submit_prices" runat="server" class = "submit_prices hidden_form" value =""></asp:TextBox>
    <asp:TextBox ID="submit_amounts" runat="server" class = "submit_amounts hidden_form" value =""></asp:TextBox>
    <asp:TextBox ID="submit_vats" runat="server" class = "submit_vats hidden_form" value =""></asp:TextBox>
    <br>
 
    <!--정리 테이블-->
    <div class="sum">
        <table class="sum-table">
            <tr>
                <td class="w100 text-center back">수량</td> <td class="w150"><asp:TextBox ID="txtt_amount" runat="server" class="total_amount text-right font15 border-none" value =""></asp:TextBox></td>
                <td class="w100 text-center back">공급가액</td> <td class="w150"><asp:TextBox ID="txtt_uniprice" runat="server" class="total_uniprice text-right font15 border-none " value =""></asp:TextBox></td>
                <td class="w100 text-center back">VAT</td><td class="w150"><asp:TextBox ID="txtt_vat" runat="server" class="total_vat text-right font15 border-none" value =""></asp:TextBox></td>
                <td class="w100 text-center back">합계</td><td class="w150"><asp:TextBox ID="txtt_price" runat="server" class="total_price text-right font15 border-none" value =""></asp:TextBox></td>
            </tr>
        </table>
    </div>

    <!--선-->
    <div class="line">
        <br>
        <br>
        <hr>
    </div>

    <!--맨 아래 버튼 부분-->
    <div class="bottom text-left">
        <input type="button" value="인쇄" >
        <input type="button" value="Excel">
        <input type="button" value="Email">
        <input type="button" value="닫기">
    </div>

	<!-- OnClick="btnSubmit_Click" -->
    <table width="1150px" border="0">
		<tr><td><HR SIZE=1></td></tr>
                <tr><td align="right">
                        <asp:ImageButton ID="btnSubmit" runat="server" ImageUrl="~/Images/ok_bt.gif" OnClick="btnSubmit_Click"  />
                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Images/cancel_bt.gif"
                            OnClick="btnCancel_Click" />
            </td></tr>
    </table>
</body>
</html>
