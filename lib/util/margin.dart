import 'package:answer_now_app/importer.dart';

class VerticalMargin extends StatelessWidget {
  const VerticalMargin({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

class HorizontalMargin extends StatelessWidget {
  const HorizontalMargin({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.h,
    );
  }
}
