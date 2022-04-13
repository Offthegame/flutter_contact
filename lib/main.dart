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
        //기본 flutter 테마는 크게 두가지, MaterialApp과 Cupertino
        //디자인 빼고도 기능이 많아서 사용하는게 좋음
        // Material Design 쓰기 위해선 pubspec.yaml에 uses-material-design: true 여야 함
        home: Scaffold(
          appBar: AppBar(
            title: const Text('같이카 beta'),
            centerTitle: true,
          ),
          body: Row(
            // Row는 가로로, Column은 세로로 배치
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // display: flex와 유사한 기능, row에서는 가로로 column에서는 세로로 동일 간격
            // justify-content: space-around와 같음
            // crossAxisAlignment: CrossAxisAlignment.center,(상하 폭이 필요함)
            // ㄴalign-items : center 느낌? (수직을 보조하는?)
            //  Ctrl+Space누르면 자동완성 뜸, 그걸로 코드 작성
            //  안에 넣을 함수는 왼쪽과 똑같이 쳐보는 걸로 시작
            //  아니면 마우스 hover를 통해 함수 파악,
            //  또는 함수 뒤에 점(.)을 찍거나 괄호()를 치거나 하면서 함수가 되는지 확인
            //  자동 완성엔 한계가 있어서 구글링이 답 ㅠㅠ
            children: [
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
            ]
          // children : const [] 하지 않았다고 밑줄 생김
          // analysis_options.yaml 이동해서 아래 코드 추가
          // prefer_const_literals_to_create_immutables: false
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                IconButton(onPressed: () {}, icon: Icon(Icons.message)),
                IconButton(onPressed: () {}, icon: Icon(Icons.contact_page)),
            ],
          ),
        )
      )
    );
  }
}
