import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'providers.dart';
class WorkOrdersPage extends ConsumerWidget {
  const WorkOrdersPage({super.key});
  @override Widget build(BuildContext context, WidgetRef ref) { final state=ref.watch(workOrdersProvider); return Scaffold(appBar:AppBar(title:const Text('Work Orders')),body:RefreshIndicator(onRefresh:()=>ref.refresh(workOrdersProvider.future),child:state.when(data:(items)=>ListView.separated(itemCount:items.length,separatorBuilder:(_,__)=>const Divider(height:1),itemBuilder:(_,i){final w=items[i];return ListTile(title:Text(w.title),subtitle:Text(w.status.name),trailing:const Icon(Icons.chevron_right),onTap:()=>context.go('/work-order/${w.id}'));}),loading:()=>const Center(child:CircularProgressIndicator()),error:(e,_)=>ListView(children:[Padding(padding:const EdgeInsets.all(24),child:Text('Unable to load work orders: $e'))])))); }
}
