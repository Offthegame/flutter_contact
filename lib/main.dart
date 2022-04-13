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
          body: Center(
            //Container 마우스 hover해보면 wrap with Center 뜸
            //오늘은 Container에 대해 배움
            child: Container(
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),


            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: SizedBox(
              height: 70,
              //Row 줄 높이를 주려면 Container같은 것으로 감싸야함
              //Row위에 마우스 올리면 왼쪽에 전구가 뜸
              //전구 눌리면 wrap with container 클릭할 수 있음
              //하지만 Container를 남용하지 말라고 밑줄 그어짐
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.message)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.contact_page)),
              ],
          ),
            ),
        )
      )
    );
  }
}
