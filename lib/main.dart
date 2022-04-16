import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//void는 '아무 것도 하지 말아주세요' 인데 알 필요 없음
//void main() {} 아래 다 지우고 새로 작성
void main() {
  runApp( MaterialApp(
    //원래 MyApp()을 MaterialApp으로 감쌈
    //MyApp()을 MaterialApp()로 감싼 이유는 context를 만들기 위해
    //아래 위젯(?)들은 모두 MaterialApp이 있는 context를 요구함
    //showDialog(context), Scaffold.of(context), Navigator.pop(context), Theme.of(context)
    home: MyApp(),
  ));
  //일단 const는 지워두자
  //  앱 동작 시켜주세요 뜻임
  //  runApp 소괄호 안에 우리가 만든 앱 레이아웃을 넣을 것
}

// MyApp은 메인페이지 만드는 부분
// stless 쓰고 tab하니까 아래 class 생성됨
// 앱 메인페이지 세팅을 위한 기본 문법, 나중에 이해 가능
//StatelessWidget에서 StatefulWidget으로 변경!!
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //일단 const는 지워두자
  var a = 0;


  @override
  Widget build(BuildContext context) {
    //context는 CustomWidget을 만들 때마다 강제로 하나씩 생성
    //노란 글씨들은 Type을 지정하는 글, 알 필요는 없음

    // return Container();
    // flutter는 <div>나 <span>이 아닌 widget으로 코드 작성함
    // 아래 코드처럼 Text('안녕')같이 넣어서 위젯 작성
    // 코드 복사는 Ctrl + D
    // return Container(
    return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Text(a.toString()),
            //버튼을 누르면 숫자가 올라가도록 코드 작성
            onPressed: (){
              showDialog(context: context, builder: (context){
                //showDialog에는 context와 builder, return이 필요함
                //하지만 context는 위젯의 족보로 위에 있는 위젯을 보여줌
                return Dialog(child: DialogDesign(),);
              });
            },
          ),
          appBar: AppBar(),
          body: ProfileList(),
          bottomNavigationBar: BottomAppBar(),
        );
  //  Scaffold로 return한 거라 마지막에 ; 넣어줌

  }
}
//stless > 자동완성 > class 생성해줌
//class는 위젯(?함수?)로 복잡한 코드를 따로 관리해줌
//아무 데나 만들어도 됨
//extedns StatelessWidget는 Statele..에 있는 함수를 Class에 다 넣어준다는 의미
//StatelessWidget에서 StatefulWidget으로 변경!!
class ProfileList extends StatefulWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
//   //const와 ProfileList는 향후 배울 것
  var name = ['전혁', '송용수', '김동욱',];
//
  @override
//   //여기서 override는 아래 함수 중 일부를 덮어 쓴다는 말
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 3,
//       //몇 번 반복해줄지
      itemBuilder: (context, i) {
//         //꼭 parameter 2개 필요, i는 1씩 증가하는 정수
//         //함수를 할당함, 아래 함수를 반복해줌
        print(i);
//         //print함수는 console.log와 유사
//         //alt+4(command+4)누르면 console창 뜸
        return ListTile(
//           //슨생님은 ListTile을 이용함
          leading: Icon(Icons.account_circle, size: 40, color: Colors.black),
          title: Text(name[i]),
//
//         //  int는 Text에 안 나와서 .toString() 붙여야 함
        );
      },
    );
  }
}

class DialogDesign extends StatelessWidget {
  const DialogDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 40, 32, 24),
      height: 280,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(child: Text('Contact', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), flex: 1, fit: FlexFit.tight,),
          Flexible(child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Number',
            ),
          ), flex: 1, fit: FlexFit.tight,),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              //  팝업된 Dialog없애는 위젯인 것 같길래 써봤더니 이게 되네-
              }, child: Text('Cancel', style: TextStyle(fontSize: 18),)),
              TextButton(onPressed: () {}, child: Text('OK', style: TextStyle(fontSize: 18),)),
            ],
          ), flex: 1, fit: FlexFit.tight,)
        ],
      ),
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
