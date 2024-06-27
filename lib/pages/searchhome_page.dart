import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String searchTerm;

  SearchPage({required this.searchTerm});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _items = [
    {
      'categoria': 'Departamento',
      'descripcion': 'Descripcion breve\n#\n3avsur villaflores',
      'imagePath': 'lib/images/casa1.png',
    },
    {
      'categoria': 'Departamento',
      'descripcion': 'Descripcion breve\n#\n3avsur villaflores',
      'imagePath': 'lib/images/casa2.png',
    },
  ];
  List<Map<String, String>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(_items);
    _searchController.text = widget.searchTerm;
    _searchController.addListener(_filterItems);
    _filterItems(); 
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    setState(() {
      _filteredItems = _items
          .where((item) => item['descripcion']!
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4D6F9),
      appBar: AppBar(
        backgroundColor: Color(0xFF9DA0F1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'HOMING',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/info');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.searchTerm,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return buildItem(
                    context,
                    _filteredItems[index]['categoria']!,
                    _filteredItems[index]['descripcion']!,
                    _filteredItems[index]['imagePath']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, String categoria, String descripcion, String imagePath) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Categoria "$categoria"',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(descripcion),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // Implementa la acción de "Ver más"
              },
              child: Text('Ver más'),
            ),
          ],
        ),
      ),
    );
  }
}
