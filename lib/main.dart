import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
// permission handler 추가 완료
// 패키지 설치와 더불어 gradle파일과 Manifest파일 세팅들이 끝나면 emul재시작 필요

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
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
    //  권한을 요청하는 팝업창 띄워 달라는 코드임
      openAppSettings();
    //  앱 설정화면 켜 달라는 코드
    }
  }
  // 라이브러리 만든 사람이 위처럼 써라고 함
  // Android 11버전, iOS에서 유저가 한 두번 이상 거절하면 다시 팝업 안 뜸
  // 따라서 실제 어떤 권한이 필요한 순간에 권한을 요청하는 것이 필요함
  // async await는 자바스크립트의 promise랑 유사, but Futures라고 부름

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getPermission();
  // //  화면 실행시 getPermission()이 보여지도록 함,
  // //  하지만 요즘엔 이렇게 시작과 동시에 권한요청을 하지 않음
  // }
  // 화면 실행시 보여지는 함수, init만 입력하면 자동완성으로 initState가 뜸

  var name = ['전혁', '송용수', '김동욱',];
  var a = 0;
  var total = 0;
addOne(){
  setState(() {
    total++;
  });
}
  //이처럼 함수를 부모 class 밑에 '설치 > 전달 > 받고 > 정의 > 적용'

  addName(txt) {
  setState(() {
    //하, setState 자꾸 까먹지 말자 ㅠㅠ 몇번째..?
    name.add(txt);
  });
  }
  
  
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
                return Dialog(
                  child: DialogDesign(naming: a, addOne: addOne, addName: addName, name: name),
                //  부모의 데이터를 자식 Widget에서 쓰기 위해 넣어줌
                );
              });
            },
          ),
          appBar: AppBar(
            title: Text(total.toString()),
            actions: [
              IconButton(onPressed: (){ getPermission(); }, icon: Icon(Icons.contacts))
            ],
          ),
          body: ProfileList(name: name),
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
  ProfileList({Key? key, this.name}) : super(key: key);
  var name;

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
//   //const와 ProfileList는 향후 배울 것
//
  @override
//   //여기서 override는 아래 함수 중 일부를 덮어 쓴다는 말
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: widget.name.length,
//       //몇 번 반복해줄지
//    뭔진 모르겠지만 이거 list.length써 줄 때 ()이건 안 씀
      itemBuilder: (context, i) {
//         //꼭 parameter 2개 필요, i는 1씩 증가하는 정수
//         //함수를 할당함, 아래 함수를 반복해줌
        print(i);
//         //print함수는 console.log와 유사
//         //alt+4(command+4)누르면 console창 뜸
        return ListTile(
//           //슨생님은 ListTile을 이용함
          leading: Icon(Icons.account_circle, size: 40, color: Colors.black),
          title: Text(widget.name[i]),
//
//         //  int는 Text에 안 나와서 .toString() 붙여야 함
        );
      },
    );
  }
}

class DialogDesign extends StatefulWidget {
  DialogDesign({Key? key, this.naming, this.addOne, this.addName, this.name}) : super(key: key);
  // 기존 Key? key 부분은 꼭 남겨두자. this.naming을 통해 부모에게서 정보 가져옴
  // 중괄호 부분에 parameter를 설정할 수 있음(중괄호는 optional하게 두 개를 받는다는 의미? 하나만 넣어도 됨?)
  // naming이란 parameter를 쓰겠습니다는 얘기, but 아래에 변수를 설정해둬야 함
  // key에 대해서는 다음 시간에 설명
  var naming;
  var addOne;
  var inputData = TextEditingController();
  //TextEditingController() 안에 Input 데이터가 들어감
  var addName;
  var name;

  @override
  State<DialogDesign> createState() => _DialogDesignState();
}

