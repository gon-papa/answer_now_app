import 'package:answer_now_app/importer.dart';
import 'package:answer_now_app/page/sign_in/sign_in_provider.dart';
import 'package:answer_now_app/page/validation/sign_up_validation.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Form(
            key: ref.read(signInFormKeyProvider),
            child: const _Body(),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VerticalMargin(height: 10),
        _Title(),
        VerticalMargin(height: 10),
        _EmailTextField(),
        VerticalMargin(height: 10),
        _PasswordTextField(),
        VerticalMargin(height: 40),
        _SignInSubmitButton(),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Answer Now',
      style: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _EmailTextField extends ConsumerWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      onChanged: (value) {
        ref.watch(emailProvider.notifier).update(value);
      },
      decoration: const InputDecoration(
        labelText: 'メールアドレス',
      ),
      validator: ref.read(signUpValidation).emailValidator(context).call,
    );
  }
}

class _PasswordTextField extends ConsumerWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      onChanged: (value) {
        ref.watch(passwordProvider.notifier).update(value);
      },
      decoration: const InputDecoration(
        labelText: 'パスワード',
      ),
      validator: ref.read(signUpValidation).passwordValidator(context).call,
    );
  }
}

class _SignInSubmitButton extends ConsumerWidget {
  const _SignInSubmitButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      text: 'ログイン',
      onPressed: () {
        final formState = ref.read(signInFormKeyProvider).currentState;
        if (formState != null && formState.validate()) {
          // キャッシュ避けにreadを使用
          ref.read(signInProvider.future).then(
            (value) {
              const Home().go(context);
            },
            onError: (error, stackTrace) {
              ref.read(errorMessageHandle).call(error.toString(), context);
            },
          );
        }
      },
    );
  }
}
