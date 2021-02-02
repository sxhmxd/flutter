import 'package:flutter/material.dart';


class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: Text("New route"),
     ),
      body: Center(
        child: new Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
            ),
          ],
        )
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,this.title}):super(key:key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  int _counter = 0;
  void _incrementCounter(){
    setState((){
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text(widget.title),
      //
      // ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    MaterialPageRoute(builder: (context) {
                      return NewRoute();
                    }));
              },
            ),
            new Text('You have push the button '),
            new Text(
                '$_counter',
                 style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed:_incrementCounter,
        tooltip:'Increment',
        child: new Icon(Icons.add),
      ),
    );

  }
}