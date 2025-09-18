//TokenResponse
class TokenResponse {
  String status;
  int code;
  List<TokenData> data;

  TokenResponse({required this.status, required this.code, required this.data});
  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    List dataList = json['data'];
    List<TokenData> tokenDataList =
        dataList.map((item) => TokenData.fromJson(item)).toList();

    return TokenResponse(
      status: json['status'],
      code: json['code'],
      data: tokenDataList,
    );
  }
}

//Token
class TokenData {
  String token;
  TokenData({required this.token});
  factory TokenData.fromJson(Map<String, dynamic> json) => TokenData(
        token: json['Token'],
      );
}

//UserResponse
class UserResponse {
  String status;
  int code;
  List<User> data;

  UserResponse({required this.status, required this.code, required this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<User> userDataList =
        dataList.map((item) => User.fromJson(item)).toList();

    return UserResponse(
      status: json['status'],
      code: json['code'],
      data: userDataList,
    );
  }
}

class User {
  final String userid;
  final String passwd;
  final String name;
  final String email;
  final String departemen;
  final String peranan;

  User({
    required this.userid,
    required this.passwd,
    required this.name,
    required this.email,
    required this.departemen,
    required this.peranan,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userid: json['userid'],
        passwd: json['passwd'],
        name: json['name'],
        email: json['email'],
        departemen: json['departemen'],
        peranan: json['peranan'],
      );
}
