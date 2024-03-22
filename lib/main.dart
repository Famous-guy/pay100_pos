// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pay100_pos/api/connectpos.dart';
import 'package:pay100_pos/currencies.dart';
import 'package:pay100_pos/onboarding_screen/splash_screen.dart';
import 'package:pay100_pos/provider/auth.dart';
import 'package:pay100_pos/provider/connectposprovider.dart';
import 'package:pay100_pos/test.dart';
import 'package:flutter_launcher_icons/abs/icon_generator.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/config/config.dart';
// import 'package:flutter_launcher_icons/config/config.g.dart';
import 'package:flutter_launcher_icons/config/macos_config.dart';
// import 'package:flutter_launcher_icons/config/macos_config.g.dart';
import 'package:flutter_launcher_icons/config/web_config.dart';
// import 'package:flutter_launcher_icons/config/web_config.g.dart';
import 'package:flutter_launcher_icons/config/windows_config.dart';
// import 'package:flutter_launcher_icons/config/windows_config.g.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/logger.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_generator.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_template.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/pubspec_parser.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/web/web_icon_generator.dart';
import 'package:flutter_launcher_icons/web/web_template.dart';
import 'package:flutter_launcher_icons/windows/windows_icon_generator.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  // Fetch API key from local storage
  await getUserDataFromPrefs();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDataProvider()),
        // Add other providers if needed
      ],
      child: Pay100Shop(),
    ),
  );

  UserData userData = await getUserDataFromPrefs(); // Retrieve user data
  String? currency = userData.currency;

  // Check if currency is in currencies map
  if (currencies.containsKey(currency)) {
    String currencySymbol = currencies[currency]!;
    print('Currency symbol for $currency is $currencySymbol');
  } else {
    print('Currency $currency not found in the map');
  }
}

Future<UserData> getUserDataFromPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String publicKey = prefs.getString('publicKey') ?? '';
  String email = prefs.getString('email') ?? '';
  String phone = prefs.getString('phone') ?? '';
  String accountName = prefs.getString('accountName') ?? '';
  String currency = prefs.getString('currency') ?? '';
  String accountId = prefs.getString('accountId') ?? '';

  return UserData(
    publicKey: publicKey,
    email: email,
    phone: phone,
    accountName: accountName,
    currency: currency,
    accountId: accountId,
  );
}

