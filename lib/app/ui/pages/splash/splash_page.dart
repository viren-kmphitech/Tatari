import 'package:tatari/app/ui/widgets/custom_image_view.dart';
import 'package:tatari/app/utils/helpers/exporter.dart';

import '../../../../gen/assets.gen.dart';
import '../../../controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: CustomImageView(
        imagePath: Assets.images.png.icSplash.path,
      ),
    );
  }

  @override
  void initState() {
    getIt<SplashController>().onSplash(context);
    super.initState();
  }
}
