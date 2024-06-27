import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -0.1),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9BAAF2),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.home,
                size: 100,
                color: Colors.black,
              ),
              SizedBox(height: 10),
              Text(
                'HOMING',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
<<<<<<< HEAD
            ],
          ),
=======
            ),
            const SizedBox(height: 30.0),
            Container(
              height: 500,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(111, 111, 111, 0.5),
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    "INICIO DE SESIÓN",
                    style: TextStyle(
                      height: 4,
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  const SizedBox(
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
                  const SizedBox(height: 50.0),
                  const SizedBox(
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
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/landing');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(76, 81, 230, 1),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Iniciar sesión'),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  RichText(
                    text: TextSpan(
                      text: '¿No tienes cuenta? ',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Regístrate aquí',
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/register');
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
>>>>>>> 8ef438fbc09a2a715b3d800bd29aaaebc18dbc2c
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Text('Login Page Content'),
      ),
    );
  }
}
