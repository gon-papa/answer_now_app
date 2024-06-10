import 'package:answer_now_app/importer.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpValidation {
  MultiValidator emailValidator(context) {
    return MultiValidator([
      RequiredValidator(errorText: '入力してください'),
      MaxLengthValidator(100, errorText: '100文字以内で入力してください'),
      EmailValidator(errorText: 'メールアドレスの形式が正しくありません'),
    ]);
  }

  MultiValidator passwordValidator(BuildContext context) {
    return MultiValidator([
      RequiredValidator(errorText: '入力してください'),
      MinLengthValidator(8, errorText: '8文字以上で入力してください'),
      PatternValidator(r'(?=.*[A-Z])(?=.*\d)',
          errorText: '大文字1文字以上、数字1文字以上を含む必要があります'),
    ]);
  }
}

final signUpValidation = Provider((ref) => SignUpValidation());
