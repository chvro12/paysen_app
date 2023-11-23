// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../config/app_enums.dart';
import 'card_detail_models.dart';
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
  String? emailOtp;

  final String apiToken;
  final String activity;
  final Gender gender;
  final int isActive;
  final String lang;
  final String fcmToken;
  final String city;
  final String? platform;
  final String? device;
  final String? planId;
  final String? planExpiredDate;
  final String? companyName;
  final String? emailVerify;
  final DropdownModels? cityDetails;
  final String? planDetails;
  final CardDetailModel? cardDetail;
  
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
    this.otp,
    required this.city,
    this.platform,
    this.device,
    this.planId,
    this.emailOtp,
    this.planExpiredDate,
    this.companyName,
    this.emailVerify,
    this.cityDetails,
    this.planDetails,
    this.cardDetail
  });


  factory UserModels.fromOtp(Map<String, dynamic> data) {
    UserModels userModels = UserModels.fromJson(data);
    userModels = userModels.copyWith(
      otp: data['otp'],
      emailOtp: data['email_otp'],
      cardDetail: CardDetailModel.fromJson(data['card_details'])
    );
    return userModels;
  }

  factory UserModels.fromJson(Map<String, dynamic> data) {
    return UserModels(
      id: data['id'], 
      firstName: data['first_name'], 
      lastName: data['last_name'],
      email: data['email'],
      emailVerifiedAt: data['email_verified_at'],
      avatar: data['avatar'], 
      countryCode: data['country_code'],
      phone: data['phone'],
      otp: data['otp'],
      emailOtp: data['email_otp'],
      apiToken: data['api_token'], 
      city: data['city'].toString(),
      activity: data['activity'], 
      gender: (data['gender'] as String).stringToGender, 
      isActive: data['is_active'], 
      lang: data['lang'], 
      fcmToken: data['fcm_token'], 
      platform: data['platform'],
      device: data['device'],
      planId: data['plan_id'],
      planExpiredDate: data['plan_expired_date'],
      companyName: data['company_name'],
      emailVerify: data['email_verify'],
      cityDetails: data['city_details'] is Map<String, dynamic>
      ? DropdownModels.fromJson(data['city_details'])
      : null,
      planDetails: data['plan_details'],
      cardDetail: data.containsKey('card_details')
      ? CardDetailModel.fromJson(data['card_details'])
      : null
    );
  }

  Map<String, dynamic> toSecondJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'avatar': avatar,
      'country_code': countryCode,
      'phone': phone,
      'otp': otp,
      'email_otp': emailOtp,
      'api_token': apiToken,
      'city': city,
      'activity': activity,
      'gender': gender.enumToString,
      'is_active': isActive,
      'lang': lang,
      'fcm_token': fcmToken,
      'platform': platform,
      'device': device,
      'plan_id': planId,
      'plan_expired_date': planExpiredDate,
      'company_name': companyName,
      'email_verify': emailVerify,
      'city_details': cityDetails?.toJson(),
      'plan_details': planDetails
    };
  }

  Map<String, String> toJson(DropdownModels dropdownModels) {
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
    String? emailOtp,
    String? apiToken,
    String? activity,
    Gender? gender,
    int? isActive,
    String? lang,
    String? fcmToken,
    String? city,
    String? platform,
    String? device,
    String? planId,
    String? planExpiredDate,
    String? companyName,
    String? emailVerify,
    DropdownModels? cityDetails,
    String? planDetails,
    CardDetailModel? cardDetail,
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
      emailOtp: emailOtp ?? this.emailOtp,
      apiToken: apiToken ?? this.apiToken,
      activity: activity ?? this.activity,
      gender: gender ?? this.gender,
      isActive: isActive ?? this.isActive,
      lang: lang ?? this.lang,
      fcmToken: fcmToken ?? this.fcmToken,
      city: city ?? this.city,
      platform: platform ?? this.platform,
      device: device ?? this.device,
      planId: planId ?? this.planId,
      planExpiredDate: planExpiredDate ?? this.planExpiredDate,
      companyName: companyName ?? this.companyName,
      emailVerify: emailVerify ?? this.emailVerify,
      cityDetails: cityDetails ?? this.cityDetails,
      planDetails: planDetails ?? this.planDetails,
      cardDetail: cardDetail ?? this.cardDetail,
    );
  }

  @override
  String toString() {
    return 'UserModels(id: $id, firstName: $firstName, lastName: $lastName, email: $email, emailVerifiedAt: $emailVerifiedAt, avatar: $avatar, countryCode: $countryCode, phone: $phone, otp: $otp, emailOtp: $emailOtp, apiToken: $apiToken, activity: $activity, gender: $gender, isActive: $isActive, lang: $lang, fcmToken: $fcmToken, city: $city, platform: $platform, device: $device, planId: $planId, planExpiredDate: $planExpiredDate, companyName: $companyName, emailVerify: $emailVerify, cityDetails: $cityDetails, planDetails: $planDetails, cardDetail: $cardDetail)';
  }
}
