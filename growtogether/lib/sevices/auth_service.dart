import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:growtogether/models/user.dart';


//Uncomment when API is ready

// class AuthService {
//   final String baseUrl = "https://your-api.com/api"; // Change this

//   Future<BaseAppUser> login({
//     required String email,
//     required String password,
//   }) async {
//     final url = Uri.parse("$baseUrl/auth/login");

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "email": email,
//           "password": password,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         return BaseAppUser(
//           id: data["user"]["id"].toString(),
//           name: data["user"]["name"],
//           email: data["user"]["email"],
//         );
//       } else {
//         throw Exception(_extractError(response));
//       }
//     } catch (e) {
//       throw Exception("Network error: $e");
//     }
//   }

//   Future<String> register({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     final url = Uri.parse("$baseUrl/auth/register");

//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "name": name,
//           "email": email,
//           "password": password,
//         }),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return "Account created successfully!";
//       } else {
//         throw Exception(_extractError(response));
//       }
//     } catch (e) {
//       throw Exception("Network error: $e");
//     }
//   }


//   String _extractError(http.Response response) {
//     try {
//       final data = jsonDecode(response.body);
//       return data["message"] ?? "Something went wrong.";
//     } catch (_) {
//       return "Error ${response.statusCode}: ${response.reasonPhrase}";
//     }
//   }
// }

//comment when API is ready

class AuthService {
  Future<BaseAppUser> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(Duration(milliseconds: 600)); // simulate network
    return BaseAppUser(
      id: "123",
      name: "Test User",
      email: email,
    );
  }

  Future<String> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(Duration(milliseconds: 600));
    return "Account created successfully! (Mock)";
  }
}
