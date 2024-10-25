import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New user'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 500,
              ),
              RegisterForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.username;
    final email = registerCubit.state.email;
    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'User name',
          onChanged: registerCubit.userNameChanged,
          errorMessage: username.errorMessage,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Email',
          onChanged: registerCubit.emailChanged,
          errorMessage: email.errorMessage,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Password',
          onChanged: registerCubit.passwordChanged,
          errorMessage: password.errorMessage,
          obscureText: true,
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Create user')),
      ],
    ));
  }
}
