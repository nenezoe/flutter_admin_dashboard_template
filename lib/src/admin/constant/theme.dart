import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/provider/fontBloc/font_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bool robotaFamily = false;

class ThemeClass {
  static ThemeData themeData(
    bool isDarkTheme,
    BuildContext context,
  ) {
    isDark = isDarkTheme;
    return ThemeData(
      useMaterial3: true,
      fontFamily: context.read<FontBloc>().state.fontFamily,
      applyElevationOverlayColor: false,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      colorSchemeSeed: ColorConst.primary,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor:
            isDarkTheme ? ColorConst.scaffoldDark : ColorConst.drawerBG,
      ),
      scaffoldBackgroundColor:
          isDarkTheme ? ColorConst.scaffoldDark : ColorConst.drawerBG,
      cardTheme: CardTheme.of(context).copyWith(
        margin: EdgeInsets.zero,
        color: isDarkTheme ? ColorConst.cardDark : Colors.white,
        surfaceTintColor: isDarkTheme ? ColorConst.cardDark : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 10.0,
        shadowColor: isDarkTheme
            ? Colors.transparent
            : Colors.grey.shade50.withOpacity(0.25),
      ),
      checkboxTheme: const CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      // dropdownMenuTheme: const DropdownMenuThemeData(
      //   inputDecorationTheme: InputDecorationTheme(
      //     enabledBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.red)
      //     )
      //   )
      // )
    );
  }
}

bool isDark = false;
