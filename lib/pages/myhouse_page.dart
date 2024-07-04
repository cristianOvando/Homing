import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'propertyitem.dart'; 
import 'edithouse_page.dart';

class MyHousePage extends StatefulWidget {
  const MyHousePage({super.key});

  @override
  State<MyHousePage> createState() => _MyHousePageState();
}

class _MyHousePageState extends State<MyHousePage> {
  List<Map<String, String>> properties = [
    {
      "imagePath": "lib/images/casa1.png",
      "description": "Descripcion breve",
      "address": "3av sur villaflores",
      "estado": "Estado",
      "municipio": "Municipio",
      "precio": "\$100,000",
      "disponibilidad": "Disponible"
    },
   
  ];

  void _deleteProperty(int index) {
    setState(() {
      properties.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(157, 160, 241, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0),
        child: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromRGBO(157, 160, 241, 1),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("lib/images/logo_homing.png", height: 50),
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
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addhome');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(76, 81, 230, 1),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Agregar propiedad'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: const Center(
                  child: Text(
                    'MIS PROPIEDADES',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
          ],
        ),
      ),
      endDrawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return PropertyItem(
            imagePath: property["imagePath"]!,
            description: property["description"]!,
            address: property["address"]!,
            estado: property["estado"]!,
            municipio: property["municipio"]!,
            precio: property["precio"]!,
            disponibilidad: property["disponibilidad"]!,
            onDelete: () => _deleteProperty(index),
            onEdit: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditHousePage(
                    imagePath: property["imagePath"]!,
                    description: property["description"]!,
                    address: property["address"]!,
                    estado: property["estado"]!,
                    municipio: property["municipio"]!,
                    precio: property["precio"]!,
                    disponibilidad: property["disponibilidad"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
