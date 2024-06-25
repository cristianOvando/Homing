import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4D6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9DA0F1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Acción al presionar el botón de regresar
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.location_on),
                const SizedBox(width: 8),
                Text("HOMING", style: TextStyle(color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Nombre'),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "C",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Mi cuenta'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Acción al presionar "Mi cuenta"
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Mis casas'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Acción al presionar "Mis casas"
              },
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text(
                'Cerrar sesión',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // Acción al presionar "Cerrar sesión"
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0),
              Text(
                "ENCUENTRA LA CASA QUE BUSCAS CON NOSOTROS",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
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
              const SizedBox(height: 20.0),
              SizedBox(
                height: 200,
                child: PageView(
                  children: <Widget>[
                    _buildImageCarousel('lib/images/CasaSuchiapa.jpg', 'Villaflores'),
                    _buildImageCarousel('lib/images/CasaVillaflores.jpg', 'Suchiapa'),
                    _buildImageCarousel('lib/images/CasaTuxtla.jpg', 'Tuxtla'),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "RECOMENDACIONES",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              _buildRecommendation("Casa villaflores - muy buena", 'lib/images/user1.png'),
              _buildRecommendation("Depto Suchiapa - Excelente", 'lib/images/user2.png'),
              _buildRecommendation("Casa Suchiapa - Buena casa", 'lib/images/user3.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel(String imagePath, String location) {
    return Column(
      children: [
        Image.asset(imagePath, fit: BoxFit.cover),
        const SizedBox(height: 5),
        Text(
          location,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendation(String text, String userImagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(userImagePath),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}