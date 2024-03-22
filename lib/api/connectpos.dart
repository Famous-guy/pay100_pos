// import 'dart:convert';

// import 'package:http/http.dart' as http;

// // class ConnectPOS = {
// //   Future connectPOS(String inviteCode){
// //     http.Respo
// //   }
// // }

// class ConnectPos {
//   Future connectPOS(String inviteCode) async {
//     var url = Uri.parse('https://api.100pay.co/api/v1/user/connect-pos');
//     var body = {"accountId": inviteCode};
//     var headers = {"Content-Type": "application/json"};
//     var res = await http.post(url, body: jsonEncode(body), headers: headers);

//     if (res.statusCode == 200) {
//       print(res.body);
//       var data = jsonDecode(res.body);
//       var publickey = data['publicKey'];
//       var email = data['email'];
//       var phone = data['phone'];
//       var account_name = data['account_name'];
//       var currency = data['currency'];
//       var accountId = data['accountId'];

//       print(publickey);
//       print(email);
//       print(phone);
//       print(account_name);
//       print(currency);
//       print(accountId);
//     } else {
//       print('the error is ${res.body}');
//     }
//   }
// }

class UserData {
  final String publicKey;
  final String email;
  final String phone;
  final String accountName;
  final String currency;
  final String accountId;

  UserData({
    required this.publicKey,
    required this.email,
    required this.phone,
    required this.accountName,
    required this.currency,
    required this.accountId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      publicKey: json['publicKey'],
      email: json['email'],
      phone: json['phone'],
      accountName: json['account_name'],
      currency: json['currency'],
      accountId: json['accountId'],
    );
  }
}
