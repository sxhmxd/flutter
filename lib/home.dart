import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MainPageState();
  }
}
class MainPageState extends State <MainPage>{
  int currentIndex = 0;
  final items = [
    BottomNavigationBarItem(icon: Image(image: AssetImage('images/blackList.png',)), title: Text
      ('首页'),activeIcon: Image(image:
    AssetImage
      ('images/car'
        '.png'))),
    BottomNavigationBarItem(icon: Image(image: AssetImage('images/card1.png')),
        title:
        Text("行情"),activeIcon: Image(image: AssetImage('images/goods.png'))),
    BottomNavigationBarItem(icon: Image(image: AssetImage('images/icpass.png')),
        title: Text
          ("交易"),activeIcon: Image
          (image:
        AssetImage('images/org.png'),)),
    BottomNavigationBarItem(icon: Image(image: AssetImage('images/business.png')),
        title: Text
          ("资产"),activeIcon: Image(image:
        AssetImage('images/org.png'),)),
  ];
  final bodyLists = [
    HomepageWidget(),
    HomepageWidget(),
    HomepageWidget(),
    HomepageWidget(),

  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      appBar: AppBar(title: Text("切换"),),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
      ),
      body: bodyLists[currentIndex],
    );
  }
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

class HomepageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomepageWidgetState();
  }
}

class HomepageWidgetState extends State <HomepageWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text("首页 $count",style: TextStyle(color: Colors.blue),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addButtonClick,
        child: Icon(Icons.add),
      ),
    );
  }
  void addButtonClick() {
    setState(() {
      count ++;
    });
  }
}
