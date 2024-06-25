import 'package:flutter/material.dart';

class locationSelectPage extends StatefulWidget {
  const locationSelectPage({super.key});

  @override
  State<locationSelectPage> createState() => _locationSelectPage();
}

class _locationSelectPage extends State<locationSelectPage>{
  @override
    Widget build(BuildContext context){
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
      );
    }
  }