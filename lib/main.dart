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
        home: Center(
      //  Text('안녕')처럼 텍스트도 넣을 수 있음
      //  Icon(Icon.아이콘이름)하면 아이콘 넣어줌(플러터 홈페이지에 있음)
      //  네모 박스는 Container(), 이미지는 Image.asset('이미지경로')
      //  이미지는 assets폴더 만들고 pubspec.yaml 이미지 경로 등록 필요
      //    아래처럼 바로 CSS설정이 가능함, 단위는 LP(Logical Pixel)로 1cm에 38LP라고 함
            child: Container(width : 50, height : 50, color: Colors.blue)
        //        child위젯도 넣어봄
        )
    );
  }
}
