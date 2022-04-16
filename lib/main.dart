import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//void는 '아무 것도 하지 말아주세요' 인데 알 필요 없음
//void main() {} 아래 다 지우고 새로 작성
void main() {
  runApp( MyApp());
  //일단 const는 지워두자
  //  앱 동작 시켜주세요 뜻임
  //  runApp 소괄호 안에 우리가 만든 앱 레이아웃을 넣을 것
}

// MyApp은 메인페이지 만드는 부분
// stless 쓰고 tab하니까 아래 class 생성됨
// 앱 메인페이지 세팅을 위한 기본 문법, 나중에 이해 가능
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  //일단 const는 지워두자
  var a = 0;

  @override
  Widget build(BuildContext context) {
    // return Container();
    // flutter는 <div>나 <span>이 아닌 widget으로 코드 작성함
    // 아래 코드처럼 Text('안녕')같이 넣어서 위젯 작성
    // 코드 복사는 Ctrl + D
    // return Container(
    return MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Text(a.toString()),
            //버튼을 누르면 숫자가 올라가도록 코드 작성
            onPressed: (){
            //  버튼 누를 때마다 실행해 줄 코드 입력
              a++;
            //  a를 누르면 1씩 증가한다는 뜻 a = a + 1;
              print(a);
            //  콘솔창에선 증가하고 있지만 랜더창에선 그대로임
            //  재랜더링 되도록 다음 시간에 코드 짤 예정

            },
          ),
          appBar: AppBar(),
          body: ProfileList(),
          bottomNavigationBar: BottomAppBar(),
        )
    );
  }
}
//stless > 자동완성 > class 생성해줌
//class는 위젯(?함수?)로 복잡한 코드를 따로 관리해줌
//아무 데나 만들어도 됨
//extedns StatelessWidget는 Statele..에 있는 함수를 Class에 다 넣어준다는 의미
class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);
  //const와 ProfileList는 향후 배울 것

  @override
  //여기서 override는 아래 함수 중 일부를 덮어 쓴다는 말
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 12,
      //몇 번 반복해줄지
      itemBuilder: (context, i) {
        //꼭 parameter 2개 필요, i는 1씩 증가하는 정수
        //함수를 할당함, 아래 함수를 반복해줌
        print(i);
        //print함수는 console.log와 유사
        //alt+4(command+4)누르면 console창 뜸
        return ListTile(
          //슨생님은 ListTile을 이용함
          leading: Icon(Icons.account_circle, size: 40, color: Colors.black,),
          title: Text('홍길동 ' + i.toString()),
        //  int는 Text에 안 나와서 .toString() 붙여야 함
        );
      },
    );
  }
}

class BottomAppBar extends StatelessWidget {
  const BottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            width: 2.0,),),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.phone),),
          IconButton(onPressed: (){}, icon: Icon(Icons.message),),
          IconButton(onPressed: (){}, icon: Icon(Icons.contact_page),),
        ],
      ),
    );
  }
}
