import 'package:app_books/core/theme/model/enum.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());
  changeTheme (ThemeState state) async
  {
    SharedPreferences pref = await SharedPreferences.getInstance();
    switch (state)
        {
          case ThemeState.init:
            if (pref.get('theme') != null)
              {
                if (pref.get('theme') == 'dark')
                  emit(AppThemeDark());
                else
                  emit(AppThemeLight());
              }
              break;
          case ThemeState.Dark:
            emit(AppThemeDark());
            pref.setString('theme', 'dark');

            break;
       case ThemeState.Light:
        emit(AppThemeLight());
        pref.setString('theme', 'light');
        }
  }

}
