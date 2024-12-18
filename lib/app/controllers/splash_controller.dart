import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart' as i;

import '../routes/app_routes.dart';

void _disposeSplashController(SplashController instance) {
  instance.dispose();
}

@i.LazySingleton(dispose: _disposeSplashController)
@i.injectable
class SplashController extends GetxController {
  Future<void> onSplash(BuildContext context) async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final assets = manifest.listAssets();

    final listOfPng = assets.where((element) => element.endsWith('.png')).map((e) => precacheImage(AssetImage(e), context, onError: _onError));
    final listOfSvg = assets.where((element) => element.endsWith('.svg')).map(SvgAssetLoader.new);

    await Future.wait([
      ...listOfPng,
      ...listOfSvg.map((e) => e.loadBytes(context)),
    ]);

    if (context.mounted) {
      for (final e in listOfSvg) {
        e.cacheKey(context);
      }
    }

    await Future.delayed(const Duration(seconds: 2));
    await Get.offAllNamed(AppRoutes.language);
  }

  @override
  @i.disposeMethod
  void dispose() {
    super.dispose();
  }

  void _onError(Object exception, StackTrace? stackTrace) {}
}
