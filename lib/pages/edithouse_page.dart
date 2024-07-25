import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditHousePage extends StatefulWidget {
  final String houseId;
  final String imagePath;
  final String description;
  final String address;
  final String estado;
  final String municipio;
  final String precio;
  final String disponibilidad;

  const EditHousePage({
    super.key,
    required this.houseId,
    required this.imagePath,
    required this.description,
    required this.address,
    required this.estado,
    required this.municipio,
    required this.precio,
    required this.disponibilidad,
  });

  @override
  _EditHousePageState createState() => _EditHousePageState();
}

class _EditHousePageState extends State<EditHousePage> {
  late TextEditingController _descriptionController;
  late TextEditingController _addressController;
  late TextEditingController _estadoController;
  late TextEditingController _municipioController;
  late TextEditingController _precioController;
  late String _disponibilidad;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController(text: widget.description);
    _addressController = TextEditingController(text: widget.address);
    _estadoController = TextEditingController(text: widget.estado);
    _municipioController = TextEditingController(text: widget.municipio);
    _precioController = TextEditingController(text: widget.precio);
    _disponibilidad = widget.disponibilidad;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _addressController.dispose();
    _estadoController.dispose();
    _municipioController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  void _saveChanges() async {
    final updatedHouseData = {
      'description': _descriptionController.text,
      'street': _addressController.text,
      'state': _estadoController.text,
      'municipality': _municipioController.text,
      'price': _precioController.text,
      'status': _disponibilidad,
    };

    try {
      final response = await http.put(
        Uri.parse('http://18.235.24.106:2024/api/houses/${widget.houseId}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(updatedHouseData),
      );

      if (response.statusCode == 200) {
        Navigator.pop(context);
      } else {
        print('Error al actualizar la casa: ${response.body}');
      }
    } catch (error) {
      print('Error de conexión: $error');
    }
  }

  void _deleteHouse() async {
    try {
      final response = await http.delete(
        Uri.parse('http://tu_api_url/houses/${widget.houseId}'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        Navigator.pop(context);
      } else {
        print('Error al eliminar la casa: ${response.body}');
      }
    } catch (error) {
      print('Error de conexión: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB6B8F5),
      appBar: AppBar(
        title: Text('Editar Propiedad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(widget.imagePath, height: 200),
            const SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Entre calles'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _estadoController,
              decoration: InputDecoration(labelText: 'Estado'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _municipioController,
              decoration: InputDecoration(labelText: 'Municipio'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _precioController,
              decoration: InputDecoration(labelText: 'Precio: \$'),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _disponibilidad,
              items: ['Disponible', 'En renta', 'No disponible']
                  .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _disponibilidad = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Disponibilidad'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C51E6),
                foregroundColor: Colors.white,
              ),
              child: Text('Guardar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deleteHouse,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('Eliminar'),
            ),
          ],
        ),
      ),
    );
  }
}
