class RequestModel {
  final String id;
  final String userId;
  final String ownerId;
  final String title;
  final String description;
  final String price;
  final String userName;
  final String repoetFromUser;
  final List<String> images;
  final String requestState;
  final String requestId;
  RequestModel(
      {required this.id,
      required this.userId,
      required this.ownerId,
      required this.title,
      required this.description,
      required this.price,
      required this.images,
      required this.userName,
      required this.repoetFromUser,
      required this.requestState,
      required this.requestId
      });
  factory RequestModel.fromJson(dynamic json) {
    return RequestModel(
      id: json['id'],
      userId: json['renter_id'],
      ownerId: json['owner_id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      images: List<String>.from(json['images']["urls"]),
      userName: json['user_name'],
      repoetFromUser: json['report'],
      requestState: json['status'],
      requestId: json['request_id']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'renter_id': userId,
      'owner_id': ownerId,
      'title': title,
      'description': description,
      'price': price,
      'images': {'urls': images},
      'user_name': userName,
      'report': repoetFromUser,
      'status': requestState,
      'request_id': requestId
    };
  }
}
