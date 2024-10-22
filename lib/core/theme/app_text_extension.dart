// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class AppTextExtension extends ThemeExtension<AppTextExtension> {
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle price;

  AppTextExtension({
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  ThemeExtension<AppTextExtension> copyWith({
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? price,
  }) {
    return AppTextExtension(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
    );
  }

  @override
  ThemeExtension<AppTextExtension> lerp(
      covariant ThemeExtension<AppTextExtension>? other, double t) {
    if (other is! AppTextExtension) {
      return this;
    }

    return AppTextExtension(
      title: TextStyle.lerp(title, other.title, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      price: TextStyle.lerp(price, other.price, t)!,
    );
  }
}
