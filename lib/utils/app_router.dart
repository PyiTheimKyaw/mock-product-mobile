// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mock_product_mobile/pages/categories_page.dart';
// import 'package:mock_product_mobile/pages/product_list_page.dart';
// import 'package:mock_product_mobile/utils/route_constants.dart';
//
// // Route configuration for the whole app
// class AppRouter {
//   final GoRouter router = GoRouter(
//     initialLocation: '/',
//     routes: <RouteBase>[
//       GoRoute(
//         name: RouteConstants.kRouteHome,
//         path: '/',
//         pageBuilder: (context, state) {
//           return buildPageWithDefaultTransition<void>(
//             context: context,
//             state: state,
//             child: const CategoriesPage(),
//           );
//         },
//         routes: <RouteBase>[
//           GoRoute(
//             name: RouteConstants.kRouteProductList,
//             path: 'product-list/:slug',
//             pageBuilder: (context, state) {
//               return buildPageWithDefaultTransition<void>(
//                 context: context,
//                 state: state,
//                 child: ProductListPage(
//                   slug: state.pathParameters['slug'],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     ],
//   );
// }
//
// // Navigation with animations
// CustomTransitionPage buildPageWithDefaultTransition<T>({
//   required BuildContext context,
//   required GoRouterState state,
//   required Widget child,
// }) {
//   return CustomTransitionPage<T>(
//     transitionDuration: const Duration(milliseconds: 800),
//     key: state.pageKey,
//     child: child,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//         FadeTransition(
//             opacity: CurveTween(curve: Curves.easeIn).animate(animation),
//             child: child),
//   );
// }
