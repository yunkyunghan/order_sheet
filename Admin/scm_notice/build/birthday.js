function getAge() {
       // �Է°� ������
       var birthday = document.getElementById('birthday' ).value.split(".");
      
       // ��¥ ������Ʈ �ۼ�
       var d1 = new Date(birthday[0],birthday[1]-1,birthday[2]);
       //���� 0���� �����ϹǷ�
       // 1970�� 1�� 1�Ϻ��� birthday�� ������ �ð������� ��� �ð��� ms������ ���
       var d2 = new Date();
       // 1970�� 1�� 1�Ϻ��� ���ݱ����� �ð��� ms ������ ���
      
       // �ϼ�, ���� ���
       var diff = d2.getTime() - d1.getTime();
       var daysPast = Math.floor(diff / (1000 * 60 * 60 * 24));
       var age = Math.floor(daysPast / 365.25);
      
       //��� ǥ��
      document.getElementById( "daysPast").innerHTML = daysPast;
      document.getElementById( "age").innerHTML = age;
}