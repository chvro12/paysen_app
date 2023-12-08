import 'package:intl/intl.dart';

enum UserType { newUser, oldUser }

enum Gender { male, female, none }

enum TransactionType { debit, credit }

enum TransactionFilter { all, today, yesterday, thisMonth, custom  }

extension ServerUTCDate on String? {
  DateTime? get stringUtcToDateTime {
    if (this == null) return null;
    final String value = DateTime.tryParse(this!)!.toString();
    return DateFormat('yyyy-MM-dd HH:mm').parse(value);
  }

  DateTime? tryParseWithDateFormat(String parseFormat) {
    if (this == null) return null;
    return DateFormat(parseFormat).parse(this!);
  }

  String? parseWithDateFormat(String parseFormat, String returnFormat) {
    if (this == null) return null;
    final val = DateFormat(parseFormat).parse(this!);
    return DateFormat(returnFormat).format(val);
  }
}


extension ServerEpochTimestamp on int {
  DateTime get epochToDateTime {
    return DateTime.fromMillisecondsSinceEpoch(this * 1000);
  }
}

extension ReadableDate on DateTime {
  String humanReadableFormat(String format) {
    return DateFormat(format).format(this);
  }
}

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

extension ServerKeyFromTransactionFilter on TransactionFilter {
  
  String get serverKeyFromFilter {
    switch(this) {
      
      case TransactionFilter.all:
        return 'all';

      case TransactionFilter.today:
        return 'today';

      case TransactionFilter.yesterday:
        return 'yesterday';
      
      case TransactionFilter.thisMonth:
        return 'this_month';
      
      case TransactionFilter.custom:
        return 'custom';
        
      default:
        return 'None';    
    }
  }

  String get readableFromFilter {
    switch(this) {
      case TransactionFilter.today:
        return 'Today';

      case TransactionFilter.yesterday:
        return 'Yesterday';
      
      case TransactionFilter.thisMonth:
        return 'This month';
      
      case TransactionFilter.custom:
        return 'Custom';
        
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

  TransactionType get stringToTransactionType {
    switch(this) {
      case 'CREDIT':
        return TransactionType.credit;

      case 'DEBIT':
        return TransactionType.debit;

      default:
        throw Exception('Invalid value $this of enum type TransactionType');  
    }
  }
}