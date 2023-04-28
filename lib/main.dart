import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:house/modules/house/datasource/house_datasource_impl.dart';
import 'package:house/modules/house/repository/house_repository_impl.dart';
import 'package:house/modules/house/usecase/get_house.dart';
import 'package:house/modules/list/datasource/list_datasource_impl.dart';
import 'package:house/modules/list/usecase/delete_house.dart';
import 'package:house/modules/list/usecase/get_list_houses.dart';
import 'package:house/modules/register/datasource/register_datasource_impl.dart';
import 'package:house/modules/register/repository/register_repository_impl.dart';
import 'package:house/shared/model/houses_model.dart';
import 'package:house/shared/navigation/routes.dart';

import 'modules/house/page/controller/house_cubit.dart';
import 'modules/house/page/page/house_page.dart';
import 'modules/list/page/controller/list_house_cubit.dart';
import 'modules/list/page/page/list_page.dart';
import 'modules/list/repository/list_repository_impl.dart';
import 'modules/login/controller/login_cubit.dart';
import 'modules/login/login_page.dart';
import 'modules/register/page/controller/register_cubit.dart';
import 'modules/register/page/register_page.dart';
import 'modules/register/usecase/edit_house.dart';
import 'modules/register/usecase/register_house.dart';
import 'shared/constants/urls_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      dependencies: [
        Dependency(
            (i) => Dio(BaseOptions(baseUrl: UrlsConstants.baseUrl, headers: {
                  "Authorization":
                      "Bearer 40fe071962846075452a4f6123ae71697463cad20f51e237e2035b41af0513d8"
                })))
      ],
      blocs: [
        Bloc(
          (i) => LoginCubit(),
        ),
        Bloc(
          (i) => RegisterCubit(
            editHouse: EditHouseImpl(
              registerRepository: RegisterRepositoryImpl(
                registerDatasource: RegisterDatasourceImpl(
                  dio: BlocProvider.getDependency<Dio>(),
                )
              ),
            ),
            registerHouse: RegisterHouseImpl(
              registerRepository: RegisterRepositoryImpl(
                  registerDatasource: RegisterDatasourceImpl(
                    dio: BlocProvider.getDependency<Dio>(),
                  )
              ),
            ),
          ),
        ),
        Bloc(
          (i) => ListHouseCubit(
            deleteHouse: DeleteHouseImpl(
              registerRepository: ListRepositoryImpl(
                listDatasource: ListDatasourceImpl(
                  dio: BlocProvider.getDependency<Dio>(),
                ),
              ),
            ),
            getListHousesUsecase: GetListHousesImpl(
              listRepository: ListRepositoryImpl(
                listDatasource: ListDatasourceImpl(
                  dio: BlocProvider.getDependency<Dio>(),
                ),
              ),
            ),
          ),
        ),
        Bloc(
              (i) => HouseCubit(
            getHouse: GetHouseImpl(
              repository: HouseRepositoryImpl(
                houseDatasource: HouseDatasourceImpl(
                  dio: BlocProvider.getDependency<Dio>(),
                )
              )
            )
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Houses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          Routes.main: (_) => const LoginPage(),
          Routes.list: (_) => const ListPage(),
          Routes.registerHouse: (_) => const RegisterPage(),
          Routes.editHouse: (_) {
            final args = ModalRoute.of(_)!.settings.arguments as HousesModel?;
            return RegisterPage(
              housesModel: args,
            );
          },
          Routes.house: (_) {
            final args = ModalRoute.of(_)!.settings.arguments as HousesModel;
            return HousePage(
              housesModel: args,
            );
          },
        },
      ),
    );
  }
}
