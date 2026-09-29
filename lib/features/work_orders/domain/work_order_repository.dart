import 'work_order.dart';
abstract interface class WorkOrderRepository {
  Future<List<WorkOrder>> fetch();
  Future<void> saveStatus(int id, WorkOrderStatus status);
}
