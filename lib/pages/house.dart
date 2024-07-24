import 'dart:typed_data';


class House {
  final String id;
  final String description;
  final String street;
  final String state;
  final String municipality;
  final String price;
  final String status;
  final Uint8List? imageData;

  House({
    required this.id,
    required this.description,
    required this.street,
    required this.state,
    required this.municipality,
    required this.price,
    required this.status,
    this.imageData,
  });

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json['_id'] ?? 'unknown',
      description: json['description'] ?? '',
      street: json['street'] ?? '',
      state: json['state'] ?? '',
      municipality: json['municipality'] ?? '',
      price: json['price'] ?? '',
      status: json['status'] ?? '',
      imageData: json['image'] != null 
          ? Uint8List.fromList(List<int>.from(json['image']['data']['data']))
          : null,
    );
  }
}
