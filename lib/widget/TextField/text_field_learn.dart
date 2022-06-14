import 'package:flutter/material.dart';

class TextFieldRoute extends StatefulWidget {
  @override
  State<TextFieldRoute> createState() {
    print('sssss');
    return TextFieldState();
  }
}

/*
相当于Android的EditText
 */
class TextFieldState extends State<TextFieldRoute> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Learn'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: 'User',
              hintText: 'UserName or Email',
              prefixIcon: Icon(Icons.person),
            ),
            onChanged: (str) {
              print(str);
              print('controller' + textEditingController.text);
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Your password',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          //TextFormField是TextField的包装类，包含了Form的特性，方便数据的合法性检验和多个TextField的统一管理
          TextFormField(),
        ],
      ),
    );
  }
}
