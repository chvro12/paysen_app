import '../config/app_enums.dart';

abstract class CommonApiResponse {
  final bool isSuccess;
  final String message;
  final UserType? userType;

  CommonApiResponse(this.isSuccess, this.message, {this.userType});
}