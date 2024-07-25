import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'house.dart';
import 'api_service.dart';
import 'app_drawer.dart';
import 'propertyitem.dart';
import 'dart:convert';
import 'edithouse_page.dart';

class MyHousePage extends StatefulWidget {
  const MyHousePage({super.key});

  @override
  State<MyHousePage> createState() => _MyHousePageState();
}

class _MyHousePageState extends State<MyHousePage> {
  late Future<List<House>> futureProperties;

  @override
  void initState() {
    super.initState();
    futureProperties = Future.value([]); 
    _loadUserHouses();
  }

  void _loadUserHouses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    if (userId != null) {
      setState(() {
        futureProperties = ApiService().fetchUserHouses(userId);
      });
    } else {
      print('User ID is null');
    }
  }

 void _editProperty(House property) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditHousePage(
        houseId: property.id,
        imagePath: 'data:image/png;base64,' + base64Encode(property.imageData!),
        description: property.description,
        address: property.street,
        estado: property.state,
        municipio: property.municipality,
        precio: property.price,
        disponibilidad: property.status,
      ),
    ),
  );
}


void _deleteProperty(String houseId) async {
  final response = await http.delete(
    Uri.parse('http://18.235.24.106:2024/api/houses/$houseId'),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    setState(() {
      futureProperties.then((properties) {
        properties.removeWhere((property) => property.id == houseId);
      });
    });

    Navigator.pop(context, true);
  } else {
    print('Error al eliminar la casa: ${response.reasonPhrase}');
  }
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
      body: FutureBuilder<List<House>>(
        future: futureProperties,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tienes propiedades agregadas'));
          } else {
            List<House> properties = snapshot.data!;
            return ListView.builder(
  itemCount: properties.length,
  itemBuilder: (context, index) {
    final property = properties[index];
    String imagePath = property.imageData != null 
        ? 'data:image/png;base64,' + base64Encode(property.imageData!)
        : 'lib/images/default_image.png';

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          property.imageData != null && property.imageData!.isNotEmpty
            ? Image.memory(
                property.imageData!,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
              )
            : Image.asset(
                'lib/images/default_image.png',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  property.street,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              _editProperty(property);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              _deleteProperty(property.id);
            },
          ),
        ],
      ),
    );
  },
);
          }
        },
      ),
    );
  }
}
