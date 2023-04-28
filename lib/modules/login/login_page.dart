import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../shared/constants/number_constants.dart';
import '../../shared/constants/strings_constants.dart';
import '../../shared/navigation/routes.dart';
import '../../shared/validator/validator.dart';
import 'controller/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginCubit controller;

  @override
  void initState() {
    super.initState();
    controller = BlocProvider.getBloc<LoginCubit>();
  }

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    final TextEditingController textEditingControllerUsername =
        TextEditingController();
    final TextEditingController textEditingControllerPassword =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text(StringConstants.login)),
      body: StreamBuilder(
        stream: controller.stream,
        builder: (context, state) {
          final currentState =state.data?.statusLogin ?? StatusLogin.initial;

          if(currentState == StatusLogin.success) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushNamedAndRemoveUntil(Routes.list, (route) => false);
            });
            return const Center(child: CircularProgressIndicator());
          }

          if(currentState == StatusLogin.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(NumberConstants.spaceAll16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: textEditingControllerUsername,
                    decoration: const InputDecoration(
                        labelText: StringConstants.username),
                    validator: Validator.validatorUsername,
                  ),
                  const SizedBox(height: NumberConstants.spaceVertical16),
                  TextFormField(
                    controller: textEditingControllerPassword,
                    decoration: const InputDecoration(
                        labelText: StringConstants.password),
                    obscureText: true,
                    validator: Validator.validatorPassword,
                  ),
                  const SizedBox(height: NumberConstants.spaceVertical24),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final password = textEditingControllerPassword.text;
                        final username = textEditingControllerUsername.text;
                        await controller.login(
                          username: username,
                          password: password,
                        );
                      }
                    },
                    child: const Text(StringConstants.login),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
