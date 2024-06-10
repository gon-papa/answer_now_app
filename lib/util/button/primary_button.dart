import 'package:answer_now_app/importer.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const PrimaryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        minimumSize: Size(double.infinity, 40.h),
        maximumSize: Size(double.infinity, 40.h),
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
