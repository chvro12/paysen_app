import '../config/app_enums.dart';
import 'dropdown_models.dart';

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
  
  UserModels({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.avatar,
    required this.countryCode,
    required this.phone,
    required this.apiToken,
    required this.activity,
    required this.gender,
    required this.isActive,
    required this.lang,
    required this.fcmToken,
    this.otp
  });


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

  Map<String, dynamic> toJson(DropdownModels dropdownModels) {
    return {
      'country_code': countryCode,
      'phone': phone,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'city': dropdownModels.id.toString(),
      'activity': activity,
      'gender': gender.enumToString,
    };
  }
  
  UserModels copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? emailVerifiedAt,
    String? avatar,
    String? countryCode,
    String? phone,
    String? otp,
    String? apiToken,
    String? activity,
    Gender? gender,
    int? isActive,
    String? lang,
    String? fcmToken    
  }) {
    return UserModels(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      avatar: avatar ?? this.avatar,
      countryCode: countryCode ?? this.countryCode,
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
      apiToken: apiToken ?? this.apiToken,
      activity: activity ?? this.activity,
      gender: gender ?? this.gender,
      isActive: isActive ?? this.isActive,
      lang: lang ?? this.lang,
      fcmToken: fcmToken ?? this.fcmToken
    );
  }
}