import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Warna {
  /* static var BG = Color(0xFFf4f1e1); */
  static var BG = Color(0xFFE9EEFF);
  /* static var BG = Color(0xFFFFFFFF); */
  static var Primary = Color(0xFFD0A175);
  static var PrimaryDark = Color(0xFFAD8764);
  static var PrimaryHalf = Color.fromARGB(255, 215, 183, 153);
  static var Secondary = Color(0xFFF1C27D);
  static var TextBold = Color(0xFF3c2f2a);
  static var TextNormal = Color(0xFF333333);
  static var Success = Color(0xFF198754);
  static var SuccessHalf = Color.fromARGB(135, 25, 135, 84);
}

formatRupiah(double nominal) {
  double value = nominal;

  // Create a NumberFormat instance for currency formatting in Indonesian Rupiah
  NumberFormat rupiahFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0, // Display as whole numbers
  );

  String formattedValue = rupiahFormat.format(value);
  return formattedValue;
}

Future<Uint8List> loadImageAsUint8List(String imagePath) async {
  final ByteData data = await rootBundle.load(imagePath);
  return data.buffer.asUint8List();
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll('.', ''); // Hapus titik lama
    String formattedText = _formatWithThousandsSeparator(newText);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatWithThousandsSeparator(String value) {
    if (value.isEmpty) return '';
    final buffer = StringBuffer();
    int length = value.length;
    for (int i = 0; i < length; i++) {
      if ((length - i) % 3 == 0 && i != 0) {
        buffer.write('.'); // Tambahkan titik sebelum 3 digit berikutnya
      }
      buffer.write(value[i]);
    }
    return buffer.toString();
  }
}
