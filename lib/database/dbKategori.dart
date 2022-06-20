class Kategori {
  final String Nama;
  final String notelp;
  final int jumData;

  Kategori({required this.Nama, required this.jumData, required this.notelp});

  Map<String, dynamic> toJson() {
    return {"Nama": Nama, "jumData": jumData, "noTelp": notelp};
  }

  factory Kategori.fromJason(Map<String, dynamic> json) {
    return Kategori(Nama: json['Nama'], jumData: json['jumData'], notelp: json['noTelp']);
  }
}
