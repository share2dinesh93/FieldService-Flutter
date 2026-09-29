import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../data/work_order_repository_impl.dart';
import '../domain/work_order.dart';
import '../domain/work_order_repository.dart';
final repositoryProvider = Provider<WorkOrderRepository>((ref) => WorkOrderRepositoryImpl(ApiClient()));
final workOrdersProvider = AsyncNotifierProvider<WorkOrdersController,List<WorkOrder>>(WorkOrdersController.new);
class WorkOrdersController extends AsyncNotifier<List<WorkOrder>> {
  @override Future<List<WorkOrder>> build() => ref.read(repositoryProvider).fetch();
  Future<void> update(int id, WorkOrderStatus status) async { await ref.read(repositoryProvider).saveStatus(id,status); state=AsyncData([for(final w in state.value ?? []) if(w.id==id) w.copyWith(status:status) else w]); }
}
