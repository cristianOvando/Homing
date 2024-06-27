import 'package:flutter/material.dart';
import 'app_drawer.dart';

class LocationPage extends StatefulWidget {
  final String location;

  const LocationPage({super.key, required this.location});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final int rating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4D6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9DA0F1),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/logo_homing.png',
              height: 40,
            ),
            const SizedBox(width: 9),
            Text("HOMING", style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      endDrawer: const AppDrawer(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Categoria',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Departamento',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60),
            Image.asset('lib/images/casa3.png'),
            SizedBox(height: 10),
            Container(
              constraints: BoxConstraints(maxWidth: 260),
              child: Text(
                'Descripción breve del lugar o casa a rentar por ejemplo: \n # \n 3avsur villaflores',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(182, 184, 245, 100),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              padding: EdgeInsets.all(8.0), 
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Comentarios',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 150),
                      ...List.generate(5, (index) {
                        return Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          size: 20.0,
                          color: Color.fromARGB(255, 255, 194, 13),
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 10), // Espacio entre las filas
                  Row(
                    children: [
                      Image.asset('lib/images/IconUser.png'),
                      SizedBox(width: 20,),
                      Text('Casa villaflores-muy buena\n Excelente lugar de muy buen \n ambiente', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ],
                
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/landing');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(76, 81, 230, 1),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Rentar'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
