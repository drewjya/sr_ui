import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.primary,
    required this.textPrimary,
    required this.divider,
    required this.textCard,
    required this.error,
    required this.background,
    required this.card,
    required this.cardBackground,
    required this.srIcon,
    required this.primaryButton,
    required this.grey,
    required this.chipFill,
    required this.textFieldColor,
  });

  final Color primary;
  final Color grey;
  final Color textPrimary;
  final Color divider;
  final Color textCard;
  final Color error;
  final Color srIcon;
  final Color background;
  final Color card;
  final Color cardBackground;
  final Color primaryButton;
  final Color chipFill;
  final Color textFieldColor;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primary,
    Color? chipFill,
    Color? textFieldColor,
    Color? textPrimary,
    Color? divider,
    Color? textCard,
    Color? error,
    Color? grey,
    Color? background,
    Color? card,
    Color? cardBackground,
    Color? srIcon,
    Color? primaryButton,
  }) {
    return AppColorsExtension(
      grey: grey ?? this.grey,
      cardBackground: cardBackground ?? this.cardBackground,
      chipFill: chipFill ?? this.chipFill,
      textFieldColor: textFieldColor ?? this.textFieldColor,
      primaryButton: primaryButton ?? this.primaryButton,
      primary: primary ?? this.primary,
      textPrimary: textPrimary ?? this.textPrimary,
      divider: divider ?? this.divider,
      textCard: textCard ?? this.textCard,
      error: error ?? this.error,
      background: background ?? this.background,
      card: card ?? this.card,
      srIcon: srIcon ?? this.srIcon,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      textFieldColor: Color.lerp(textFieldColor, other.textFieldColor, t)!,
      primaryButton: Color.lerp(primaryButton, other.primaryButton, t)!,
      chipFill: Color.lerp(chipFill, other.chipFill, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      textCard: Color.lerp(textCard, other.textCard, t)!,
      error: Color.lerp(error, other.error, t)!,
      background: Color.lerp(background, other.background, t)!,
      card: Color.lerp(card, other.card, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      srIcon: Color.lerp(srIcon, other.srIcon, t)!,
    );
  }
}

/// Optional. If you also want to assign colors in the `ColorScheme`.
extension ColorSchemeBuilder on AppColorsExtension {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: textPrimary,
      secondary: divider,
      onSecondary: textCard,
      error: error,
      onError: error,
      surface: background,
      onSurface: card,
    );
  }
}
