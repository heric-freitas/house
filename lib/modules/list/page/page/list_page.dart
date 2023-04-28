import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constants/strings_constants.dart';
import '../../../../shared/constants/number_constants.dart';
import '../../../../shared/navigation/routes.dart';
import '../controller/list_house_cubit.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late ListHouseCubit controller;

  @override
  void initState() {
    super.initState();
    controller = BlocProvider.getBloc<ListHouseCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringConstants.houses)),
      body: StreamBuilder(
        stream: controller.stream,
        builder: (context, state) {
          final currentStatus = state.data?.statusHouses ?? StatusHouses.initial;
          if(currentStatus == StatusHouses.initial) {
            controller.getListHouses();
            return const Center(child: CircularProgressIndicator());
          }
          if(currentStatus == StatusHouses.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if(currentStatus == StatusHouses.failure) {
            return const Center(child: Text("Something went wrong"));
          }

          return ListView.builder(
            itemCount: controller.state.listHousesModel?.list.length ?? 0,
            itemBuilder: (context, index) {
              final house = controller.state.listHousesModel?.list[index];
              return ListTile(
                onTap: ()  async {
                  await controller.deleteHouses(house!.id!);
                  await controller.getListHouses();
                },
                leading: SizedBox(
                  height: double.infinity,
                  child: IconButton(icon: const Icon(Icons.delete, size: NumberConstants.bottomIconSize, color: Colors.red,), onPressed: () async {
                    controller.getListHouses();
                  },),
                ),
                title: Text(house?.name ?? ""),
                trailing: IconButton(icon: const Icon(Icons.edit, size: NumberConstants.bottomIconSize), onPressed: () async {
                  await Navigator.of(context).pushNamed(Routes.editHouse, arguments: house);
                  controller.getListHouses();
                },),
              );
            },
          );
        }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(NumberConstants.spaceAll16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: const Icon(Icons.arrow_back, size: NumberConstants.bottomIconSize), onPressed: () {
              controller.backPage();
            },),
            IconButton(icon: const Icon(Icons.add, size: NumberConstants.bottomIconSize), onPressed: () async {
              await Navigator.of(context).pushNamed(Routes.registerHouse);
              controller.getListHouses();
            },),
            IconButton(icon: const Icon(Icons.arrow_forward, size: NumberConstants.bottomIconSize), onPressed: () {
              controller.nextPage();
            },),
          ],
        ),
      ),
    );
  }
}
