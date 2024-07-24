import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'app_drawer.dart'; 

class NextAddHomePage extends StatefulWidget {
  const NextAddHomePage({super.key});

  @override
  _NextAddHomePageState createState() => _NextAddHomePageState();
}

class _NextAddHomePageState extends State<NextAddHomePage> {
  final TextEditingController _ownerController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _homePhoneController = TextEditingController();
  final TextEditingController _extraInfoController = TextEditingController();

  Future<void> _registerOwner() async {
  final String owner = _ownerController.text;
  final String phone = _phoneController.text;
  final String mail = _emailController.text;
  final String housePhone = _homePhoneController.text;
  final String extraInfo = _extraInfoController.text;

  final url = Uri.parse('http://18.235.24.106:2024/api/owner');

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'owner': owner,
        'phone': phone,
        'mail': mail,
        'housePhone': housePhone,
        'extraInfo': extraInfo,
      }),
    );

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.pushNamed(context, '/landing');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar el propietario: ${response.body}')),
      );
    }
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al conectar con el servidor')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(157, 160, 241, 1),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/logo_homing.png', 
              height: 40,
            ),
            const Text(
              "HOMING",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      endDrawer: const AppDrawer(), 
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Center(
              child: const Text(
                "INFORMACION DEL PROPIETARIO",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField("Propietario", _ownerController),
            const SizedBox(height: 10),
            _buildTextField("Telefono", _phoneController),
            const SizedBox(height: 10),
            _buildTextField("Correo electronico", _emailController),
            const SizedBox(height: 10),
            _buildTextField("Numero telefono de casa", _homePhoneController),
            const SizedBox(height: 10),
            _buildTextField("Informacion extra:", _extraInfoController),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context); 
                  },
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4C51E6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _registerOwner,
                  child: const Text('Guardar'),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF9DA0F1),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
