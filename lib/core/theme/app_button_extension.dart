// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class AppButtonExtension extends ThemeExtension<AppButtonExtension> {
  final ButtonDecoration cardButton;
  final ButtonDecoration primaryButton;
  final ButtonDecoration secondaryButton;
  final ButtonDecoration outlineButton;
  final ButtonDecoration textButton;
  final ButtonDecoration buyButton;
  final ButtonDecoration sellButton;
  AppButtonExtension({
    required this.cardButton,
    required this.primaryButton,
    required this.secondaryButton,
    required this.outlineButton,
    required this.textButton,
    required this.buyButton,
    required this.sellButton,
  });

  @override
  ThemeExtension<AppButtonExtension> copyWith({
    ButtonDecoration? cardButton,
    ButtonDecoration? primaryButton,
    ButtonDecoration? secondaryButton,
    ButtonDecoration? outlineButton,
    ButtonDecoration? textButton,
    ButtonDecoration? buyButton,
    ButtonDecoration? sellButton,
  }) {
    return AppButtonExtension(
      cardButton: cardButton ?? this.cardButton,
      primaryButton: primaryButton ?? this.primaryButton,
      secondaryButton: secondaryButton ?? this.secondaryButton,
      outlineButton: outlineButton ?? this.outlineButton,
      textButton: textButton ?? this.textButton,
      buyButton: buyButton ?? this.buyButton,
      sellButton: sellButton ?? this.sellButton,
    );
  }

  @override
  ThemeExtension<AppButtonExtension> lerp(
      covariant ThemeExtension<AppButtonExtension>? other, double t) {
    if (other is! AppButtonExtension) {
      return this;
    }

    return AppButtonExtension(
      cardButton: ButtonDecoration.lerp(cardButton, other.cardButton, t)!,
      primaryButton:
          ButtonDecoration.lerp(primaryButton, other.primaryButton, t)!,
      secondaryButton:
          ButtonDecoration.lerp(secondaryButton, other.secondaryButton, t)!,
      outlineButton:
          ButtonDecoration.lerp(outlineButton, other.outlineButton, t)!,
      textButton: ButtonDecoration.lerp(textButton, other.textButton, t)!,
      buyButton: ButtonDecoration.lerp(buyButton, other.buyButton, t)!,
      sellButton: ButtonDecoration.lerp(sellButton, other.sellButton, t)!,
    );
  }
}
