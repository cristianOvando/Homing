import 'package:flutter/material.dart';
import 'edithouse_page.dart';

class PropertyItem extends StatelessWidget {
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
    return Dismissible(
      key: Key(imagePath),
      background: slideRightBackground(), 
      secondaryBackground: slideLeftBackground(), 
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditHousePage(
                imagePath: imagePath,
                description: description,
                address: address,
                estado: estado,
                municipio: municipio,
                precio: precio,
                disponibilidad: disponibilidad,
              ),
            ),
          );
          return false;
        } else {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Confirmar'),
                content: Text('¿Estás seguro de que quieres eliminar la casa de la lista?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text('Sí'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        color: const Color.fromRGBO(236, 236, 236, 1),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(imagePath, width: 100, height: 100),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description),
                Text('# '),
                Text(address),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('Editar'),
                          onTap: onEdit,
                        ),
                        ListTile(
                          leading: Icon(Icons.delete),
                          title: Text('Eliminar'),
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Confirmar'),
                                  content: Text('¿Estás seguro de que quieres eliminar la casa de la lista?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(false),
                                      child: Text('No'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(true),
                                      child: Text('Sí'),
                                    ),
                                  ],
                                );
                              },
                            ).then((confirmed) {
                              if (confirmed) {
                                onDelete();
                              }
                            });
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Color(0xFF4C51E6), 
      child: Align(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Icon(Icons.edit, color: Colors.white),
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
