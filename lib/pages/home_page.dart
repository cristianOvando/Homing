import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './register_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(157, 160, 241, 1),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/images/logo_homing.png"),
                Text(
                  "HOMING",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 60.0),
            Container(
              width: 300,
              child: Text(
                "ENCUENTRA LA CASA QUE BUSCAS CON NOSOTROS",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              height: 500,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
              color: Color.fromRGBO(111, 111, 111, 0.5),
              border: Border.all(
                color: Colors.black,
              width: 1, 
              ),
              borderRadius: BorderRadius.circular(10),
              ),
            child: 
            SizedBox(
              child: Column(
                children: [
                  Text(
                    "INICIO DE SESIÓN",
                    style: TextStyle(
                      height: 4,
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40.0),
                  SizedBox(
                  width: 300.0,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Nombre de usuario',
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  ),
                  SizedBox(height: 50.0),
                  SizedBox(
                      width: 300.0,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                        obscureText: true,
                      ),
                    ),
                  SizedBox(height: 40.0,),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(76, 81, 230, 1),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Iniciar sesión'),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RichText(text: TextSpan(
                    text: '¿No tienes cuenta? ',
                    
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Registrate aquí',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                        ..onTap = (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => RegisterPage())
                          );
              
                        },
              
                      )
                    ]
                  ))
                ],
              ),
            )
            ),
          ],
        )));
  }
}
