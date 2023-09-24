import '../config/app_enums.dart';

class UserModels {

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String emailVerifiedAt;
  final String avatar;
  final String countryCode;
  final String phone;

  /// TEMPORARY VARIABLE
  String? otp;

  final String apiToken;
  final String activity;
  final Gender gender;
  final int isActive;
  final String lang;
  final String fcmToken;

  UserModels({required this.activity, required this.apiToken, required this.avatar, required this.countryCode,
  required this.email, required this.emailVerifiedAt, required this.fcmToken, required this.firstName,
  required this.gender, required this.id, required this.isActive, required this.lang,
  required this.lastName, this.otp, required this.phone});

  factory UserModels.fromOtp(Map<String, dynamic> data) {
    final UserModels userModels = UserModels.fromJson(data);
    userModels.otp = data['otp'];
    return userModels;
  }

  factory UserModels.fromJson(Map<String, dynamic> data) {
    return UserModels(
      activity: data['activity'], 
      apiToken: data['api_token'],
      avatar: data['avatar'], 
      countryCode: data['country_code'], 
      email: data['email'], 
      emailVerifiedAt: data['email_verified_at'], 
      fcmToken: data['fcm_token'], 
      firstName: data['first_name'], 
      gender: (data['gender'] as String).stringToGender, 
      id: data['id'], 
      isActive: data['is_active'], 
      lang: data['lang'], 
      lastName: data['last_name'], 
      phone: data['phone'],
    );
  }
}