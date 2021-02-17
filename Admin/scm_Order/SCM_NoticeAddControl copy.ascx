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
        }
        .money{
            width: 1143px;
            height: 40px;
            border: 3px solid black;
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
        }
        .money-right{
            width: 500px;
            height: 40px;
            display: table-coll;
            text-align: center;
            font-size: 25px;
            line-height: 50px;
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

        .text-left {text-align: left;}
        .text-center {text-align: center;}
        .text-right {text-align: right;}

        .back {background-color: #dcdcdc}
        .border-none {border: none;}

        .font15 {font-size: 15px;}
        .font25 {font-size: 25px;}
        
    </style>

    <script type= "text/javaScript">

        // [숫자에 세자리마다 콤마 붙이는 함수]
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

         //['품목명' 선택하면 '품목코드'와 '단가' 자동입력 되는 부분]

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

       //['공급가액', '부가세' 계산하는 부분]
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

        //[맨 밑부분 각 항목 총계산되는 부분]
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
      
        function addRow(form) 
        {
            var last_line = document.getElementsByClassName('price').length-1 //0부터 숫자를 세고 1부터 길이를 세기 때문에 -1을 해줘야함
            if (document.getElementsByClassName('price')[last_line].value != "") //price가 비어있지 않으면 다음 행 생성, 'price'를 'vat'로 해도 상관없음!! 
            {
                var table = document.getElementsByClassName('center-content')[0];
                var rowlen = table.rows.length;
            var row = table.insertRow(rowlen); 
           
            row.setAttribute("align","center"); 
            row.setAttribute("height","30"); 
             // 행추가시 첫번째 행과 동일하게 불러오는 것
            row.insertCell(0).innerHTML = '<input  class="code w130 border-none" value =""></input>';
            row.insertCell(1).innerHTML = '<select  onChange=bringValue(this),calPrice(this),totalprice(this) class="item w500"> <option value="">전체</option> <option value="www1234">점보지우개</option><option value="A0127">산토리니 배경액자[400+400]</option><option value="0001A5">깨끗한 나라 물티슈[100매]</option><option value="0085A11">이카운트 노트북</option><option value="0001A2">편한 슬리퍼[260]</option><option value="103">잘붙어 딱풀</option></select>' ;
            row.insertCell(2).innerHTML = '<input class="amount w50 text-center " value="" onChange=calPrice(this),totalprice(this),pricenum(this),change(this) onKeypress="javascript:if(event.keyCode==13) {addRow(calPrice(this),totalprice(this),pricenum(this),change(this)); event.preventDefault();}"</input></td>';
            row.insertCell(3).innerHTML = '<input  class="uniprice w80 text-right border-none" value =""></input></td>';
            row.insertCell(4).innerHTML = '<input class="price w90 text-right border-none"onChange=totalprice(this) value=""></input>';
            row.insertCell(5).innerHTML = '<input class="vat w90 text-right border-none" onChange=totalprice(this) value="" ></input>';
            }  
        }
        
         // ['금액'부분에 총금액 가져오는 함수]
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

<body >
    <!-- 수신처, 발신처-->
    <div class="top">
        <div class="top-left">
            <table class = "top-content1">
                <tr><td class="w150 text-center">일련번호</td><td class="w340"><asp:TextBox ID="txtserial_num" runat="server" Width="80%"></asp:TextBox></td></tr>
                <tr><td class="w150 text-center">수신</td><td class="w340">(주)튼튼한기업</td></tr>
                <tr><td class="w150 text-center">참조</td><td class="w340"></td></tr>
                <tr><td class="w150 text-center">TEL</td><td class="w340"></td></tr>
                <tr><td class="w150 text-center">FAX</td><td class="w340"></td></tr>
                <tr><td colspan="2" class="text-center"><asp:TextBox ID="txtdue_date" runat="server" Width="80%"></asp:TextBox></td></tr>
            </table>
        </div>
        <div class = "top-right">
            <table class = "top-content2">
                <tr><td colspan="2" class="text-center"><asp:FileUpload ID="FileUpload1" runat="server" /></asp:FileUpload></td></tr>
                <tr><td class="w150 text-center">사업자등록번호</td><td class="w490"><asp:TextBox ID="txtc_num" runat="server" Width="80%"></asp:TextBox></td></tr>
                <tr><td class="w150 text-center">회사명/대표</td><td class="w490"><asp:TextBox ID="txtc_name" runat="server" Width="80%"></asp:TextBox>/<asp:TextBox ID="txtc_leader" runat="server" Width="80%"></asp:TextBox></td></tr>
                <tr><td class="w150 text-center">주소</td><td class="w490"><asp:TextBox ID="txtc_address" runat="server" Width="80%"></asp:TextBox></td></tr>
                <tr><td class="w150 text-center">담당/연락처</td><td class="w490"><asp:TextBox ID="txtc_charge" runat="server" Width="80%"></asp:TextBox>/<asp:TextBox ID="txtc_phonenum" runat="server" Width="80%"></asp:TextBox></td></tr>
            </table>
        </div>
    </div>

    <!-- 금액-->

	<div class="money">
        <div class="money-left">금액 : <asp:TextBox ID="txtprice_kor" runat="server" Width="80%" class="text-right border-none font25 price_kor w400 " value =""></asp:TextBox></div>
        <div class="money-right">(<asp:TextBox ID="txtprice_num" runat="server" Width="80%" class="text-right border-none font25 price_num " value =""></asp:TextBox>원) / VAT포함</div>
    </div>
	
		


    <br>

    <!--내용테이블-->
    <div class="center">
        <table class="center-content">
            <tr class="text-center">
                <td class="w150 h30">품목코드</td>
                <td class="w600 h30">품목명[규격]</td>
                <td class="w80 h30">수량</td>
                <td class="w100 h30">단가</td>
                <td class="w100 h30">공급가액</td>
                <td class="w100 h30">부가세</td>
            </tr>
          <tr>
                <!--품목코드-->
                <td class="w150 h30 text-center"><asp:TextBox ID="txtcode" runat="server" Width="80%" class="code w130 border-none" value =""></asp:TextBox></td>
                <!--품목명-->
                <td  class="w600 h30 text-center">
					<asp:DropDownList ID="txtitem" runat="server" class = "item w500 " onchange=bringValue(this),calPrice(this),totalprice(this)>
                        <asp:ListItem Value="">전체</asp:ListItem>
                        <asp:ListItem Value="www1234">점보지우개</asp:ListItem>
                        <asp:ListItem Value="A0127">산토리니 배경액자[400+400]</asp:ListItem>
                        <asp:ListItem Value="0001A5">깨끗한 나라 물티슈[100매]</asp:ListItem>
                        <asp:ListItem Value="0085A11">이카운트 노트북</asp:ListItem>
                        <asp:ListItem Value="0001A2">편한 슬리퍼[260]</asp:ListItem>
                        <asp:ListItem Value="103">잘붙어 딱풀</asp:ListItem>
                   	</asp:DropDownList> 	
                </td>
                <!--수량--><!--엔터쳤을 때 다음행으로 가게하는 명령어-->
                <td class="w80 h30 text-center"><asp:TextBox ID="txtamount" runat="server" Width="80%" class="amount w50 text-center" onchange=calPrice(this),totalprice(this),pricenum(this),change(this) onKeypress="javascript:if(event.keyCode==13) {addRow(calPrice(this),totalprice(this),pricenum(this),change(this)); event.preventDefault();}" value =""></asp:TextBox></td>
                <!--단가-->
				<td class="w100 h30 text-center"><asp:TextBox ID="txtuniprice" runat="server" Width="80%" class="uniprice w80 text-right border-none" value =""></asp:TextBox></td>
                <!--공급가액-->
				<td class="w100  h30 text-center"><asp:TextBox ID="txtprice" runat="server" Width="80%" class="price w90 text-right border-none" value =""></asp:TextBox></td>
                <!--부가세-->
				<td class="w100  h30 text-center"><asp:TextBox ID="txtvat" runat="server" Width="80%" class="vat w90 text-right border-none" value =""></asp:TextBox></td>
            </tr>

            
        </table>
    </div>

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
    <div class="bottom">
        <input type="button" value="인쇄" >
        <input type="button" value="Excel">
        <input type="button" value="Email">
        <input type="button" value="닫기">
    </div>

	<!-- OnClick="btnSubmit_Click" -->
<table width="100%" border="0">
		<tr><td><HR SIZE=1></td></tr>
                <tr><td align="right">
                        <asp:ImageButton ID="btnSubmit" runat="server" ImageUrl="~/Images/ok_bt.gif" OnClick="btnSubmit_Click" />
                        <asp:ImageButton ID="btnCancel" runat="server" ImageUrl="~/Images/cancel_bt.gif"
                            OnClick="btnCancel_Click" />
                </td></tr>
            </table>
</body>
</html>