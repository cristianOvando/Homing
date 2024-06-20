import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(182, 184, 245, 1),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/images/logo_homing.png"),
                Text(
                  "HOMING",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 60.0),
            Text(
              "ENCUENTRA LA CASA QUE BUSCAS CON NOSOTROS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            Column(
              children: [
                Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                SizedBox(width: 20.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      fillColor: Colors.white),
                  obscureText: true,
                ),
                SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(82, 81, 81, 1),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Login'),
                ),
                SizedBox(
                  height: 14.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            )
          ],
        )));
  }
}
