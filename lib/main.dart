import 'package:app_books/constant.dart';
import 'package:app_books/core/theme/cubit/app_theme_cubit.dart';
import 'package:app_books/core/theme/model/enum.dart';
import 'package:app_books/core/utils/assets.dart';
import 'package:app_books/features/home/data/repos/home_repo_impl.dart';
import 'package:app_books/features/home/presentation/manager/featured_books_cubits/featured_cubit.dart';
import 'package:app_books/features/home/presentation/manager/news_cubit/newest_cubit.dart';
import 'package:app_books/features/home/presentation/manager/similar_cubit/similar_cubit.dart';
import 'package:app_books/features/splash/presentation/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/utils/lacator_service.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocatorService();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppThemeCubit()..changeTheme(ThemeState.init),
          ),
          BlocProvider(
            create: (context) => NewestCubit(getIt.get<HomeRepoImpl>())..getNewestBook(),
          ),
          BlocProvider(
            create: (context) => FeaturedCubit(getIt.get<HomeRepoImpl>())..getFeatured(),
          ),  BlocProvider(
            create: (context) => SimilarCubit(getIt.get<HomeRepoImpl>())..getSimilar(),
          ),
        ],
        child: GetMaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          builder: DevicePreview.appBuilder,
          locale: Locale('en'),
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: mainColor),
          home: SplashScreen(

          ),
        ));
  }
}
