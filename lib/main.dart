import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sign_in_page/dropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  late bool _enableBtn;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: _formKey, //key for form
            onChanged: () =>
                setState(() => _enableBtn = _formKey.currentState!.validate()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.topCenter,
                  child: Image(
                    image: NetworkImage(
                        'https://tradingbrokers.com/wp-content/uploads/2020/11/Deriv-Logo.png'),
                    height: 30,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Hi there",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Color(0xFF363f93)),
                ),
                SizedBox(height: height * 0.01),
                TextFormField(
                  decoration: InputDecoration(labelText: "Enter your name"),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter correct name";
                    } else {
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: height * 0.01),
                TextFormField(
                  decoration: InputDecoration(labelText: "Enter your email"),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                            .hasMatch(value)) {
                      return "Enter correct email";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.01),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: "Enter your passsword"),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r'^[\w]+$').hasMatch(value)) {
                      return "Enter correct password";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: DropDownDemo(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: height * 0.02),
                    ElevatedButton(
                        // onPressed: () {
                        //   if (formKey.currentState!.validate()) {
                        //     final snackBar = SnackBar(
                        //         content: Text('Submission successful'));
                        //     _scaffoldKey.currentState!..showSnackBar(snackBar);
                        //   }
                        // },

                        onPressed: !_enableBtn
                            ? null
                            : () {
                                final snackBar = SnackBar(
                                    content: Text('Submission successful'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                        child: Text("Submit")),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
