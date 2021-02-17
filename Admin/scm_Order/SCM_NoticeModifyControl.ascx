<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SCM_NoticeModifyControl.ascx.cs" Inherits="Admin_SCM_NoticeModifyControl"  %>


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

         
        // 1. [숫자에 세자리마다 콤마 붙이는 함수]
        function comma(num){
            var len, point, str;

            num = num + "";
            point = num.length % 3;
            len = num.length;

            str = num.substring(0, point);
            while (point < len) {
                if (str != "") str += ",";
                str += num.substring(point, point + 3);
                point += 3;
            }
            return str;
        }

         //2. ['품목명' 선택하면 '품목코드'와 '단가' 자동입력 되는 부분]

        var dic={'':0,'www1234':300 , 'A0127':1500 , '0001A5':800, '0085A11':1500000 , '0001A2':27000, '103':540}

       
        function bringValue(form)
        {
            var item_name = form.parentElement.parentElement.getElementsByClassName('item')[0].value;
            var item_code = form.parentElement.parentElement.getElementsByClassName('code')[0].value;
            form.parentElement.parentElement.getElementsByClassName('code')[0].value = item_name;

            
            form.parentElement.parentElement.getElementsByClassName('uniprice')[0].value = dic[item_name];

            //uniprice에 콤마 적용
            var item_price =  form.parentElement.parentElement.getElementsByClassName('uniprice')[0].value;
            var a = comma(item_price);
            form.parentElement.parentElement.getElementsByClassName('uniprice')[0].value = a;
        }

       // 3. ['공급가액', '부가세' 계산하는 부분]
        function calPrice(amount)
        {
            var quantity = Number(amount.parentElement.parentElement.getElementsByClassName('amount')[0].value);
            var item_name = amount.parentElement.parentElement.getElementsByClassName('item')[0].value;
          //위의 함수 uniprice에서 값 가져오지 않고(콤마 붙기 때문에) dic에서 바로 단가 바로 가져올 수 있도록 한 것
            var unitPrice = dic[item_name];

            var sp =  quantity * unitPrice;
            amount.parentElement.parentElement.getElementsByClassName('price')[0].value = sp;

            var vatp = sp * 0.1;
            amount.parentElement.parentElement.getElementsByClassName('vat')[0].value = vatp;
            
            //공급가액과 부가세에 콤마 적용
            var sprice = amount.parentElement.parentElement.getElementsByClassName('price')[0].value;
            var svat = amount.parentElement.parentElement.getElementsByClassName('vat')[0].value;

            var b = comma(sprice);
            var c = comma(svat);

            amount.parentElement.parentElement.getElementsByClassName('price')[0].value = b;
            amount.parentElement.parentElement.getElementsByClassName('vat')[0].value = c;
        }

        //4. [맨 밑부분 각 항목 총계산되는 부분]
        function totalprice(form)
        {
            var total_price = 0;
            var total_amount = 0;
            var total_uniprice = 0;
            var total_vat = 0;
            //ex) i=0 이면 length=1이므로 조건이 성립하여 for문이 돌아감. 이때 각 항목들의 [0]값이 출력되어 나옴 ->length는 1부터 출력 됨.
            for(var i = 0 ; i< document.getElementsByClassName('price').length ; i++){ 
                total_amount += Number((document.getElementsByClassName('amount')[i].value.replaceAll(",", "")))
                total_uniprice += Number((document.getElementsByClassName('price')[i].value.replaceAll(",", "")))
                total_vat += Number((document.getElementsByClassName('vat')[i].value.replaceAll(",", "")))
            };
            document.getElementsByClassName('total_amount')[0].value = total_amount;
            document.getElementsByClassName('total_uniprice')[0].value = total_uniprice;
            document.getElementsByClassName('total_vat')[0].value = total_vat;
            document.getElementsByClassName('total_price')[0].value = total_uniprice + total_vat;

             // 각 부분에 콤마 적용
            var t_amount = document.getElementsByClassName('total_amount')[0].value;
            var t_uprice = document.getElementsByClassName('total_uniprice')[0].value;
            var t_vat = document.getElementsByClassName('total_vat')[0].value;
            var t_price = document.getElementsByClassName('total_price')[0].value;

            var d = comma(t_amount);
            var e = comma(t_uprice);
            var f = comma(t_vat);
            var g = comma(t_price);

            document.getElementsByClassName('total_amount')[0].value = d;
            document.getElementsByClassName('total_uniprice')[0].value = e;
            document.getElementsByClassName('total_vat')[0].value = f;
            document.getElementsByClassName('total_price')[0].value = g;

        }
        // 5. [input박스에 있는 내용들 모아서 asp값 넘기는 박스로 옮겨주는 함수]
        function setsubmit(form) {
            
           //각 항목을 asp로 안한 이유는? id값들마다 cs코드에서 불러와야 되는데 너무 복잡하고, 같은 발주서끼리 항목을 묶기 위해서 cs코드로 넘겨주기 위해
           // asp박스는 그냥 넘겨주기 위한 수단일 뿐 우리는 그냥 input박스로 행의 데이터들을 묶어서 처리하고 asp박스로 넘겨줌  

           //asp에 넣을 값을 저장하는 변수
            var input_codes = "";  
            var input_items = "";
            var input_uniprices ="";
            var input_prices =""; 
            var input_vats ="";
            var input_amount =""; 

            // select의 value가 코드로 되어있고 보이는것만 item값이라서 딕셔너리 구조로 매칭되는 값들을 변경시켜서 저장하기 위해서 가지고 옴
            var dic={'':"전체",'www1234':"점보지우개" , 'A0127':"산토리니 배경액자" , '0001A5':"깨끗한 나라 물티슈", '0085A11':"이카운트 노트북", '0001A2':"편한 슬리퍼", '103':"잘붙어 딱풀"}
            
            for (i=0; i < document.getElementsByClassName('code').length ; i++) {


                                                                 
                //and 연산을 쓴이유는 db들어갈 때 3,5,2, 이렇게 마지막까지 콤마가 찍히므로 마지막 ,콤마를 없애주는 역할 
                if (document.getElementsByClassName('item')[i].value != "") { //item값이 비어있지않으면 밑에 if문 실행 =>
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_codes = input_codes + ',';} // 이 부분은 다른 행의 값들을 구분하기 위해서 콤마를 찍어주는 부분 ex) ['산토리니 배경액자깨끗한 나라 물티슈'] 원래 이렇게 저장됨 =>['산토리니 배경액자,깨끗한 나라 물티슈' ...]
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_items = input_items + ',';}
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_uniprices = input_uniprices + ',';}
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_prices = input_prices + ',';}
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_vats = input_vats + ',';}
                if (i >= 1 && document.getElementsByClassName('amount')[i].value != "") {input_amount = input_amount + ',';}
                }                                         
                
                if (document.getElementsByClassName('item')[i].value != "") {
                input_codes = input_codes + document.getElementsByClassName('code')[i].value; // 이 부분은 눈에 보이는 행의 값들
                input_items = input_items + dic[document.getElementsByClassName('item')[i].value]; // 이부분에서 딕셔너리 구조를 사용함
                input_uniprices = input_uniprices + document.getElementsByClassName('uniprice')[i].value.replaceAll(",", ""); //replaceAll은 앞에있는 문자나 숫자를 뒤에 있는 문자나 숫자로 바꿀 수 있음
                input_vats = input_vats + document.getElementsByClassName('vat')[i].value.replaceAll(",", ""); // 세번째 자리마다 콤마를 찍어주는데 우리도 다른 행의 데이터마다 컴마를 찍어주기 때문에 헷갈려서 삭제해주는 리플레이스올을 추가
                input_prices = input_prices + document.getElementsByClassName('price')[i].value.replaceAll(",", ""); 
                input_amount = input_amount + document.getElementsByClassName('amount')[i].value.replaceAll(",", "");
                }

            }

            // 클래스로 값을 불러오는 부분
            document.getElementsByClassName('submit_codes')[0].value = input_codes;
            document.getElementsByClassName('submit_items')[0].value = input_items;
            document.getElementsByClassName('submit_uniprices')[0].value = input_uniprices;
            document.getElementsByClassName('submit_prices')[0].value = input_prices;
            document.getElementsByClassName('submit_vats')[0].value = input_vats;
            document.getElementsByClassName('submit_amounts')[0].value = input_amount;
 
            
        }

        // 6. [엔터를 쳤을 때 행이 추가되는 함수]
        function addRow(form) //엔터를 쳤을 때 행이 추가되는 함수
        {
            var last_line = document.getElementsByClassName('price').length-1 //마지막 행이 입력이 안되었을 경우, 행추가를 안시켜주기 위해서 마지막 행의 값을 확인하고, 비어있지 않으면
            if (document.getElementsByClassName('price')[last_line].value != "") //price가 비어있지 않으면 다음 행 생성, 'price'를 'vat'로 해도 상관없음!! 
            {
                var table = document.getElementsByClassName('center-content')[0]; // 테이블 불러오기
                var rowlen = table.rows.length; // 몇번째 행이 추가될지 행 줄의 개수 알기
            	var row = table.insertRow(rowlen); // 추가될 행의 번째 수 입력
           
            row.setAttribute("align","center"); 
            row.setAttribute("height","30"); 
             // 행추가시 첫번째 행과 동일하게 불러오는 것

            // 기존에 사용하였던 인풋 박스들을 똑같이 추가해주는 부분
            
            row.insertCell(0).innerHTML = '<input  class="code w100 border-none font15" value =""></input>';
            row.insertCell(1).innerHTML = '<select  onChange=bringValue(this),calPrice(this),totalprice(this),setsubmit(this) class="item w500 font15"> <option value="">전체</option> <option value="www1234">점보지우개</option><option value="A0127">산토리니 배경액자[400+400]</option><option value="0001A5">깨끗한 나라 물티슈[100매]</option><option value="0085A11">이카운트 노트북</option><option value="0001A2">편한 슬리퍼[260]</option><option value="103">잘붙어 딱풀</option></select>' ;
            row.insertCell(2).innerHTML = '<input  class="amount w50 text-center font15" onChange=calPrice(this),totalprice(this),pricenum(this),change(this),setsubmit(this) onKeypress="javascript:if(event.keyCode==13) {addRow(calPrice(this),totalprice(this),pricenum(this),change(this)); event.preventDefault();}"  value=""> </input>';
            row.insertCell(3).innerHTML = '<input  class="uniprice w100 text-right border-none font15" value =""></input>';
            row.insertCell(4).innerHTML = '<input  class="price w200 text-right border-none font15" onChange=totalprice(this) value=""></input>';
            row.insertCell(5).innerHTML = '<input  class="vat w150 text-right border-none font15" onChange=totalprice(this), setsubmit(this) value="" ></input>';
            }  
            
            
        }
		// 7. [빈 행이 추가되는 함수]
		    function addRows(form) //빈 행이 추가되는 함수
            {
				
                var asp_item = document.getElementsByClassName('lblitem')[0].innerHTML; // ["w123,a0123"] , 아이템(필수는 아님 다 됨)은 선택이 되므로 기준을 준것
                const split_item = asp_item.split(','); // ["w123","a0123"].legnth =2 의미하는것은 만들어줘야 되는 행의 개수

                for(i=0 ; i < split_item.length ; i++){ // 0부터 1까지 2번반복
                    var table = document.getElementsByClassName('center-content')[0];
                    var rowlen = table.rows.length;
                    var row = table.insertRow(rowlen); 
                    row.setAttribute("align","center"); 
                    row.setAttribute("height","30");

                    row.insertCell(0).innerHTML = '<input  class="code w100 border-none font15" ></input>'; //함수에서 input박스를 선언하여 body에서 onload를 이용하여 생성  
                    row.insertCell(1).innerHTML = '<select class="item w500 font15" onChange=bringValue(this),calPrice(this),totalprice(this),setsubmit(this) ><option value="">전체</option><option value="www1234">점보지우개</option><option value="A0127">산토리니 배경액자[400+400]</option><option value="0001A5">깨끗한 나라 물티슈[100매]</option><option value="0085A11">이카운트 노트북</option><option value="0001A2">편한 슬리퍼[260]</option><option value="103">잘붙어 딱풀</option></select> 	';
                    row.insertCell(2).innerHTML = '<input class="amount w50 text-center font15" onchange="calPrice(this),totalprice(this),pricenum(this),change(this),setsubmit(this)" onKeypress="javascript:if(event.keyCode==13) {addRow(calPrice(this),totalprice(this),pricenum(this),change(this)); event.preventDefault();}"></input>';
                    row.insertCell(3).innerHTML = '<input  class="uniprice w100 text-right border-none font15"></input>';
                    row.insertCell(4).innerHTML = '<input class="price w200 text-right border-none font15" onChange="totalprice(this)"></input>';
                    row.insertCell(5).innerHTML = '<input class="vat w150 text-right border-none font15" onChange="totalprice(this), setsubmit(this)"></input>';
                    
                }
              
            }  

        //8. [빈 행에 값을 넘는 함수]
            function putData(form){ //빈행에 값을 넣는 함수
	
				var dic=['','www1234' , 'A0127', '0001A5', '0085A11', '0001A2','103']

                var asp_item = document.getElementsByClassName('lblitem')[0].innerHTML; //["w123,a0123"] db에 연동된 값들을 보이지 않는 에이에스피 박스에서 불러온다 
                var asp_amount = document.getElementsByClassName('lblamount')[0].innerHTML;
                var asp_vat = document.getElementsByClassName('lblvat')[0].innerHTML;
                var asp_code = document.getElementsByClassName('lblcode')[0].innerHTML;
                var asp_price = document.getElementsByClassName('lblprice')[0].innerHTML;
                var asp_uniprice = document.getElementsByClassName('lbluniprice')[0].innerHTML;

                const split_item = asp_item.split(','); // ["w123","a0123"] //split함수를 통해 ['물티슈,지우개,노트북'](길이1) 을 ['물티슈','지우개','노트북'](길이3) 변경함 각 값들은 한 행의 값
                const split_amount = asp_amount.split(',');
                const split_vat = asp_vat.split(',');
                const split_code = asp_code.split(','); 
                const split_price = asp_price.split(',');
                const split_uniprice = asp_uniprice.split(',');
                var total_amount = 0; // amount는 제대로 불러와져서 amount 값 다 더해서

                //selectbox.value != options.value => option이 선택되어지게 하려면 selectbox.selectedIndex = 값(몇번쨰 옵션이 선택될 것인지에 대한 인덱스 숫자)을 사용하여야 함
                //그래서 리스트의 아이템 코드들과 디비에서 분할된 아이템 코드 값 하나를 포문을 돌면서 비교하고, 일치하는 코드값이 있는 리스트의 인덱스 정보를 s_index로 저장하여 selectedIndex에 저장한다.
                for(i=0 ; i < split_item.length ; i++){ //0번째 행의 아이템,코드,개수,단가 등의 값을 0번째 행으로 입력 그 후 1번째 행의 아이템코드.....값을 1번째 행으로 입력 

                    document.getElementsByClassName('code')[i].value = split_code[i]; // split_item[0] = 'a0127'

					for (k = 0 ; k < dic.length ; k++){ //dic값과 split_code의 값을 비교하여 일치할 때 s_index에 k값 부여 
						if (dic[k] == split_code[i]){
							var s_index = k}; // split_code이 해당되는 index 정보의 추출과정
					}
					document.getElementsByClassName('item')[i].selectedIndex = s_index // [i] 번째 셀렉트 박스의 몇번쨰 옵션을 선택하시겠습니까? = s_index 
					
                    document.getElementsByClassName('amount')[i].value = split_amount[i]; 
                    document.getElementsByClassName('price')[i].value = comma(split_price[i]);
                    document.getElementsByClassName('uniprice')[i].value = comma(split_uniprice[i]);
                    document.getElementsByClassName('vat')[i].value = comma(split_vat[i]);
                    total_amount += Number(split_amount[i]) // 다 더해주는 부분

                
                }
		
                document.getElementsByClassName('total_amount')[0].innerHTML = total_amount // 여기 토탈 어마운트에 넣어줌
        
            } 

            function comma(num){
            var len, point, str;

            num = num + "";
                point = num.length % 3;
                len = num.length;

                str = num.substring(0, point);
                while (point < len) {
                    if (str != "") str += ",";
                    str += num.substring(point, point + 3);
                    point += 3;
                }
                return str;
            }
		
        
         // 9. ['금액'부분에 총금액 가져오는 함수]
         function pricenum(form)
         {  
            var price_num = document.getElementsByClassName('total_price')[0].value;
            document.getElementsByClassName('price_num')[0].value = price_num;
           
         }


         function viewKorean(num) 
        {   
            var hanA = new Array("","일","이","삼","사","오","육","칠","팔","구","십"); 
            var danA = new Array("","십","백","천","","십","백","천","","십","백","천","","십","백","천"); 
            var result = ""; 
                for(i=0; i<num.length; i++) { 
                    str = ""; 
                    han = hanA[num.charAt(num.length-(i+1))]; 
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
        
        function change(form)
        {   
            var price_kor = document.getElementsByClassName('total_price')[0].value.replaceAll(",", "");
            var p_k = viewKorean(price_kor); 
            document.getElementsByClassName('price_kor')[0].value = p_k;

        }

        
    </script>
</head>

<body onload="addRows(this),putData(this);">
    
    <!-- 수신처, 발신처-->
    <div class="top">
        <div class="top-left">
            <table class = "top-content1">
                <tr><td class="w150 text-center">일련번호</td><td class="w340"><asp:TextBox ID="txtserial_num" class="serial_num border-none font15" runat="server"></asp:TextBox></td></tr>
                <tr><td class="w150 text-center">수신</td><td class="w340">(주)튼튼한기업</td></tr>
                <tr><td class="w150 text-center">참조</td><td class="w340"></td></tr>
                <tr><td class="w150 text-center">TEL</td><td class="w340"></td></tr>
                <tr><td class="w150 text-center">FAX</td><td class="w340"></td></tr>
                <tr><td colspan="2" class="text-center">납기일자: <br> <asp:TextBox class="w490 text-center border-none deadline font15" ID="txtdue_date" runat="server"></asp:TextBox></td></tr>
            </table>
        </div>
        <div class = "top-right">
            <table class = "top-content2">
                <tr><td colspan="2" class="text-center h40"><asp:Label ID="lblFileName" runat="server" ></asp:Label><asp:FileUpload ID="FileUpload1" runat="server" /></asp:FileUpload></td></tr></td></tr>
                <tr><td class="w150 text-center">사업자등록번호</td><td class="w490"><asp:TextBox ID="txtc_num" class="c_num w340 border-none font15" runat="server"></asp:TextBox></td></tr>
                <tr><td class="w150 text-center">회사명/대표</td><td class="w490"><asp:TextBox ID="txtc_name" class="c_name w200 border-none font15" runat="server"></asp:TextBox>/<asp:TextBox ID="txtc_leader" class="c_leader w150 border-none font15" runat="server"></asp:TextBox></td></tr>
                <tr><td class="w150 text-center">주소</td><td class="w490"><asp:TextBox ID="txtc_address" class="c_address border-none w490 font15" runat="server"></asp:TextBox></td></tr>
                <tr><td class="w150 text-center">담당/연락처</td><td class="w490"><asp:TextBox ID="txtc_charge" class="c_charge border-none w100 font15" runat="server"></asp:TextBox>/<asp:TextBox ID="txtc_phonenum" class="c_phonenum w50 border-none w200 font15" runat="server"></asp:TextBox></td></tr>
            </table>
        </div>
    </div>
	
    <br>
    <!-- 금액-->

	<div class="money back">
        <div class="money-left">금액 : <asp:TextBox ID="txtprice_kor" runat="server" class="text-right border-none font25 price_kor w490 back font-b" value =""></asp:TextBox></div>
        <div class="money-right">(<asp:TextBox ID="txtprice_num" runat="server" class="text-right border-none font25 price_num back font-b" value =""></asp:TextBox>원) / VAT포함</div>
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
		  <!--보이지 않는 asp박스-->
		 
                <!--품목코드-->

                <asp:Label  id="lblcode" class="lblcode w130 border-none hidden_form" runat="server" value =""></asp:Label>
                <!--품목명-->
                
                <asp:Label id="lblitem" class="lblitem w500 border-none hidden_form" runat="server"></asp:Label>
                
                <!--수량-->
               <asp:Label id="lblamount" class="lblamount w50 text-center border-none hidden_form" runat="server" value="" ></asp:Label><!--엔터쳤을 때 다음행으로 가게하는 명령어-->
                <!--단가-->
                <asp:Label  id="lbluniprice" class="lbluniprice w80 text-right border-none hidden_form"  runat="server" value =""></asp:Label>
                <!--공급가액-->
                <asp:Label id="lblprice" class="lblprice w90 text-right border-none hidden_form" runat="server" value=""></asp:Label>
                <!--부가세-->
                <asp:Label id="lblvat" class="lblvat w90 text-right border-none hidden_form" runat="server" value="" ></asp:Label>
        	
           
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
                <td class="w100 text-center back">수량</td> <td class="w150"><asp:TextBox ID="txtt_amount" runat="server" Width="80%" class="total_amount text-right font15 border-none" value =""></asp:TextBox></td>
                <td class="w100 text-center back">공급가액</td> <td class="w150"><asp:TextBox ID="txtt_uniprice" runat="server" Width="80%" class="total_uniprice text-right font15 border-none " value =""></asp:TextBox></td>
                <td class="w100 text-center back">VAT</td><td class="w150"><asp:TextBox ID="txtt_vat" runat="server" Width="80%" class="total_vat text-right font15 border-none" value =""></asp:TextBox></td>
                <td class="w100 text-center back">합계</td><td class="w150"><asp:TextBox ID="txtt_price" runat="server" Width="80%" class="total_price text-right font15 border-none" value =""></asp:TextBox></td>
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

    
    <table width="1150px" border="0">
		<tr><td><HR SIZE=1></td></tr>
                <tr><td align="right">
                        <asp:ImageButton ID="btnSubmit" runat="server" ImageUrl="~/Images/ok_bt.gif" OnClick="btnSubmit_Click" />
                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Images/cancel_bt.gif"
                            OnClick="btnCancel_Click" />
        </td></tr>
    </table>

</body>
</html>
