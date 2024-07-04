import 'package:flutter/material.dart';

class EditHousePage extends StatefulWidget {
  final String imagePath;
  final String description;
  final String address;
  final String estado;
  final String municipio;
  final String precio;
  final String disponibilidad;

  const EditHousePage({
    super.key,
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

  void _saveChanges() {
    Navigator.pop(context, {
      'description': _descriptionController.text,
      'address': _addressController.text,
      'estado': _estadoController.text,
      'municipio': _municipioController.text,
      'precio': _precioController.text,
      'disponibilidad': _disponibilidad,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cambios guardados')),
    );
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
          ],
        ),
      ),
    );
  }
}
