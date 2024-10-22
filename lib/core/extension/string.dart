import 'package:intl/intl.dart';
import 'package:sr_ui/core/core.dart';

extension DoubleX on double {
  double get wi {
    if (this.sp < this) {
      return this;
    }
    return this.sp;
  }
}

extension Numx on num {
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: sp);
  EdgeInsets get all => EdgeInsets.all(sp);
}

extension StringExt on String {
  String get currency =>
      NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0, name: "")
          .format(num.tryParse(this) ?? '');
}

class Format {
  static String formatPortofolio({
    required double lot,
    required double avgPrice,
  }) {
    return formatDot(value: "$lot", title: "Lot", separator: "-") +
        " • " +
        formatDot(
            value: "Rp " + "$avgPrice".currency, title: "Avg", separator: "-");
  }

  static String formatDot({
    required String value,
    required String title,
    required String separator,
  }) {
    return "$title $separator " + "$value";
  }
}
