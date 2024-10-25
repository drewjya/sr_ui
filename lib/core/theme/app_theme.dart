import 'package:shared_preferences/shared_preferences.dart';
import 'package:sr_ui/core/core.dart';

extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColor =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  AppTextExtension get appText =>
      extension<AppTextExtension>() ?? AppTheme._lightAppText;

  AppButtonExtension get appButton =>
      extension<AppButtonExtension>() ?? AppTheme._buttonExtension;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
  AppColorsExtension get color => theme.appColor;
  AppTextExtension get text => theme.appText;
  AppButtonExtension get button => theme.appButton;
  AppTheme get appTheme => ThemeProvider.of(this);
  ThemeMode get themeMode => ThemeProvider.of(this).themeMode;
}

class ThemeProvider extends InheritedNotifier<AppTheme> {
  const ThemeProvider({required super.child, super.notifier, super.key});

  static AppTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!.notifier!;
}

class AppTheme with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void init(SharedPreferences pref) {
    final themeMode = pref.getString("sr_theme_mode");
    if (themeMode == null) {
      return;
    }
    if (themeMode == "light_mode") {
      _themeMode = ThemeMode.light;
      notifyListeners();
      return;
    }
    if (themeMode == "dark_mode") {
      _themeMode = ThemeMode.dark;
      notifyListeners();
      return;
    }
    if (themeMode == 'system_mode') {
      _themeMode = ThemeMode.system;
      notifyListeners();
      return;
    }
    return;
  }

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  static final _lightAppText = AppTextExtension(
    title: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: "Manrope",
    ),
    subtitle: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.grey,
      fontFamily: "Manrope",
    ),
    price: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.success,
      fontFamily: "Manrope",
    ),
  );
  static final _darkAppText = AppTextExtension(
    title: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: "Manrope",
    ),
    subtitle: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.grey,
      fontFamily: "Manrope",
    ),
    price: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.success,
      fontFamily: "Manrope",
    ),
  );

  static final _lightAppColors = AppColorsExtension(
    primaryButton: AppColor.primaryButton,
    primary: AppColor.primary,
    cardBackground: AppColor.backgroundCard,
    textPrimary: Colors.white,
    divider: AppColor.divider,
    grey: AppColor.grey,
    textCard: Colors.white,
    chipFill: AppColor.chipFillDark,
    error: AppColor.error,
    background: AppColor.background,
    card: AppColor.card,
    srIcon: AppColor.srIconDark,
    textFieldColor: AppColor.textFieldColor,
  );

  static final _darkAppColors = AppColorsExtension(
    primaryButton: AppColor.primaryButton,
    primary: AppColor.primary,
    textPrimary: Colors.white,
    cardBackground: AppColor.backgroundCard,
    divider: AppColor.divider,
    grey: AppColor.grey,
    textCard: Colors.white,
    chipFill: AppColor.chipFillDark,
    error: AppColor.error,
    background: AppColor.background,
    card: AppColor.card,
    srIcon: AppColor.srIconDark,
    textFieldColor: AppColor.textFieldColor,
  );

  static final _buttonExtension = AppButtonExtension(
    cardButton: ButtonDecoration(
      backgroundColor: AppColor.card,
      borderRadius: BorderRadius.circular(20),
      padding: 10.all,
      splashColor: AppColor.backgroundRipple,
      highlightColor: AppColor.backgroundRipple,
    ),
    buyButton: ButtonDecoration(
      backgroundColor: AppColor.primary,
      borderRadius: BorderRadius.circular(20),
      padding: 10.all,
      splashColor: AppColor.backgroundRipple,
      highlightColor: AppColor.backgroundRipple,
    ),
    outlineButton: ButtonDecoration(
      backgroundColor: AppColor.primary,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: AppColor.borderTextField,
        width: 2.sp,
      ),
      padding: 10.all,
      splashColor: AppColor.backgroundRipple,
      highlightColor: AppColor.backgroundRipple,
    ),
    primaryButton: ButtonDecoration(
      backgroundColor: AppColor.primary,
      borderRadius: BorderRadius.circular(20),
      padding: 10.all,
      splashColor: AppColor.backgroundRipple,
      highlightColor: AppColor.backgroundRipple,
    ),
    secondaryButton: ButtonDecoration(
      backgroundColor: AppColor.background,
      borderRadius: BorderRadius.circular(20),
      padding: 10.all,
      splashColor: AppColor.backgroundRipple,
      highlightColor: AppColor.backgroundRipple,
    ),
    sellButton: ButtonDecoration(
      backgroundColor: AppColor.primary,
      borderRadius: BorderRadius.circular(20),
      padding: 10.all,
      splashColor: AppColor.backgroundRipple,
      highlightColor: AppColor.backgroundRipple,
    ),
    textButton: ButtonDecoration(
      backgroundColor: AppColor.primary,
      borderRadius: BorderRadius.circular(20),
      padding: 10.all,
      splashColor: AppColor.backgroundRipple,
      highlightColor: AppColor.backgroundRipple,
    ),
  );

  static final light = ThemeData.light(useMaterial3: true).copyWith(
    extensions: [
      _lightAppColors,
      _lightAppText,
      _buttonExtension,
    ],
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    switchTheme: SwitchThemeData(
      // inactiveTrackColor: AppColor.divider,
      // activeTrackColor: AppColor.primary,

      thumbColor: WidgetStatePropertyAll(Colors.white),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      fillColor: WidgetStatePropertyAll(AppColor.primary),
      side: BorderSide(
        width: 1.w,
        color: Colors.white,
      ),
    ),
    cardColor: AppColor.background,
    splashColor: AppColor.backgroundRipple,
    highlightColor: AppColor.backgroundRipple,
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: AppColor.background,
      tilePadding: EdgeInsets.all(0),
      iconColor: Colors.white,
      childrenPadding: EdgeInsets.all(0),
      collapsedBackgroundColor: AppColor.background,
    ),
    textTheme: const TextTheme().apply(
      bodyColor: Colors.white,
      fontFamily: 'Manrope',
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: AppColor.primary,
          width: 3.sp,
        ),
      ),
      labelPadding: EdgeInsets.symmetric(vertical: 10),
      labelStyle: TextStyle(
        color: Colors.white,
        fontFamily: "Manrope",
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColor.grey,
        fontSize: 16.sp,
        fontFamily: "Manrope",
        fontWeight: FontWeight.w500,
      ),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: MenuItemButton.styleFrom(
        foregroundColor: Colors.white,
        padding: EdgeInsets.all(0),
        iconColor: Colors.white,
      ),
    ),
    menuTheme: MenuThemeData(
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(AppColor.background),
        elevation: WidgetStatePropertyAll(0),
        padding: WidgetStatePropertyAll(
          EdgeInsets.only(bottom: 0),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        disabledForegroundColor: Colors.white60,
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          fontFamily: "Manrope",
          color: Colors.white,
        ),
        fixedSize: Size(
          double.infinity,
          50,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColor.background,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: AppColor.primary,
          width: 2.sp,
        ),
        fixedSize: Size(double.infinity, 50),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          fontFamily: "Manrope",
          color: Colors.white,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        iconColor: Colors.white,
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          fontFamily: "Manrope",
          color: Colors.white,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.textFieldColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColor.borderTextField,
          width: 2.sp,
        ),
      ),
      hintStyle: TextStyle(
        color: AppColor.grey,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
      prefixIconColor: AppColor.grey,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColor.borderTextField,
          width: 2.sp,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColor.primary,
        ),
      ),
    ),
  );
  static final dark = ThemeData.dark(useMaterial3: true).copyWith(
    extensions: [
      _darkAppColors,
      _darkAppText,
      _buttonExtension,
    ],
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    splashColor: AppColor.backgroundRipple,
    highlightColor: AppColor.backgroundRipple,
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: AppColor.background,
      tilePadding: EdgeInsets.all(0),
      iconColor: Colors.white,
      childrenPadding: EdgeInsets.only(bottom: 15.sp),
      collapsedBackgroundColor: AppColor.background,
    ),
    textTheme: const TextTheme().apply(
      bodyColor: Colors.white,
      fontFamily: 'Manrope',
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: AppColor.primary,
          width: 3.sp,
        ),
      ),
      labelPadding: EdgeInsets.symmetric(vertical: 10),
      labelStyle: TextStyle(
        color: Colors.white,
        fontFamily: "Manrope",
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColor.grey,
        fontSize: 16.sp,
        fontFamily: "Manrope",
        fontWeight: FontWeight.w500,
      ),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: MenuItemButton.styleFrom(
        foregroundColor: Colors.white,
        padding: EdgeInsets.all(0),
        iconColor: Colors.white,
      ),
    ),
    menuTheme: MenuThemeData(
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(AppColor.background),
        elevation: WidgetStatePropertyAll(0),
        padding: WidgetStatePropertyAll(
          EdgeInsets.only(bottom: 0),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        disabledForegroundColor: Colors.white60,
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          fontFamily: "Manrope",
          color: Colors.white,
        ),
        fixedSize: Size(
          double.infinity,
          50,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColor.background,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: AppColor.primary,
          width: 2.sp,
        ),
        fixedSize: Size(double.infinity, 50),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          fontFamily: "Manrope",
          color: Colors.white,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        iconColor: Colors.white,
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          fontFamily: "Manrope",
          color: Colors.white,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.textFieldColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColor.borderTextField,
          width: 2.sp,
        ),
      ),
      hintStyle: TextStyle(
        color: AppColor.grey,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
      prefixIconColor: AppColor.grey,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColor.borderTextField,
          width: 2.sp,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppColor.primary,
        ),
      ),
    ),
  );
}
