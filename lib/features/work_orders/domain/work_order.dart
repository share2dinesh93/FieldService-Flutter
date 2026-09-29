enum WorkOrderStatus { assigned, inProgress, completed }
class WorkOrder {
  const WorkOrder({required this.id, required this.title, required this.status});
  final int id; final String title; final WorkOrderStatus status;
  WorkOrder copyWith({WorkOrderStatus? status}) => WorkOrder(id: id, title: title, status: status ?? this.status);
}
