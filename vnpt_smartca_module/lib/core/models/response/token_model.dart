import 'dart:convert';

class TokenModel {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final DateTime? expireTime;

  TokenModel(
      this.accessToken, this.refreshToken, this.expiresIn, this.expireTime);

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'expires_in': expiresIn,
      'expire_time': expireTime!.millisecondsSinceEpoch,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    final expireTime = map['expire_time'] != null
        ? DateTime.fromMillisecondsSinceEpoch(map['expire_time'] ?? "")
        : DateTime.now()
            .add(Duration(seconds: map['expires_in']?.toInt() ?? 0))
            .subtract(const Duration(seconds: 5));

    return TokenModel(
      map['access_token'] ?? '',
      map['refresh_token'] ?? '',
      map['expires_in']?.toInt() ?? 0,
      expireTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source));
}
