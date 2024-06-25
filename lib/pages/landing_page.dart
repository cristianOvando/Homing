import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
      endDrawer: Drawer(
        child: Container(
          color: Color(0xFF8487EE),
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF8487EE),
                ),
                accountName: Text('Nombre', style: TextStyle(color: Colors.white)),
                accountEmail: null,
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40.0,
                    color: Color(0xFF8487EE),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle, color: Colors.white),
                title: Text('Mi cuenta', style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.pushNamed(context, '/account');
                },
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text('Mis casas', style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.pushNamed(context, '/myhouse');
                },
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
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
                  fontSize: 18,
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
              Stack(
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      children: <Widget>[
                        _buildImageCarousel('lib/images/CasaSuchiapa.jpg', 'Villaflores'),
                        _buildImageCarousel('lib/images/CasaVillaflores.jpg', 'Suchiapa'),
                        _buildImageCarousel('lib/images/CasaTuxtla.jpg', 'Tuxtla'),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 100,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 100,
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    width: _currentPage == index ? 12.0 : 8.0,
                    height: _currentPage == index ? 12.0 : 8.0,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.black : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10.0),
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
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: <Widget>[
                    _buildRecommendation("Casa villaflores - muy buena", 'lib/images/user1.png', 5),
                    _buildRecommendation("Depto Suchiapa - Excelente", 'lib/images/user2.png', 4),
                    _buildRecommendation("Casa Suchiapa - Buena casa", 'lib/images/user3.png', 3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel(String imagePath, String location) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(imagePath, fit: BoxFit.cover, width: 300),
        ),
        const SizedBox(height: 5),
        Text(
          location,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Icon(
              index < 5 ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 16.0,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildRecommendation(String text, String userImagePath, int rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(userImagePath),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      size: 16.0,
                      color: Colors.amber,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}