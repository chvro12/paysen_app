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
    'resend': 'Resend',
    'signup_header': 'Create your account',
    'signup_description': 'Fill in the information to complete the creation of your profile',
    'signup_profile_description': 'Add your photo to keep it personal',
    'signup_group1': 'FULL NAME & EMAIL',
    'first_name': 'First Name',
    'first_name_as_your_id': 'First Name as your ID',
    'last_name': 'Last Name',
    'last_name_as_your_id': 'Last Name as your ID',
    'email': 'Email',
    'email_example': 'example@gmail.com',
    'signup_group2': 'OTHER INFO',
    'activity': 'Activity',
    'activity_as_your_id': 'Activity as your ID',
    'register': 'Register',
    'gender': 'Gender',
    'male': 'Male',
    'female': 'Female',
    'ok': 'Okay',
    'please_wait': 'Please wait ...',
    'otp_mismatch_description': "Oops! It seems the OTP you entered doesn't match. Please verify the code and try again. If the issue persists, request a new OTP.",
    'city': 'City',
    'select_city': 'Select city',
    'select_gender': 'Select gender',
    'wallet': 'Wallet',
    'cards': 'Cards',
    'support': 'Support',
    'account': 'Account',
    'credit_card': 'Credit Card',
    'withdrawal': 'Withdrawal',
    'topup': 'Topup',
    'transactions': 'Transactions',
    'view_all_history': 'View All History',
    'this_month': 'This month',
    'create_a_virtual_card': 'Create a virtual card',
    'create_activate_physical_card': 'Create/activate physical card',
    'support_title': 'Hello',
    'support_description': 'We simplify online payments for individuals and businesses. Do you have any questions?',
    'access_chat': 'Access chat',
    'premium': 'Premium',
    'active': 'Active',
    'profile_details': 'Profile details',
    'change_plan': 'Change Plan',
    'select_language': 'Select Language',
    'change_passcode': 'Change pass-code',
    'invite_friends': 'Invite friends',
    'verification_status': 'Verification status',
    'merchant_details': 'Merchant details',
    'request_crypto_account': 'Request crypto account',
    'terms_and_conditions': 'Terms and conditions',
    'logout': 'Logout',
    'withdrawal_methods': 'Withdrawal methods',
    'mobile_money_withdrawal': 'Mobile money withdrawal',
    'distributor_withdrawal': 'Distributor withdrawal',
    'money_withdraw': 'Money withdraw',
    'change': 'Change',
    'paysen_fees': 'PaySen fees',
    'operator_fees': 'Operator fees',
    'withdraw': 'Withdraw',
    'retailer_withdrawal': 'Retailer withdrawal',
    'scan_qr_code': 'Scan QR Code',
    'scan_qr_code_description': 'Point the camera at the code to proceed with the payment',
    'scan': 'Scan',
    'payment_methods': 'Payment methods',
    'mobile_money_bank_card': 'Mobile money / bank card',
    'coupons': 'Coupons',
    'final_amount': 'Final Amount',
    'add_money': 'Add money',
    'send': 'Send',
    'no_fee': 'No fee',
    'enter_coupon_code': 'Enter coupon code',
    'coupon_hint': 'e.g. 1F4562NT',
    'validate': 'Validate',
    'get_a_voucher': 'Get a voucher',
    'buy_a_voucher': 'Buy a voucher',
    'transaction_history': 'Transaction history',
    'today': 'Today',
    'yesterday': 'Yesterday',
    'custom': 'Custom',
    'no_transactions_title': 'No transactions yet',
    'no_transactions_description': 'After your first transaction you will be able to view it here',
    'transaction_details': 'Transaction details',
    'status': 'Status',
    'recipient': 'Recipient',
    'operator_id': 'Operator ID',
    'converted_amount': 'Converted amount',
    'order_details': 'Order details',
    'automatic': 'automatic',
    'securely_via_paysen': 'Securely via PaySen',
    'share': 'Share',
    'service_not_available': 'Service not available',
    'settings': 'Settings',
    'permission_error_title': 'Error',
    'permission_error_description': "To use this feature, we need your permission. Please go to your phone's settings, find our app, and turn on the necessary permission",
    'image_option': 'Image Options',
    'capture_from_camera': 'Capture from camera',
    'pick_from_gallery': 'Pick from gallery',
    'first_name_empty_message': 'First name should not be empty',
    'last_name_empty_message': 'Last name should not be empty',
    'email_empty_message': 'Email should not be empty',
    'activity_empty_message': 'Activity should not be empty',
    'gender_not_selected': 'Please select gender',
    'city_not_selected': 'Please select city',
    'profile_image_not_captured': 'Compulsory to have profile image.',
    'virtual_card_in_dollars': 'Virtual card in dollars',
    'validity': 'Validity',
    'price': 'Price',
    'transaction_fee': 'Transaction fee',
    'transaction_limit': 'Transaction limit',
    'generate_card': 'Generate card',
    'virtual_card': 'Virtual Card',
    'card_holder': 'Card Holder',
    'expire': 'Expire',
    'physical_card': 'Physical card',
    'order_a_card': 'Order a card',
    'physical_card_description': "Before PaySen can issue your card, you may need to provide additional identity information, such as government ID/ or proof of residence, if this is required we'll let you know by email",
    'activate_card': 'Activate card',
    'save': 'Save',
    'mobile_no_empty_message': 'Mobile No should not be empty',
    'amount_empty_message': 'Amount should not be empty',
    'proceed': 'Proceed',
    'delivery_options': 'Delivery options',
    'delivery_options_description': 'Please choose the option which suits you better',
    'self_pick_up': 'Self pick up',
    'get_delivered': 'Get delivered',
    'get_delivered_description': 'Please fill this form so we will be able to send this card to you',
    'full_name': 'Full name',
    'signup_group3': 'SHIPPING & CONTACTS',
    'city_town': 'City Town',
    'street': 'Street',
    'street_number': 'Street number',
    'country': 'Country',
    'select_country': 'Select Country',
    'paysen_physical_card': 'PAYSEN PHYSICAL CARD',
    'debit_card_fee': 'Debit Card Fee',
    'get_delivered_terms_and_conditions_initial': 'I agree to the PaySen ',
    'get_delivered_terms_and_conditions_mid': 'Terms and Conditions ',
    'get_delivered_terms_and_conditions_end': 'and PaySen Card',
    'order_now': 'Order now',
    'new_order_success_title': 'Thank you for ordering',
    'new_order_success_description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
    'go_back': 'Go back',
    'service_unavailable_title': 'Service Pause',
    'service_unavailable_description': 'Service temporarily unavailable for a short update. Thank you for your understanding',
    'amount_greater_message': 'Amount should be greater than 100 XOF',
    'amount_lesser_message': 'Amount should be less than 1500000 XOF',
    'orange_money': 'Orange money',
    'wave': 'Wave',
    'change_plan2': 'Change plan',
    'subscribe': 'Subscribe'
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
    'resend': '',
    'signup_header': '',
    'signup_description': '',
    'signup_profile_description': '',
    'signup_group1': '',
    'first_name': '',
    'first_name_as_your_id': '',
    'last_name': 'Last Name',
    'last_name_as_your_id': '',
    'email': '',
    'email_example': '',
    'signup_group2': '',
    'ok': '',
    'please_wait': '',
    'otp_mismatch_description': "",
    'city': '',
    'select_city': '',
    'select_gender': '',
    'wallet': '',
    'cards': '',
    'support': '',
    'account': '',
    'credit_card': '',
    'withdrawal': '',
    'topup': '',
    'create_a_virtual_card': '',
    'create_activate_physical_card': '',
    'support_title': '',
    'support_description': '',
    'access_chat': '',
    'premium': '',
    'active': '',
    'profile_details': '',
    'change_plan': '',
    'select_language': '',
    'change_passcode': '',
    'invite_friends': '',
    'verification_status': '',
    'merchant_details': '',
    'request_crypto_account': '',
    'terms_and_conditions': '',
    'logout': '',
    'withdrawal_methods': '',
    'mobile_money_withdrawal': '',
    'distributor_withdrawal': '',
    'money_withdraw': '',
    'change': '',
    'paysen_fees': '',
    'operator_fees': '',
    'withdraw': '',
    'retailer_withdrawal': '',
    'scan_qr_code': '',
    'scan_qr_code_description': '',
    'scan': '',
    'payment_methods': '',
    'mobile_money_bank_card': '',
    'coupons': '',
    'final_amount': '',
    'add_money': '',
    'send': '',
    'no_fee': '',
    'enter_coupon_code': '',
    'coupon_hint': '',
    'validate': '',
    'get_a_voucher': '',
    'buy_a_voucher': '',
    'transaction_history': '',
    'today': '',
    'yesterday': '',
    'custom': '',
    'no_transactions_title': '',
    'no_transactions_description': '',
    'transaction_details': '',
    'status': '',
    'recipient': '',
    'operator_id': '',
    'converted_amount': '',
    'order_details': '',
    'automatic': '',
    'securely_via_paysen': '',
    'share': '',
    'service_not_available': '',
    'settings': '',
    'permission_error_title': '',
    'permission_error_description': '',
    'image_option': '',
    'capture_from_camera': '',
    'pick_from_gallery': '',
    'first_name_empty_message': '',
    'last_name_empty_message': '',
    'email_empty_message': '',
    'activity_empty_message': '',
    'gender_not_selected': '',
    'city_not_selected': '',
    'profile_image_not_captured': '',
    'virtual_card_in_dollars': '',
    'validity': '',
    'price': '',
    'transaction_fee': '',
    'transaction_limit': '',
    'generate_card': '',
    'virtual_card': '',
    'card_holder': '',
    'expire': '',
    'physical_card': '',
    'order_a_card': '',
    'physical_card_description': "",
    'activate_card': '',
    'save': '',
    'proceed': '',
    'delivery_options': '',
    'delivery_options_description': '',
    'self_pick_up': '',
    'get_delivered': '',
    'signup_group3': '',
    'country': '',
    'select_country': '',
    'paysen_physical_card': '',
    'debit_card_fee': '',
    'get_delivered_terms_and_conditions_initial': '',
    'get_delivered_terms_and_conditions_mid': '',
    'get_delivered_terms_and_conditions_end': '',
    'order_now': '',
    'new_order_success_title': '',
    'new_order_success_description': '',
    'go_back': '',
    'orange_money': '',
    'wave': ''
  };
}