import 'package:hive_ce/hive.dart';

part 'table_data.g.dart';

@HiveType(typeId: 0)
class TableData extends HiveObject {
  @HiveField(0)
  final int tableNumber;

  @HiveField(1)
  final double posX;

  @HiveField(2)
  final double posY;

  @HiveField(3)
  final double orientation;

  TableData({
    required this.tableNumber,
    required this.posX,
    required this.posY,
    required this.orientation,
  });
}
