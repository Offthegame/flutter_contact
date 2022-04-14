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
      //기본 flutter 테마는 크게 두가지, MaterialApp과 Cupertino
      //디자인 빼고도 기능이 많아서 사용하는게 좋음
      // Material Design 쓰기 위해선 pubspec.yaml에 uses-material-design: true 여야 함
        home: Scaffold(
            appBar: AppBar(
              title: const Text('당근마켓 beta'),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.star_border_purple500_rounded))],
              //  title, leading: 왼쪽에 넣을 아이콘, action: 우측 아이콘
            ),
            body: SizedBox(
              width: double.infinity,
              height: 200,

              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),

                    ),
                    child: IconButton(
                        onPressed: () {},
                        iconSize: 100,
                      
                        icon: Image.asset('../assets/00885_2.jpg'),
                    //    이상하다. 왜 ../해서 lib폴더를 빠져나가야 했을까;
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      width: 300,
                      padding: EdgeInsets.all(20),
                      child: TextButton(onPressed: (){}, child: Wrap(
                        children: [
                          Text(
                            '캐논 DSLR 100D (단렌즈, 충전기 16기가 SD포함)',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child:
                                  Text('성동구 행당동 · 끌올 10분 전', style: TextStyle(fontSize: 12, color: Colors.grey), textAlign: TextAlign.left, ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child:
                                Text('210,000', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w900), textAlign: TextAlign.left,)
                              ),
                            ],
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      width: 320,
                      child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                              Text('4')

                            ]

                          )

                    )
                    ],
                  ),
                ],


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
