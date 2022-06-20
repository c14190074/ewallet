class User {
  final String alamat;
  final String email;
  final String nama;
  final String norek;
  final String notelp;
  final int uang;
  final String passcode;

  User(
      {required this.alamat,
      required this.email,
      required this.nama,
      required this.norek,
      required this.notelp,
      required this.uang,
      required this.passcode});

  Map<String, dynamic> toJson() {
    return {
      "Alamat": alamat,
      "Email": email,
      "Nama": nama,
      "NoRekening": norek,
      "Notelp": notelp,
      "Uang": uang,
      "passcode": passcode
    };
  }

  factory User.fromJason(Map<String, dynamic> json) {
    return User(
        alamat: json['Alamat'],
        email: json['Email'],
        nama: json['Nama'],
        norek: json['NoRekening'],
        notelp: json['Notelp'],
        uang: json['Uang'],
        passcode: json['passcode']);
  }
}
