import 'package:flutter/material.dart';
import 'main1.dart';
import 'main2.dart';
import 'main3.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MainPageState();
  }
}
class MainPageState extends State <MainPage>{
  int currentIndex = 0;
  final items = [
    BottomNavigationBarItem(icon: Image(image: AssetImage('images/bg-icon-y.png',)), title: Text
      ('首页'),activeIcon: Image(image:
    AssetImage
      ('images/bg-icon'
        '.png'))),
    BottomNavigationBarItem(icon: Image(image: AssetImage('images/card1.png')),
        title:
        Text("行情"),activeIcon: Image(image: AssetImage('images/icpass.png'))),

    BottomNavigationBarItem(icon: Image(image: AssetImage('images/goods.png')),
        title: Text
          ("交易"),activeIcon: Image
          (image:
        AssetImage('images/blackList.png'),)),
    BottomNavigationBarItem(icon: Image(image: AssetImage('images/car.png')),
        title: Text
          ("资产"),activeIcon: Image(image:
        AssetImage('images/org.png'),)),
  ];
  final bodyLists = [
    RandomWords(),
    MyHomePage(),
    MyHomePage(),
    RandomWords(),
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

