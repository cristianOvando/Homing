import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PropertyItem extends StatelessWidget {
  final String houseId;
  final String imagePath;
  final String description;
  final String address;
  final String estado;
  final String municipio;
  final String precio;
  final String disponibilidad;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const PropertyItem({
    required this.houseId,
    required this.imagePath,
    required this.description,
    required this.address,
    required this.estado,
    required this.municipio,
    required this.precio,
    required this.disponibilidad,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imagePath.isNotEmpty)
            Image.network(imagePath, width: 100, height: 100, fit: BoxFit.cover)
          else
            Image.asset('lib/images/default_image.png', width: 100, height: 100, fit: BoxFit.cover),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(address, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => _confirmDelete(context),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar eliminación'),
        content: Text('¿Estás seguro de que deseas eliminar esta casa?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await _deleteHouse();
            },
            child: Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteHouse() async {
    final response = await http.delete(
      Uri.parse('http://18.235.24.106:2024/api/houses/$houseId'),
    );

    if (response.statusCode == 200) {
      onDelete();
    } else {
      print('Error al eliminar la casa: ${response.reasonPhrase}');
    }
  }
}
