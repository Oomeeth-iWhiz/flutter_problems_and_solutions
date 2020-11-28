import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => Login(),
        '/my_home' : (context) => MyHome(),
      },
    ),
  );
}

class Login extends StatelessWidget
{
  void homePage(BuildContext context)
  {
    Navigator.pushNamed(context, "/my_home");
  }

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Center(
          child:
          Column(
            children: [
              Text("Welcome to the Login Page"),
              ElevatedButton(
                onPressed: ()
                {
                  homePage(context);
                },
                child: Text("Login"),
              ),
            ],
          )
      ),
    );
  }
}

class MyHome extends StatelessWidget
{
  void removePreviousRoutes(BuildContext context)
  {
    Navigator.of(context).pushNamedAndRemoveUntil('/my_home', (Route<dynamic> route) => false);
  }

  Widget build(BuildContext context)
  {
    WidgetsBinding.instance.addPostFrameCallback((_) => removePreviousRoutes(context));

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("My Home"),
        ),
        body: Center(
          child:
          Text("Welcome to the Home Page"),
        )
    );
  }
}