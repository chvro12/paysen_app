abstract class CommonApiResponse {
  final bool isSuccess;
  final String message;
  final String? userType;

  CommonApiResponse(this.isSuccess, this.message, {this.userType});
}