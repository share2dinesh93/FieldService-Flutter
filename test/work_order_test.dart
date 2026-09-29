import 'package:flutter_test/flutter_test.dart';
import 'package:field_service/features/work_orders/domain/work_order.dart';
void main(){ test('copyWith changes only status',(){ const order=WorkOrder(id:1,title:'Inspect unit',status:WorkOrderStatus.assigned); final updated=order.copyWith(status:WorkOrderStatus.inProgress); expect(updated.id,1);expect(updated.title,'Inspect unit');expect(updated.status,WorkOrderStatus.inProgress);});}
