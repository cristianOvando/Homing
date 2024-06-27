import 'package:flutter/material.dart';
import 'app_drawer.dart';  // Importa AppDrawer aquí

class MyHousePage extends StatefulWidget {
  const MyHousePage({super.key});

  @override
  State<MyHousePage> createState() => _MyHousePageState();
}

class _MyHousePageState extends State<MyHousePage> {
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
                color: Color.fromRGBO(132, 135, 238, 1),
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
      body: Center(
        child: Column(
          children: <Widget>[
            PropertyItem(imagePath: "lib/images/casa1.png", description: "Descripcion breve", address: "3av sur villaflores"),
            const SizedBox(height: 10),
            PropertyItem(imagePath: "lib/images/casa2.png", description: "Descripcion breve", address: "3av sur villaflores"),
            const SizedBox(height: 10),
            PropertyItem(imagePath: "lib/images/casa1.png", description: "Descripcion breve", address: "3av sur villaflores"),
          ],
        ),
      ),
    );
  }
}

class PropertyItem extends StatelessWidget {
  final String imagePath;
  final String description;
  final String address;

  const PropertyItem({
    required this.imagePath,
    required this.description,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Image.asset("lib/images/PuntosNavegacion.png", width: 30),
        ],
      ),
    );
  }
}
