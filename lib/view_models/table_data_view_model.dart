import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../models/table_data.dart';

class TableDataViewModel extends StateNotifier<List<TableData>> {
  late Box<TableData> _tableBox;

  TableDataViewModel() : super([]) {
    _init();
  }

  Future<void> _init() async {
    // Initialize Hive – use path_provider to get storage directory.
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    Hive.registerAdapter(TableDataAdapter());
    _tableBox = await Hive.openBox<TableData>('tableDataBox');
    state = _tableBox.values.toList();
  }

  Future<void> addTableData(TableData data) async {
    await _tableBox.add(data);
    state = _tableBox.values.toList();
  }

  TableData? getTableData(int tableNumber) {
    return _tableBox.values.firstWhereOrNull(
            (element) => element.tableNumber == tableNumber);
  }
}

final tableDataProvider =
StateNotifierProvider<TableDataViewModel, List<TableData>>((ref) {
  return TableDataViewModel();
});
