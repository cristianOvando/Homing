import 'package:flutter/material.dart';
import 'house.dart';
import 'api_service.dart';
import 'location_page.dart'; 
import 'dart:typed_data';
import 'app_drawer.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Future<List<House>> futureHouses;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    futureHouses = ApiService().fetchHouses();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9DA0F1),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/logo_homing.png',
              height: 40,
            ),
            const SizedBox(width: 9),
            const Text(
              'HOMING',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      endDrawer: const AppDrawer(),
      body: FutureBuilder<List<House>>(
        future: futureHouses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No houses available'));
          } else {
            List<House> houses = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  const Text(
                    "ENCUENTRA LA CASA QUE BUSCAS CON NOSOTROS",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 320,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: houses.length,
                      itemBuilder: (context, index) {
                        return _buildImageCarousel(context, houses[index]);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(houses.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        width: _currentPage == index ? 12.0 : 8.0,
                        height: _currentPage == index ? 12.0 : 8.0,
                        decoration: BoxDecoration(
                          color: _currentPage == index ? Colors.black : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildImageCarousel(BuildContext context, House house) {
    Uint8List? imageBytes = house.imageData;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationPage(location: house.municipality),
          ),
        );
      },
      child: Column(
        children: [
          if (imageBytes != null && imageBytes.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.memory(
                imageBytes,
                fit: BoxFit.cover,
                width: 270,
                height: 150,
              ),
            )
          else
            Container(
              width: 270,
              height: 150,
              color: Colors.grey,
              child: Icon(Icons.image_not_supported),
            ),
          const SizedBox(height: 20),
          Column(
            children: [
              Text(
                house.municipality,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
