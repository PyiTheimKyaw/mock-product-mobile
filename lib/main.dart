import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mock_product_mobile/blocs/app_drawer_bloc/app_drawer_bloc.dart';
import 'package:mock_product_mobile/blocs/application_provider.dart';
import 'package:mock_product_mobile/localization/languages.dart';
import 'package:mock_product_mobile/pages/categories_page.dart';
import 'package:mock_product_mobile/pages/product_detail_page.dart';
import 'package:mock_product_mobile/pages/product_list_page.dart';
import 'package:mock_product_mobile/utils/route_constants.dart';
import 'package:mock_product_mobile/utils/strings.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(kLanguageBox);
  runApp(
    ChangeNotifierProvider<ApplicationProvider>(
      create: (BuildContext context) => ApplicationProvider(),
      child: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => AppDrawerBloc(),
        )
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = context.watch<ApplicationProvider>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: languageProvider.locale,
      translations: Languages(languageProvider.locale),
      // routeInformationProvider: AppRouter().router.routeInformationProvider,
      // routerDelegate: AppRouter().router.routerDelegate,
      // routeInformationParser: AppRouter().router.routeInformationParser,
      initialRoute: RouteConstants.kRouteHome,
      getPages: [
        GetPage(
          name: RouteConstants.kRouteHome,
          page: () => const CategoriesPage(),
        ),
        GetPage(
          name: RouteConstants.kRouteProductList,
          page: () => ProductListPage(slug: Get.parameters['slug']),
        ),
        GetPage(
          name: RouteConstants.kRouteProductDetail,
          page: () => ProductDetailPage(
            product: Get.arguments,
          ),
        ),
      ],
    );
  }
}
