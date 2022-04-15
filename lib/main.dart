import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//void는 '아무 것도 하지 말아주세요' 인데 알 필요 없음
//void main() {} 아래 다 지우고 새로 작성
void main() {
  runApp(const MyApp());
  //  앱 동작 시켜주세요 뜻임
  //  runApp 소괄호 안에 우리가 만든 앱 레이아웃을 넣을 것
}

// MyApp은 메인페이지 만드는 부분
// stless 쓰고 tab하니까 아래 class 생성됨
// 앱 메인페이지 세팅을 위한 기본 문법, 나중에 이해 가능
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    // flutter는 <div>나 <span>이 아닌 widget으로 코드 작성함
    // 아래 코드처럼 Text('안녕')같이 넣어서 위젯 작성
    // 코드 복사는 Ctrl + D
    // return Container(
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: ProfileList(),
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
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color.fromRGBO(229, 229, 229, 1.0),width: 1,),
              )
          ),
          child: TextButton(
              onPressed: (){},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(10,20,10,24),
              ),
              child: Row(
                children: [
                  Icon(Icons.account_circle, size: 40, color: Colors.black,),
                  SizedBox(width: 20,),
                  Text('노마드곰돌', style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              )

          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color.fromRGBO(229, 229, 229, 1.0),width: 1,),
              )
          ),
          child: TextButton(
              onPressed: (){},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(10,20,10,24),
              ),
              child: Row(
                children: [
                  Icon(Icons.account_circle, size: 40, color: Colors.black,),
                  SizedBox(width: 20,),
                  Text('땃쥐', style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              )

          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color.fromRGBO(229, 229, 229, 1.0),width: 1,),
              )
          ),
          child: TextButton(
              onPressed: (){},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(10,20,10,24),
              ),
              child: Row(
                children: [
                  Icon(Icons.account_circle, size: 40, color: Colors.black,),
                  SizedBox(width: 20,),
                  Text('물개', style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              )

          ),
        ),

      ],
    );
  }
}