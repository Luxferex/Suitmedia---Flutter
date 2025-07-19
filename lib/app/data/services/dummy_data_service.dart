import '../models/user_model.dart';

class DummyDataService {
  static const Map<String, dynamic> _dummyResponse = {
    "page": 1,
    "per_page": 10,
    "total": 12,
    "total_pages": 2,
    "data": [
      {
        "id": 1,
        "email": "george.bluth@reqres.in",
        "first_name": "George",
        "last_name": "Bluth",
        "avatar": "https://reqres.in/img/faces/1-image.jpg"
      },
      {
        "id": 2,
        "email": "janet.weaver@reqres.in",
        "first_name": "Janet",
        "last_name": "Weaver",
        "avatar": "https://reqres.in/img/faces/2-image.jpg"
      },
      {
        "id": 3,
        "email": "emma.wong@reqres.in",
        "first_name": "Emma",
        "last_name": "Wong",
        "avatar": "https://reqres.in/img/faces/3-image.jpg"
      },
      {
        "id": 4,
        "email": "eve.holt@reqres.in",
        "first_name": "Eve",
        "last_name": "Holt",
        "avatar": "https://reqres.in/img/faces/4-image.jpg"
      },
      {
        "id": 5,
        "email": "charles.morris@reqres.in",
        "first_name": "Charles",
        "last_name": "Morris",
        "avatar": "https://reqres.in/img/faces/5-image.jpg"
      },
      {
        "id": 6,
        "email": "tracey.ramos@reqres.in",
        "first_name": "Tracey",
        "last_name": "Ramos",
        "avatar": "https://reqres.in/img/faces/6-image.jpg"
      },
      {
        "id": 7,
        "email": "michael.lawson@reqres.in",
        "first_name": "Michael",
        "last_name": "Lawson",
        "avatar": "https://reqres.in/img/faces/7-image.jpg"
      },
      {
        "id": 8,
        "email": "lindsay.ferguson@reqres.in",
        "first_name": "Lindsay",
        "last_name": "Ferguson",
        "avatar": "https://reqres.in/img/faces/8-image.jpg"
      },
      {
        "id": 9,
        "email": "tobias.funke@reqres.in",
        "first_name": "Tobias",
        "last_name": "Funke",
        "avatar": "https://reqres.in/img/faces/9-image.jpg"
      },
      {
        "id": 10,
        "email": "byron.fields@reqres.in",
        "first_name": "Byron",
        "last_name": "Fields",
        "avatar": "https://reqres.in/img/faces/10-image.jpg"
      }
    ]
  };

  static Future<List<User>> getUsers({int page = 1, int perPage = 10}) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    final List<dynamic> userData = _dummyResponse['data'] as List<dynamic>;
    return userData.map((json) => User.fromJson(json)).toList();
  }

  static Future<List<User>> getMoreUsers({int page = 2}) async {
    // Simulate loading more data (page 2)
    await Future.delayed(const Duration(milliseconds: 500));
    
    // For demo purposes, return 2 more users for page 2
    if (page == 2) {
      return [
        User(
          id: 11,
          email: "john.doe@reqres.in",
          firstName: "John",
          lastName: "Doe",
          avatar: "https://reqres.in/img/faces/11-image.jpg",
        ),
        User(
          id: 12,
          email: "jane.smith@reqres.in",
          firstName: "Jane",
          lastName: "Smith",
          avatar: "https://reqres.in/img/faces/12-image.jpg",
        ),
      ];
    }
    
    return [];
  }
}