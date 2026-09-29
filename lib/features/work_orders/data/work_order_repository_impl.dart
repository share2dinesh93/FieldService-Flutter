import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/network/api_client.dart';
import '../domain/work_order.dart';
import '../domain/work_order_repository.dart';
class WorkOrderRepositoryImpl implements WorkOrderRepository {
  WorkOrderRepositoryImpl(this.api); final ApiClient api;
  @override Future<List<WorkOrder>> fetch() async {
    final prefs = await SharedPreferences.getInstance(); final rows = await api.getTodos();
    return rows.map((e) { final id=e['id'] as int; final raw=prefs.getString('status_$id'); final status=WorkOrderStatus.values.where((v)=>v.name==raw).firstOrNull ?? WorkOrderStatus.assigned; return WorkOrder(id:id,title:e['title'] as String,status:status); }).toList();
  }
  @override Future<void> saveStatus(int id, WorkOrderStatus status) async => (await SharedPreferences.getInstance()).setString('status_$id', status.name);
}
