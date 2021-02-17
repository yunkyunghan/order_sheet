<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SCM_NoticeViewControl.ascx.cs" Inherits="Admin_SCM_NoticeViewControl" %>

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

    <script>

        // 1. [빈 행이 추가되는 함수]
        function addRow(form) //빈 행이 추가되는 함수
            {   

                var asp_item = document.getElementsByClassName('lblitem')[0].innerHTML; // ["물티슈, 지우개, 노트북"] , 아이템(필수는 아님 다 됨)은 선택이 되므로 기준을 준것
                const split_item = asp_item.split(','); // 콤마를 기준으로 쪼개줌
                                                       
                for(i=0 ; i < split_item.length ; i++){ // 콤마를 기준으로 몇개의 데이터가 쪼개졌는지 길이를 알면 몇줄을 생성해야되는지 알 수 있음 
                    var table = document.getElementsByClassName('center-content')[0]; // 행들이 추가될 테이블을 가져옴 
                    var rowlen = table.rows.length; // 테이블의 행의 개수를 잰 후 // 길이가 2이면 0,1 까지 행이 있다는 의미이므로 0,1,[2] 번쨰 행을 만들 준비를 하는 것
                  
                    var row = table.insertRow(rowlen); // [2]번째 행을 만듬

                    row.setAttribute("align","center"); 
                    row.setAttribute("height","30");

                    row.insertCell(0).innerHTML = '<input  class="code w100 border-none font15" ></input>';  //만들어진 행에 빈 input 값을 넣어줌
                    row.insertCell(1).innerHTML = '<input class="item w500 border-none font15"></input>';
                    row.insertCell(2).innerHTML = '<input class="amount w50 text-center border-none font15"></input>';
                    row.insertCell(3).innerHTML = '<input  class="uniprice w100 text-right border-none font15"></input>';
                    row.insertCell(4).innerHTML = '<input class="price w200 text-right border-none font15" ></input>';
                    row.insertCell(5).innerHTML = '<input class="vat w100 text-right border-none font15"></input>';
                    
                }
              
            }  
        
        // 2. [빈행에 값을 넣는 함수]
        function putData(form){ //빈행에 값을 넣는 함수

            var dic6 = {'ETRI':"../../fileUpload/Order/ETRi.png" ,'gs편의점':"../../fileUpload/Order/gs.png", 'IBK기업은행':"../../fileUpload/Order/ibk.png", 'SKT':"../../fileUpload/Order/skt.png", '삼성생명':"../../fileUpload/Order/samsung.png", '세브란스병원':"../../fileUpload/Order/severance.png"}
            document.getElementsByClassName('img')[0].src = dic6[document.getElementsByClassName('c_name')[0].innerHTML];
            
            var asp_item = document.getElementsByClassName('lblitem')[0].innerHTML; //db와 연동이 되는 asp 라벨에서 값을 가지고 온다. 형태는 : ["물티슈,지우개,노트북'] db에 연동된 값들을 보이지 않는 에이에스피 박스에서 불러온다 
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

            for(i=0 ; i < split_item.length ; i++){ //쪼갠 split i번째 값들을 i번째 행의 값들에게 넣어줌

                document.getElementsByClassName('code')[i].value = split_code[i]; // split_item[0] = "w123"
                document.getElementsByClassName('item')[i].value = split_item[i]; // 0번째 행의 값들을 0번째에 같이 넣기 위해서 [i]을 같이 사용 
                document.getElementsByClassName('amount')[i].value = split_amount[i]; 
                document.getElementsByClassName('price')[i].value = comma(split_price[i]);
                document.getElementsByClassName('uniprice')[i].value = comma(split_uniprice[i]);
                document.getElementsByClassName('vat')[i].value = comma(split_vat[i]);
                total_amount += Number(split_amount[i]) // 다 더해주는 부분

            
            }
            document.getElementsByClassName('total_amount')[0].innerHTML = total_amount // 여기 토탈 어마운트에 넣어줌
        
         } 

         // 3. [숫자에 세자리마다 콤마 찍는 함수]
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

        // 4. [프린트 버튼 기능 활성화] 
         function printIt(printThis) {
            const setting = "width=890, height=841";


            var win = null;
            win = window.open();
            self.focus();
            win.document.open();
            win.document.write(printThis);
            win.document.close();
            win.print();
            win.close();
        }

</script>

   
</head>


