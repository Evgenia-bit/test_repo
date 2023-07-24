import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/screens/auth/auth_view_model.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: const Text('VK'),
        ),
      ),
      body: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Вход ВКонтакте',
              style: TextStyle(fontSize: 21, color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'Введите телефон или почту, которые привязаны к аккаунту',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40),
            _FormWidget(),
          ],
        ),
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _LoginTextFieldWidget(),
        _ErrorMessageWidget(),
        _SaveLoginWidget(),
        SizedBox(height: 30),
        _NextButtonWidget(),
        SizedBox(height: 30),
        Text(
          'Нажимая «Продолжить», вы принимаете пользовательское соглашение и политику конфиденциальности',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}

class _LoginTextFieldWidget extends StatelessWidget {
  const _LoginTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select((AuthViewModel model) => model.state.errorMessage);
    final changeLogin = context.read<AuthViewModel>().changeLogin;
    return TextField(
      decoration: InputDecoration(
        hintText: 'Телефон и почта',
        filled: true,
        fillColor: errorMessage != null
            ? Colors.red.withOpacity(0.1)
            : Colors.grey.withOpacity(0.1),
        border: const OutlineInputBorder(),
      ),
      onChanged: changeLogin,
    );
  }
}

class _SaveLoginWidget extends StatelessWidget {
  const _SaveLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final saveLogin = context.select((AuthViewModel model) => model.state.saveLogin);
    final changeSaveLogin = context.read<AuthViewModel>().changeSaveLogin;
    return Row(
      children: [
        Checkbox(
          value: saveLogin,
          onChanged: changeSaveLogin,
        ),
        const Text('Сохранить вход'),
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.grey.withOpacity(0.5),
            child: const Icon(
              Icons.question_mark,
              size: 15,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select((AuthViewModel model) => model.state.errorMessage);
    if (errorMessage == null) return const SizedBox.shrink();
    return Text(
      errorMessage,
      style: const TextStyle(color: Colors.red),
    );
  }
}

class _NextButtonWidget extends StatelessWidget {
  const _NextButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authButtonState = context.select((AuthViewModel model) => model.state.authButtonState);
final auth = context.read<AuthViewModel>().auth;
    final Widget child;
    if (authButtonState == AuthButtonState.authProcess) {
      child = const CircularProgressIndicator();
    } else {
      child = const Text(
        'Продолжить',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      );
    }
    return TextButton(
      onPressed: authButtonState == AuthButtonState.canSubmit
          ? () => auth(context)
          : null,
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 50),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.blue.withOpacity(0.5);
            } else {
              return Colors.blue;
            }
          },
        ),
      ),
      child: child,
    );
  }
}
