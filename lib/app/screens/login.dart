import 'package:flutter/material.dart';
import '../components/CodeInput.dart';
import '../http/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  static bool isChinaPhoneLegal(String str) {
    return new RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(str);
  }

  final usernameCtrl = TextEditingController(text: '');
  final passwordCtrl = TextEditingController(text: '');
  void login() {
    if (_formKey.currentState.validate()) {
      api.login(usernameCtrl.text, passwordCtrl.text).then((data) {
        print(data);
        // LocalStorage.set("token")
      });
    }
  }

  void sendCode() {
    api.sendLoginCode(usernameCtrl.text);
  }

  Widget usernameInput() {
    return new Container(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Stack(
          children: <Widget>[
            TextFormField(
              controller: usernameCtrl,
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入手机号码';
                }
                if (!isChinaPhoneLegal(value)) {
                  return '请输入有效手机号码';
                }
                return null;
              },
              onSaved: (val) {
                print(val);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '账号',
              ),
            ),
            Positioned(
              right: 12.0,
              top: 10.0,
              child: LoginFormCode(available: true, onTapCallback: sendCode),
            ),
          ],
        ));
  }

  Widget loginBtn() {
    return SizedBox(
      width: double.infinity, // match_parent
      child: RaisedButton(
        onPressed: login,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
        child: new Text(
          '登录',
          style: new TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: new Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                usernameInput(),
                new Container(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '密码',
                    ),
                  ),
                ),
                loginBtn()
              ],
            ),
          )),
    );
  }
}