class _DialogDesignState extends State<DialogDesign> {
  //부모에게서 가져온 데이터를 여기서 이렇게 써야함


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
            controller: widget.inputData,
            //위치에 따라 widget.붙여야 하는 것 잊지말자!
            //controller 대신 onChanged: (text) { widget.inputData = text }, 사용 가능
            //onChange는 inputData가 많을 경우 사용
            //하지만 우리는 list[]나 Map{}자료를 사용할 예정
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'name',
            ),
          ), flex: 1, fit: FlexFit.tight,),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              //  팝업된 Dialog없애는 위젯인 것 같길래 써봤더니 이게 되네-
              //  '현재 페이지 닫아주셈'과 같은 의미, 나중에 다시 나옴
              }, child: Text('Cancel', style: TextStyle(fontSize: 18),)),
              TextButton(onPressed: () {
                  widget.addName(widget.inputData.text.toString());
              //    inputData List 안, text를 toString해서 보여주자!
                  Navigator.pop(context);
                  print(widget.name);

              }, child: Text('OK', style: TextStyle(fontSize: 18),)),
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


// Android Studio에서 가상기기를 만들어 플러터 앱에 띄움
// 맥북의 경우 기본 에뮬레이터가 동봉돼 나옴, 그거 쓰면 됨

// <사전 설정 : 이미 다 돼있는 경우도 있음>
// Bios에서 Virtual 어쩌구 켜기 > "Windows 기능켜기"에서 Hyper-V, 하이퍼바이저  어쩌구 체크 해제
// >Android Studio에서 Intel x86 Emulator ... 체크 > Apply

// <안드로이드 가상기기 만들기>
// Tools > AVD manager(Device manager로 바뀜!) > Create Virtual Device 누르기 > 기기 선택하기 (우린 Pixel 5)
// > 시스템 이미지 고르기(안드로이드 소프트웨어 버전 고르는 듯 30 선택, 난 31)
// > Chrome(web)대신 Refresh눌린 후 Open Android Emulator 누르면 폰이 나타남!

// <iOS 기기 테스트의 경우>
// 맥북 앱스토어에서 Xcode 설치 필요(10기가 넘음)
// 런치패드에서 터미널 검색 > 아래 코드 입력
// sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
// sudo xcodebuild -runFirstLaunch
// sudo xcodebuild -license

//차례로 터미널에 입력, 중간에 비번 입력하라고 하는데 맥북 비번 없으면 만들어야 함, 이후 동의까지 진행
// Android Studio 상단 Device 선택 부분에 Open iOS Simulator 등장!
// 만약 없다면 spotlight 검색 > simulator 검색 후 실행



// <아이폰 권한 요청을 위한 설정: 맥북에서만 가능>
// 프로젝트 켜 둔 상황에서 Terminal Open (Android Studio는 상단 View - Tool Windows - Terminal)

// ****** 아이폰용 Setting ******

// <m1 맥북의 경우 아래 코드들 입력>
// cd ios
// sudo arch -x86_64 gem install ffi
// sudo arch -x86_64 gem install cocoapods

// 위 코드를 입력하면 ios폴더에 Podfile이 생김(없으면 터미널에 pod init입력)
// Podfile 최하단에 post_install do |installer| 어쩌구로 시작하는 부분 다 지우기
// 아래 크드로 교체
// post_install do |installer|
  // installer.pods_project.targets.each do |target|
    // flutter_additional_ios_build_settings(target)
    // target.build_configurations.each do |config|
      // config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
        // '$(inherited)',
        // 'PERMISSION_CONTACTS=1',
        // #추가할거 더 있으면 이 자리에
      // ]
    // end
    // end
// end

// 다른 권한들 주고 싶으면 https://pub.dev/packages/permission_handler 여기 방문
// PERMISSION_CAMERA=1 이렇게 쓰면 카메라 권한임

// Info.plist파일 오픈해서 아래 코드를 적절한(?) 곳에 추가
// <key>NSContactsUsageDescription</key>
// <string>님 폰의 연락처 권한이 필요합니다 제발 주셈</string>

// 다른 권한도 요청하고 있으면 Info.plist파일에 다른 권한도 추가 필요