// Map<String, String> currencies = {
//   'AED': 'د.إ',
//   'AFN': '؋',
//   'ALL': 'L',
//   'AMD': '֏',
//   'ANG': 'ƒ',
//   'AOA': 'Kz',
//   'ARS': '\$',
//   'AUD': '\$',
//   'AWG': 'ƒ',
//   'AZN': '₼',
//   'BAM': 'KM',
//   'BBD': '\$',
//   'BDT': '৳',
//   'BGN': 'лв',
//   'BHD': 'ب.د',
//   'BIF': 'FBu',
//   'BMD': '\$',
//   'BND': '\$',
//   'BOB': 'Bs.',
//   'BRL': 'R\$',
//   'BSD': '\$',
//   'BTN': 'Nu.',
//   'BWP': 'P',
//   'BYN': 'Br',
//   'BZD': '\$',
//   'CAD': '\$',
//   'CDF': 'FC',
//   'CHF': 'CHF',
//   'CLP': '\$',
//   'CNY': '¥',
//   'COP': '\$',
//   'CRC': '₡',
//   'CUP': '\$',
//   'CVE': '\$',
//   'CZK': 'Kč',
//   'DJF': 'Fdj',
//   'DKK': 'kr',
//   'DOP': '\$',
//   'DZD': 'دج',
//   'EGP': '£',
//   'ERN': 'Nfk',
//   'ETB': 'Br',
//   'EUR': '€',
//   'FJD': '\$',
//   'FKP': '£',
//   'FOK': 'kr',
//   'GBP': '£',
//   'GEL': '₾',
//   'GGP': '£',
//   'GHS': '₵',
//   'GIP': '£',
//   'GMD': 'D',
//   'GNF': 'FG',
//   'GTQ': 'Q',
//   'GYD': '\$',
//   'HKD': '\$',
//   'HNL': 'L',
//   'HRK': 'kn',
//   'HTG': 'G',
//   'HUF': 'Ft',
//   'IDR': 'Rp',
//   'ILS': '₪',
//   'IMP': '£',
//   'INR': '₹',
//   'IQD': 'ع.د',
//   'IRR': '﷼',
//   'ISK': 'kr',
//   'JEP': '£',
//   'JMD': '\$',
//   'JOD': 'د.ا',
//   'JPY': '¥',
//   'KES': 'KSh',
//   'KGS': 'с',
//   'KHR': '៛',
//   'KID': '\$',
//   'KMF': 'CF',
//   'KRW': '₩',
//   'KWD': 'د.ك',
//   'KYD': '\$',
//   'KZT': '₸',
//   'LAK': '₭',
//   'LBP': 'ل.ل',
//   'LKR': 'රු',
//   'LRD': '\$',
//   'LSL': 'M',
//   'LYD': 'ل.د',
//   'MAD': 'د.م.',
//   'MDL': 'L',
//   'MGA': 'Ar',
//   'MKD': 'ден',
//   'MMK': 'K',
//   'MNT': '₮',
//   'MOP': 'MOP\$',
//   'MRU': 'UM',
//   'MUR': '₨',
//   'MVR': 'ރ.',
//   'MWK': 'MK',
//   'MXN': '\$',
//   'MYR': 'RM',
//   'MZN': 'MT',
//   'NAD': '\$',
//   'NGN': '₦',
//   'NIO': 'C\$',
//   'NOK': 'kr',
//   'NPR': '₨',
//   'NZD': '\$',
//   'OMR': 'ر.ع.',
//   'PAB': 'B/.',
//   'PEN': 'S/.',
//   'PGK': 'K',
//   'PHP': '₱',
//   'PKR': '₨',
//   'PLN': 'zł',
//   'PYG': '₲',
//   'QAR': 'ر.ق',
//   'RON': 'lei',
//   'RSD': 'дин',
//   'RUB': '₽',
//   'RWF': 'RF',
//   'SAR': 'ر.س',
//   'SBD': '\$',
//   'SCR': '₨',
//   'SDG': 'ج.س.',
//   'SEK': 'kr',
//   'SGD': '\$',
//   'SHP': '£',
//   'SLL': 'Le',
//   'SOS': 'Sh',
//   'SRD': '\$',
//   'SSP': '£',
//   'STN': 'Db',
//   'SYP': '£',
//   'SZL': 'L',
//   'THB': '฿',
//   'TJS': 'ЅМ',
//   'TMT': 'T',
//   'TND': 'د.ت',
//   'TOP': 'T\$',
//   'TRY': '₺',
//   'TTD': '\$',
//   'TVD': '\$',
//   'TWD': 'NT\$',
//   'TZS': 'TSh',
//   'UAH': '₴',
//   'UGX': 'USh',
//   'USD': '\$',
//   'UYU': '\$U',
//   'UZS': 'лв',
//   'VES': 'Bs',
//   'VND': '₫',
//   'VUV': 'VT',
//   'WST': 'WS\$',
//   'XAF': 'FCFA',
//   'XCD': 'EC\$',
//   'XDR': 'SDR',
//   'XOF': 'CFA',
//   'XPF': '₣',
//   'YER': '﷼',
//   'ZAR': 'R',
//   'ZMW': 'ZK',
//   'ZWL': 'Z\$',
// };
// // Future<String?> fetchApiKeyFromLocalStorage() async {
// //   SharedPreferences prefs = await SharedPreferences.getInstance();
// //   return prefs.getString('apiKey');
// }

class Pay100Shop extends StatefulWidget {
  const Pay100Shop({super.key});

  @override
  State<Pay100Shop> createState() => _Pay100ShopState();
}

class _Pay100ShopState extends State<Pay100Shop> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoarding(),
      ),
    );
  }
}
