import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../shared/constants/number_constants.dart';
import '../../../shared/constants/strings_constants.dart';
import '../../../shared/model/houses_model.dart';
import '../../../shared/validator/validator.dart';
import 'controller/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  final HousesModel? housesModel;
  const RegisterPage({Key? key, this.housesModel}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterCubit controller;
  final formKey = GlobalKey<FormState>();

  final TextEditingController textEditingControllerHouse =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.housesModel);
    controller = BlocProvider.getBloc<RegisterCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.stream,
        builder: (context, state) {
          final currentState =
              state.data?.statusRegister ?? StatusRegister.initial;

          if (currentState == StatusRegister.initial) {
            final route = ModalRoute.of(context)!.settings.name;
            textEditingControllerHouse.text = widget.housesModel?.name ?? "";
            controller.init(route!, housesModel: widget.housesModel);
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if(currentState == StatusRegister.success) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pop();
            });
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (currentState == StatusRegister.loading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (currentState == StatusRegister.failure) {
            return const Scaffold(
              body: Center(child: Text("Something went wrong"))
            );
          }

          return Scaffold(
            appBar: AppBar(
                title: Text(controller.isEdit ? "Editar casa" : "Nova casa")),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(NumberConstants.spaceAll16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: textEditingControllerHouse,
                      decoration: const InputDecoration(
                          labelText: StringConstants.nameHouse),
                      validator: Validator.validatorNameHouse,
                    ),
                    const SizedBox(height: NumberConstants.spaceVertical24),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final house = textEditingControllerHouse.text;
                          await controller.registerOrEditHouse(house);
                        }
                      },
                      child: Text(controller.isEdit
                          ? "Editar casa"
                          : "Adicionar nova casa"),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
