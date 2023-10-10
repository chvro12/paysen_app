enum UserType { newUser, oldUser }

enum Gender { male, female, none }

extension EnumToString on Enum {

  String get enumToString {
    switch(this) {
      case Gender.male:
        return 'Male';

      case Gender.female:
        return 'Female';

      default:
        return 'None';    
    }
  }

}

extension StringToEnum on String {

  Gender get stringToGender {
    switch(this) {
      case 'Male':
      case 'male':
        return Gender.male;

      case 'Female':
      case 'female':
        return Gender.female;

      default:
        return Gender.none;
    }
  }
  
  UserType get stringToUserType {
    switch(this) {
      case 'new':
        return UserType.newUser;

      case 'old':
        return UserType.oldUser;

      default:
        throw Exception('Invalid value $this of enum type UserType');
    }
  }
}