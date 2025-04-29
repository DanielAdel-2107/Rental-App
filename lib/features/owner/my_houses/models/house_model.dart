class HouseModel {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String? moreData;
  final String bedrooms;
  final String bathrooms;
  final String area;
  final String latitude;
  final String longitude;
  final String price;
  final List<String> image;
  final String ownerName;
  final int request;
  final double? distance;
  final String category ;
  HouseModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    this.moreData,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.image,
    required this.ownerName,
    required this.request,
    this.distance,
    required this.category
  });
  factory HouseModel.fromJson(dynamic json) {
    return HouseModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['house_name'],
      description: json['house_description'],
      moreData: json['more_data'],
      bathrooms: json['number_of_bathroom'],
      bedrooms: json['number_of_bedroom'],
      area: json['area'],
      latitude: json['latitude'],
      longitude: json['longtude'],
      price: json['price'],
      image: json['images'] is Map<String, dynamic> &&
              json['images']['urls'] is List
          ? List<String>.from(json['images']['urls'] as List)
          : [],
      ownerName: json['user_name'],
      request: json['request'],
      category: json['category'],
    );
  }
  HouseModel copyWith({double? distance}) {
    return HouseModel(
      id: id,
      userId: userId,
      title: title,
      description: description,
      moreData: moreData,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      area: area,
      latitude: latitude,
      longitude: longitude,
      price: price,
      image: image,
      ownerName: ownerName,
      request: request,
      distance: distance,
      category: category,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'house_name': title,
      'house_description': description,
      'more_data': moreData,
      'number_of_bathroom': bathrooms,
      'number_of_bedroom': bedrooms,
      'area': area,
      'latitude': latitude,
      'longtude': longitude,
      'price': price,
      'images': {'urls': image},
      'user_name': ownerName,
      'request': request,
      'distance': distance,
      'category': category,
    };
  }
}
