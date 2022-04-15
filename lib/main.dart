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
          body: Row(
            children: [
              Flexible(child: Container(
                color: Colors.green,),
                flex: 1,),
                //flex를 통해 1대 1로 화면을 양분, 1:2, 1:4 등으로 응용 가능
              Flexible(child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(color: Colors.grey, height: 100,),
                    Expanded(child: Container(color: Colors.deepPurple,), flex: 1,),
                  //  Expanded는 Flexible과 달리 남은 화면 꽉 채우기 가능
                  ],
                ),
              ),
                flex: 1,),
            ]

          ),
        )
    );
  }
}