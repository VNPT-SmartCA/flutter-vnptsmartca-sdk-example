import 'package:flutter/material.dart';
import '../../../../configs/app_config.dart';
import '../../../../gen/assets.gen.dart';

class ServicePackAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ServicePackAppBar({
    Key? key,
    required this.onCallback,this.title
  }) : super(key: key);
  final VoidCallback onCallback;
  final String? title;

  final String _imgHeaderBg = 'assets/images/header_background_img.png';

  @override
  PreferredSizeWidget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 18
    );
    return AppBar(
      centerTitle: true,
      title: Text(
        title!,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
      flexibleSpace: Image(
        image: AssetImage(_imgHeaderBg, package: AppConfig.package),
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.transparent,
      leading: InkWell(
        onTap: () {
          onCallback.call();
        },
        child: Container(
          width: 56,
          height: 56,
          alignment: Alignment.center,
          child: Assets.images.arrowLeft.image(
            width: 24,
            height: 24,
            fit: BoxFit.fill,
            color: Colors.white
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
