import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/number_constants.dart';
import '../../../../shared/model/houses_model.dart';
import '../controller/house_cubit.dart';

class HousePage extends StatefulWidget {
  final HousesModel housesModel;
  const HousePage({Key? key, required this.housesModel}) : super(key: key);

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  late HouseCubit controller;

  @override
  void initState() {
    super.initState();
    controller = BlocProvider.getBloc<HouseCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Info")),
      body: StreamBuilder(
        stream: controller.stream,
        builder: (context, state) {
          final currentState = state.data?.statusHouse ?? StatusHouse.initial;
          if(currentState == StatusHouse.initial) {
            controller.init(widget.housesModel.id!);
          }

          if(currentState == StatusHouse.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(NumberConstants.spaceAll16),
            child: Column(
              children: [
                TextFormField(
                  initialValue: controller.state.housesModel.name,
                  readOnly: true,
                ),
                const SizedBox(height: NumberConstants.spaceVertical16),
                TextFormField(
                  initialValue: controller.state.housesModel.id.toString(),
                  readOnly: true,
                ),
                const SizedBox(height: NumberConstants.spaceVertical16),
                TextFormField(
                  initialValue: controller.state.housesModel.order.toString(),
                  readOnly: true,
                ),
                const SizedBox(height: NumberConstants.spaceVertical16),
                TextFormField(
                  initialValue: controller.state.housesModel.active.toString(),
                  readOnly: true,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
