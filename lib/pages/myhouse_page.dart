import 'package:flutter/material.dart';

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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(76, 81, 230, 1),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Agregar propiedad'),
                    ),
                  ),
                SizedBox(height: 20),
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
                        fontWeight: FontWeight.bold
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
      endDrawer: Drawer(
        child: Container(
          color: Color(0xFF8487EE),
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF8487EE),
                ),
                accountName:
                    Text('Nombre', style: TextStyle(color: Colors.white)),
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
                  },
                  child: Text('Cerrar sesión',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Color.fromRGBO(236, 236, 236, 1),
              child: Column(
                children: [
                  Align(
                    child: Row(
                      children: [
                        Image.asset("lib/images/casa1.png", width: 200,),
                        Column(
                            children: [
                            Text('Descripcion breve'),
                            Text('# '),
                            Text('3av sur villaflores'),
                            ],
                          ),
                        SizedBox(width: 25,),
                        Image.asset("lib/images/PuntosNavegacion.png")
                      ],
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              color: Color.fromRGBO(236, 236, 236, 1),
              child: Column(
                children: [
                  Align(
                    child: Row(
                      children: [
                        Image.asset("lib/images/casa2.png", width: 200,),
                        Column(
                            children: [
                            Text('Descripcion breve'),
                            Text('#'),
                            Text('3av sur villaflores'),
                            ],
                          ),
                        SizedBox(width: 25,),
                        Image.asset("lib/images/PuntosNavegacion.png")
                      ],
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              color: Color.fromRGBO(236, 236, 236, 1),
              child: Column(
                children: [
                  Align(
                    child: Row(
                      children: [
                        Image.asset("lib/images/casa1.png", width: 200,),
                      Column(
                            children: [
                            Text('Descripcion breve'),
                            Text('# '),
                            Text('3av sur villaflores'),
                            ],
                          ),
                        SizedBox(width: 25,),
                        Image.asset("lib/images/PuntosNavegacion.png")
                      ],
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