<body id="printme" onload="addRow(this),putData(this);">

    <asp:Label ID="lblNoticeError" runat="server" ForeColor="Red"></asp:Label>
    <!-- 수신처, 발신처-->
    <div class="top">
        <div class="top-left">
            <table class = "top-content1">
                <tr><td class="w150 text-center">일련번호</td><td class="w340"><asp:Label id="lblserial_num" runat="server"></asp:Label></td></tr>
                <tr><td class="w150 text-center">수신</td><td class="w340">(주)튼튼한기업</td></tr>
                <tr><td class="w150 text-center">참조</td><td class="w340"></td></tr>
                <tr><td class="w150 text-center">TEL</td><td class="w340"></td></tr>
                <tr><td class="w150 text-center">FAX</td><td class="w340"></td></tr>
                <tr><td colspan="2" class="text-center">납기일자 : <br> <asp:Label id="lbldue_date" runat="server" ></asp:Label></td></tr>
            </table>
        </div>
        <div class = "top-right"> 
            <table class = "top-content2"> 
                <tr><td colspan="2" class="text-center h40"><img class="img" src ="" height="40px"><asp:Label ID="lblFileName" runat="server"></asp:Label><asp:Button  ID="btnFile" class="hidden_form" runat="server" onclick="btnFile_Click" Text="download" /></td></tr>
                <tr><td class="w150 text-center">사업자등록번호</td><td class="w490"><asp:Label  id="lblc_num" class="text-center w340" runat="server" value =""></asp:Label></td></tr>
                <tr><td class="w150 text-center">회사명/대표</td><td class="w490"><asp:Label id="lblc_name" class="c_name text-center w200" runat="server" value =""></asp:Label> / <asp:Label  id="lblc_leader" class="text-center w150" runat="server" value =""></asp:Label></td></tr>
                <tr><td class="w150 text-center">주소</td><td class="w490"><asp:Label  id="lblc_address" class="text-center w480" runat="server" value =""></asp:Label></td></tr>
                <tr><td class="w150 text-center">담당/연락처</td><td class="w490"><asp:Label  id="lblc_charge" class="text-center w150" runat="server" value =""></asp:Label> / <asp:Label  id="lblc_phonenum" class="text-center w200" runat="server" value =""></asp:Label></td></tr>
            </table>
        </div>
    </div>

    <br>

    <!-- 금액-->
    <div class="money back">
        <div class="money-left">금액 : <asp:Label  id="lblprice_kor" class="text-right border-none font25 w490 back" runat="server" value =""></asp:Label></div>
        <div class="money-right">(<asp:Label id="lblprice_num" class="text-right border-none font25 back font-b" runat="server" value =""></asp:Label>원) / VAT포함</div>
    </div>

    <br>

    <!--내용테이블-->
    <div class="center">
        <table class="center-content">
                <!--보이지 않는 asp박스-->
        
                <!--품목코드-->
                <asp:Label  id="lblcode" class="lblcode hidden_form w130 border-none font15" runat="server" value =""></asp:Label>
                <!--품목명-->
                
                <asp:Label id="lblitem" class="lblitem hidden_form w500 font15" runat="server"></asp:Label>
                
                <!--수량-->
                <asp:Label id="lblamount" class="lblamount hidden_form w50 text-center font15" runat="server" value="" ></asp:Label>
                <!--단가-->
                <asp:Label  id="lbluniprice" class="lbluniprice hidden_form w80 text-right border-none font15"  runat="server" value =""></asp:Label>
                <!--공급가액-->
                <asp:Label id="lblprice" class="lblprice hidden_form w90 text-right border-none font15" runat="server" value=""></asp:Label>
                <!--부가세-->
                <asp:Label id="lblvat" class="lblvat hidden_form w90 text-right border-none font15" runat="server" value="" ></asp:Label>
            
            <tr class="text-center">
                <td class="w100 h30">품목코드</td>
                <td class="w500 h30">품목명[규격]</td>
                <td class="w80 h30">수량</td>
                <td class="w100 h30">단가</td>
                <td class="w200 h30">공급가액</td>
                <td class="w150 h30">부가세</td>
            </tr>
          
        </table>
    </div>

    <br>

    <!--정리 테이블-->
    <div class="sum">
        <table class="sum-table">
            <tr>
                <td class="w100 text-center back">수량</td> <td class="w150 text-center"><asp:Label id="lblt_amount" class="total_amount text-right font15 border-none" runat="server" value=""></asp:Label></td>
                <td class="w100 text-center back">공급가액</td> <td class="w150 text-right"><asp:Label id="lblt_uniprice" class="total_uniprice text-right font15 border-none " runat="server" value=""></asp:Label></td>
                <td class="w100 text-center back">VAT</td><td class="w150 text-right"><asp:Label id="lblt_vat" class="total_vat text-right font15 border-none" runat="server" value=""></asp:Label></td>
                <td class="w100 text-center back">합계</td><td class="w150 text-right"><asp:Label id="lblt_price" class="total_price text-right font15 border-none" runat="server" value=""></asp:Label></td>
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
       <input type="button" value="인쇄" onclick="javascript:printIt(document.getElementById('printme').innerHTML)" />
        <input type="button" value="Excel">
        <input type="button" value="Email">
        <input type="button" value="닫기">
    </div>

    <br>
    


    <table width="1150px" border="0" cellpadding="0" cellspacing="0" bgcolor="#5D7B9D" height=30>
        <tr><td width="80px" align=center><font color="#ffffff"><b>작성자</b></td>
            <td width="5px"></td>
            <td width="160px" align=left><font color="#ffffff">관리자</td>
            <td width="80px"><font color="#ffffff"><b>작성일</b></td>
            <td width="5px"></td>
            <td width="150px" align=left><font color="#ffffff"> 
                <asp:Label ID="lblPostDate" runat="server"></asp:Label></td>
            <td width="80px"><font color="#ffffff"><b>조회수</b></td>
            <td width="5px"> </td>
            <td width="100px" align=left><font color="#ffffff">
                <asp:Label ID="lblReadCount" runat="server"></asp:Label>
            </td>  </tr>
    </table>     

<table width="1150px" border="0">
		<tr><td><HR SIZE=1></td></tr>
                <tr><td align="right">
                        <asp:ImageButton ID="btnList" runat="server" ImageUrl="~/Images/list_bt.gif" OnClick="btnList_Click" />
                        <asp:ImageButton ID="btnmodify" runat="server" ImageUrl="~/Images/re_bt.gif" OnClick="btnmodify_Click" />
                        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/delete_bt.gif" 
                                        OnClick="btnDelete_Click" style="height: 24px" />
                </td></tr>
            </table>
   

</body>
</html>
