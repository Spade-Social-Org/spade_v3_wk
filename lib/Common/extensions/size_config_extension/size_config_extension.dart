import '../../size_config/size_config.dart';

extension Resolution on num {
  double height() => (this / kDesignHeight) * kScreenHeight;

  double width() => (this / kDesignWidth) * kScreenWidth;
}
