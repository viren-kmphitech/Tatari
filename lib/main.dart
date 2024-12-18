import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tatari/app/routes/app_pages.dart';
import 'package:tatari/app/routes/app_routes.dart';
import 'package:tatari/app/utils/constants/app_colors.dart';
import 'package:tatari/app/utils/helpers/extensions/extensions.dart';
import 'package:tatari/app/utils/helpers/injectable/injectable.dart';
import 'package:tatari/app/utils/helpers/logger.dart';
import 'package:tatari/app/utils/themes/app_theme.dart';

void main() {
  configuration(
    myApp: const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      getPages: AppPages.routes,
      scrollBehavior: CustomScrollBehavior(),
      initialRoute: AppRoutes.splash,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(getIt<SharedPreferences>().getAppLocal ?? 'en'),

      ///Default Theme
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
    );
  }

  @override
  void initState() {
    _preCacheAssets();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.black,
        statusBarColor: AppColors.transparent,
      ),
    );
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(systemNavigationBarColor: AppColors.appBlack, statusBarColor: AppColors.transparent),
    // );
    super.initState();
  }

  Future<void> _preCacheAssets() async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final assets = manifest.listAssets();

    final listOfPng = assets.where((element) => element.endsWith('.png')).map((e) => precacheImage(AssetImage(e), context, onError: _onError));
    final listOfSvg = assets.where((element) => element.endsWith('.svg')).map(SvgAssetLoader.new);

    await Future.wait([
      ...listOfPng,
      ...listOfSvg.map((e) => e.loadBytes(context)),
    ]);

    if (mounted) {
      for (final e in listOfSvg) {
        e.cacheKey(context);
      }
    }
  }

  void _onError(Object exception, StackTrace? stackTrace) {
    if (kDebugMode) {
      exception.logWithName('precacheImageError');
    }
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}
