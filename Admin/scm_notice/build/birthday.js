function getAge() {
       // 입력값 얻어오기
       var birthday = document.getElementById('birthday' ).value.split(".");
      
       // 날짜 오브젝트 작성
       var d1 = new Date(birthday[0],birthday[1]-1,birthday[2]);
       //월은 0부터 시작하므로
       // 1970년 1월 1일부터 birthday로 지정한 시간까지의 경과 시간을 ms단위로 계산
       var d2 = new Date();
       // 1970년 1월 1일부터 지금까지의 시간을 ms 단위로 계산
      
       // 일수, 연령 계산
       var diff = d2.getTime() - d1.getTime();
       var daysPast = Math.floor(diff / (1000 * 60 * 60 * 24));
       var age = Math.floor(daysPast / 365.25);
      
       //결과 표시
      document.getElementById( "daysPast").innerHTML = daysPast;
      document.getElementById( "age").innerHTML = age;
}