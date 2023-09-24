enum Gender { male, female, none }

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
  
}