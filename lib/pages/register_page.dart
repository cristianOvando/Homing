import 'package:flutter/material.dart';
import 'package:homing/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _selectedGender = 'male'; 
  String _selectedPosition = 'Campo laboral'; 

  List<String> position = ['Campo laboral', 'Estudiante', 'Profesional', 'Mayor de edad'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromRGBO(157, 160, 241, 1),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/images/logo_homing.png"),
                Text(
                  'HOMING',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 650,
              width: 340,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(111, 111, 111, 0.5),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'REGISTRO',
                        style: TextStyle(
                          height: 1,
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nombres',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Apellidos',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Correo',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Género',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'male',
                                  groupValue: _selectedGender,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedGender = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Masculino',
                                  style: TextStyle(color: Colors.white, fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'female',
                                  groupValue: _selectedGender,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedGender = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Femenino',
                                  style: TextStyle(color: Colors.white, fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'other',
                                  groupValue: _selectedGender,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedGender = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Otro',
                                  style: TextStyle(color: Colors.white, fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'No. Teléfono',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 40,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: _selectedPosition,
                          dropdownColor: Colors.white,
                          onChanged: (String? newPosition) {
                            setState(() {
                              _selectedPosition = newPosition!;
                            });
                          },
                          items: position.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    Align(
                      alignment: Alignment.center,
                  child: SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(76, 81, 230, 1),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Registrarse'),
                    ),
                  ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
