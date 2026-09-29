import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/work_orders/presentation/work_order_details_page.dart';
import '../features/work_orders/presentation/work_orders_page.dart';

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => const WorkOrdersPage(), routes: [
    GoRoute(path: 'work-order/:id', builder: (_, state) => WorkOrderDetailsPage(id: int.parse(state.pathParameters['id']!)))
  ])
]);
class FieldServiceApp extends StatelessWidget {
  const FieldServiceApp({super.key});
  @override Widget build(BuildContext context) => MaterialApp.router(title: 'Field Service', theme: ThemeData(useMaterial3: true), routerConfig: router);
}
