class History {
  final String tipeKategori;
  final String Nama;
  final String NoTelp;
  final int Nominal;
  final String TanggalTransaksi;

  History(
      {required this.tipeKategori,
      required this.Nama,
      required this.NoTelp,
      required this.Nominal,
      required this.TanggalTransaksi});

  Map<String, dynamic> toJson() {
    return {
      "Kategori": tipeKategori,
      "Nama": Nama,
      "NoTelp": NoTelp,
      "Nominal": Nominal,
      "TanggalTransaksi": TanggalTransaksi
    };
  }

  factory History.fromJason(Map<String, dynamic> json) {
    return History(
        tipeKategori: json['Kategori'],
        Nama: json['Nama'],
        NoTelp: json['NoTelp'],
        Nominal: json['Nominal'],
        TanggalTransaksi: json['TanggalTransaksi']);
  }
}
