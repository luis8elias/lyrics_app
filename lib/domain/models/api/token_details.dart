import 'dart:convert';

TokenDetiails tokenDetiailsFromJson(String str) => TokenDetiails.fromJson(json.decode(str));

String tokenDetiailsToJson(TokenDetiails data) => json.encode(data.toJson());

class TokenDetiails {
    TokenDetiails({
      required  this.accessToken,
      required  this.tokenType,
      required  this.expiresIn,
    });

    String accessToken;
    String tokenType;
    int expiresIn;

    factory TokenDetiails.fromJson(Map<String, dynamic> json) => TokenDetiails(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
    };
}
