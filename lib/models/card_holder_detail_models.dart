import '../config/app_enums.dart';
import '../config/app_logger.dart';

class CardHolderDetailModels {
  final CardHolderAddressDetail? cardHolderAddressDetail;
  final String? cardholderId;
  final DateTime? createdAt;
  final String? emailAddress;
  final String? firstName;
  final CardIdentityDetail? cardIdentityDetail;
  final bool? isActive;
  final bool? isIdVerified;
  final String? issuingAppId;
  final String? lastName;
  final String? phone;

  CardHolderDetailModels({this.cardHolderAddressDetail, this.cardIdentityDetail, this.cardholderId,
  this.createdAt, this.emailAddress, this.firstName, this.isActive, 
  this.isIdVerified, this.issuingAppId, this.lastName, this.phone});

  factory CardHolderDetailModels.fromJson(Map<String, dynamic> data) {
    return CardHolderDetailModels(
      cardHolderAddressDetail: data.containsKey('address')
      ? CardHolderAddressDetail.fromJson(data['address'])
      : null,
      cardIdentityDetail: data.containsKey('identity_details')
      ? CardIdentityDetail.fromJson(data['identity_details'])
      : null,
      cardholderId: data['cardholder_id'],
      createdAt: (data['created_at'] as int).epochToDateTime,
      emailAddress: data['email_address'],
      firstName: data['first_name'],
      isActive: data['is_active'],
      isIdVerified: data['is_id_verified'],
      issuingAppId: data['issuing_app_id'],
      lastName: data['last_name'],
      phone: data['phone']
    );
  }
}

class CardHolderAddressDetail {
  final String? address;
  final String? city;
  final String? country;
  final String? houseMo;
  final String? postalCode;
  final String? state;

  CardHolderAddressDetail({this.address, this.city, this.country,
  this.houseMo, this.postalCode, this.state});

  factory CardHolderAddressDetail.fromJson(Map<String, dynamic> data) {
    return CardHolderAddressDetail(
      address: data['address'],
      city: data['city'],
      country: data['country'],
      houseMo: data['house_no'],
      postalCode: data['postal_code'],
      state: data['state']
    );
  }
}

class CardIdentityDetail {
  final bool blacklisted;
  final DateTime? dateOfBirth;
  final String firstName;
  final Gender gender;
  final String idNo;
  final String idType;
  final String lastName;
  final String phone;

  CardIdentityDetail({required this.blacklisted, required this.dateOfBirth, required this.firstName,
  required this.gender, required this.idNo, required this.idType, 
  required this.lastName, required this.phone});

  factory CardIdentityDetail.fromJson(Map<String, dynamic> data) {
    DateTime? dob;
    try {
      if (data.containsKey('date_of_birth')) {
        String tempDOB = data['date_of_birth'];
        if (tempDOB.trim().isNotEmpty) {
          dob = tempDOB.tryParseWithDateFormat('yyyy-MM-dd');
        }
      }
    } catch (e) {
      AppLogger.e('exception: $e', e);
    }

    if (dob == null) {
      try {
        if (data.containsKey('date_of_birth')) {
          String tempDOB = data['date_of_birth'];
          if (tempDOB.trim().isNotEmpty) {
            dob = tempDOB.tryParseWithDateFormat('yyyy/MM/dd');
          }
        }
      } catch (e) {
        AppLogger.e('exception: $e', e);
      }
    }
    return CardIdentityDetail(
      blacklisted: data['blacklisted'],
      dateOfBirth: dob,
      firstName: data['first_name'],
      gender: (data['gender'] as String).stringToGender,
      idNo: data['id_no'],
      idType: data['id_type'],
      lastName: data['last_name'],
      phone: data['phone']
    );
  }
}