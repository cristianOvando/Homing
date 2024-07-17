import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_drawer.dart';

class AddHomePage extends StatefulWidget {
  const AddHomePage({super.key});

  @override
  _AddHomePageState createState() => _AddHomePageState();
}

class _AddHomePageState extends State<AddHomePage> {
  final _descriptionController = TextEditingController();
  final _streetController = TextEditingController();
  final _stateController = TextEditingController();
  final _municipalityController = TextEditingController();
  final _priceController = TextEditingController();
  String? _selectedAvailability;
  File? _image;

  Future<void> _pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        final img.Image? image = img.decodeImage(await imageFile.readAsBytes());
        final img.Image resized = img.copyResize(image!, width: 800);
        final Directory tempDir = Directory.systemTemp;
        final String tempPath = tempDir.path;
        final File resizedImageFile = File('$tempPath/resized_image.jpg')
          ..writeAsBytesSync(img.encodeJpg(resized, quality: 85));

        setState(() {
          _image = resizedImageFile;
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _addHouse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwtToken');

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se encontró el token de autenticación')),
      );
      return;
    }

    final request = http.MultipartRequest('POST', Uri.parse('http://18.235.24.106:2024/api/houses'));
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['description'] = _descriptionController.text;
    request.fields['street'] = _streetController.text;
    request.fields['state'] = _stateController.text;
    request.fields['municipality'] = _municipalityController.text;
    request.fields['price'] = _priceController.text;
    request.fields['status'] = _selectedAvailability ?? '';

    if (_image != null) {
      request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
    } else {
      print('No image to upload.');
    }

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Casa agregada exitosamente')),
        );
        Navigator.pushNamed(context, '/nextadd');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al agregar la casa')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión: $e')),
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
            const Center(
              child: Text(
                "AGREGAR NUEVA PROPIEDAD",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _image == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image, size: 50, color: Colors.grey),
                          const SizedBox(height: 10),
                          const Text(
                            "Subir fotografía de la propiedad",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    : Image.file(_image!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField("Descripción", _descriptionController),
            const SizedBox(height: 10),
            _buildTextField("Entre calles", _streetController),
            const SizedBox(height: 10),
            _buildTextField("Estado", _stateController),
            const SizedBox(height: 10),
            _buildTextField("Municipio", _municipalityController),
            const SizedBox(height: 10),
            _buildTextField("Precio: \$", _priceController),
            const SizedBox(height: 20),
            _buildAvailabilityOptions(),
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
                    Navigator.pushNamed(context, '/myhouse');
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
                  onPressed: _addHouse,
                  child: const Text('Agregar'),
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

  Widget _buildAvailabilityOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Disponibilidad",
          style: TextStyle(color: Color.fromARGB(255, 17, 17, 17)),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildRadioOption("Disponible"),
            _buildRadioOption("En renta"),
            _buildRadioOption("No disponible"),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioOption(String label) {
    return Row(
      children: [
        Radio<String>(
          value: label,
          groupValue: _selectedAvailability,
          onChanged: (value) {
            setState(() {
              _selectedAvailability = value;
            });
          },
        ),
        Text(
          label,
          style: const TextStyle(color: Color.fromARGB(255, 17, 17, 17)),
        ),
      ],
    );
  }
}
