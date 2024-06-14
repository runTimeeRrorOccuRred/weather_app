import 'package:flutter/material.dart';
class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(""),
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
          Container(
            child: Text(""),
            width: 200,
            height: 200,
            color: Colors.purple,)
        ],
      ),
    );
  }
}
