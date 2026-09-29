import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/work_order.dart';
import 'providers.dart';
class WorkOrderDetailsPage extends ConsumerWidget {
  const WorkOrderDetailsPage({super.key,required this.id}); final int id;
  @override Widget build(BuildContext context,WidgetRef ref){ final item=ref.watch(workOrdersProvider).value?.where((e)=>e.id==id).firstOrNull; return Scaffold(appBar:AppBar(title:Text('Work Order #$id')),body:item==null?const Center(child:Text('Work order unavailable')):Padding(padding:const EdgeInsets.all(20),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(item.title,style:Theme.of(context).textTheme.headlineSmall),const SizedBox(height:12),Text('Status: ${item.status.name}'),const Spacer(),SizedBox(width:double.infinity,child:FilledButton(onPressed:(){final next=item.status==WorkOrderStatus.assigned?WorkOrderStatus.inProgress:WorkOrderStatus.completed;ref.read(workOrdersProvider.notifier).update(id,next);},child:Text(item.status==WorkOrderStatus.assigned?'Start Job':'Complete Job')))]))); }
}
