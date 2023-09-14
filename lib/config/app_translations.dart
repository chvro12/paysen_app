import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  
  static const Locale enLocale = Locale('en', 'US');
  static const Locale frLocale = Locale('fr', 'SN');
  
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': englishTranslation,
    'fr-SN': frenchTranslation
  };

  Locale get locale => Get.deviceLocale ?? enLocale;
  
  Locale get fallbackLocale => enLocale;

}

Map<String, String> get englishTranslation {
  return {
    'paysen_for_individuals': 'PaySen for individuals!',
    'paysen_for_individuals_description': 'Discover the PaySen Card for your online purchases and much more',
    'paysen_for_business': 'PaySen for business!',
    'paysen_for_business_description': 'A tailored platform designed to receive payments from your customers online',
    'paysen_money_transfer': 'PaySen money transfer',
    'paysen_money_transfer_description': 'Send money to your loved ones in several african countries instantly',
    'get_started': 'Get started',
    'welcome': 'Welcome',
    'please_login_to_continue': 'Please login to continue',
    'login': 'Login',
    "don't_have_an_account": "Don't have an account? ",
    'signup': 'Signup',
    'otp_header': 'Confirm the code received by SMS',
    'otp_description': 'Please enter the 6-digit code that was sent to ',
    "didn't_you_receive_the_code": "Didn't you receive the code? ",
    'resend': 'Resend'
  };
}

Map<String, String> get frenchTranslation {
  return {
    'paysen_for_individuals': '',
    'paysen_for_individuals_description': '',
    'paysen_for_business': '',
    'paysen_for_business_description': '',
    'paysen_money_transfer': '',
    'paysen_money_transfer_description': '',
    'get_started': '',
    'welcome': '',
    'please_login_to_continue': '',
    'login': 'Login',
    "don't_have_an_account": "",
    'signup': '',
    'otp_header': '',
    'otp_description': '',
    "didn't_you_receive_the_code": "",
    'resend': ''
  };
}