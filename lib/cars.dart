class Cars {
  String make;
  String model;
  String primaryPhotoUrl;
  String price;

  Cars({
    required this.make,
    required this.model,
    required this.primaryPhotoUrl,
    required this.price,
  });

  @override
  String toString() {
    return 'Cars(name: $make, model: $model , url: $primaryPhotoUrl , price: $price)';
  }

  factory Cars.fromJson(Map<String, dynamic> json) {
    return Cars(
      make: json['make'],
      model: json['model'],
      primaryPhotoUrl: json['primaryPhotoUrl'],
      price: json['price'],
    );
  }
}
