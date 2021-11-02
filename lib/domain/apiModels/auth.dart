class Auth {
    Auth({
        required this.accessToken,
        required this.tokenType,
        required this.expiresIn,
    });

    String accessToken;
    String tokenType;
    int expiresIn;

    factory Auth.fromJson(Map<String, dynamic> json) => Auth(
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
