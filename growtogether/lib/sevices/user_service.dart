import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = "https://api.growtogetherapp.com";

  final String token; // From AWS Cognito
  UserService({required this.token});

  Map<String, String> get _headers => {
    "Content-Type": "application/json",
    "Authorization": token,
  };

  Future<Map<String, dynamic>> getMyProfile() async {
    final res = await http.get(
      Uri.parse("$baseUrl/user/me"),
      headers: _headers,
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to load profile");
    }

    return jsonDecode(res.body);
  }

  Future<Map<String, dynamic>> getBuddyProfile() async {
    final res = await http.get(
      Uri.parse("$baseUrl/user/buddy"),
      headers: _headers,
    );

    if (res.statusCode != 200) {
      throw Exception("No buddy linked");
    }

    return jsonDecode(res.body);
  }

  Future<String> generateBuddyCode() async {
    final res = await http.post(
      Uri.parse("$baseUrl/buddy/generate"),
      headers: _headers,
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to generate code");
    }

    return jsonDecode(res.body)["code"];
  }

  Future<bool> linkBuddyCode(String code) async {
    final res = await http.post(
      Uri.parse("$baseUrl/buddy/link"),
      headers: _headers,
      body: jsonEncode({"code": code}),
    );

    return res.statusCode == 200;
  }

  Future<Map<String, dynamic>> randomBuddy() async {
    final res = await http.post(
      Uri.parse("$baseUrl/buddy/random"),
      headers: _headers,
    );

    if (res.statusCode != 200) {
      throw Exception("No buddy found");
    }

    return jsonDecode(res.body);
  }

  Future<bool> unlinkBuddy() async {
    final res = await http.delete(
      Uri.parse("$baseUrl/buddy/unlink"),
      headers: _headers,
    );

    return res.statusCode == 200;
  }

  Future<bool> updateProfile({
    String? name,
    String? course,
    String? avatarUrl,
  }) async {
    final res = await http.patch(
      Uri.parse("$baseUrl/user/update"),
      headers: _headers,
      body: jsonEncode({"name": name, "course": course, "avatar": avatarUrl}),
    );

    return res.statusCode == 200;
  }

  Future<int> getStreak() async {
    final res = await http.get(
      Uri.parse("$baseUrl/user/streak"),
      headers: _headers,
    );

    if (res.statusCode != 200) throw Exception("Failed to get streak");

    return jsonDecode(res.body)["streak"];
  }

  Future<double> getXP() async {
    final res = await http.get(
      Uri.parse("$baseUrl/user/xp"),
      headers: _headers,
    );

    if (res.statusCode != 200) throw Exception("Failed to load XP");

    return jsonDecode(res.body)["xp"] * 1.0;
  }

  Future<Map<String, dynamic>> getLatestAchievement() async {
    final res = await http.get(
      Uri.parse("$baseUrl/user/latestAchievement"),
      headers: _headers,
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to get latest achievement");
    }

    return jsonDecode(res.body);
  }
  
  Future<bool> sendPing() async {
  final res = await http.post(
    Uri.parse("$baseUrl/buddy/ping"),
    headers: _headers,
  );

  return res.statusCode == 200;
}
}


