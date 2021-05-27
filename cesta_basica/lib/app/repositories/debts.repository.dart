import 'package:cesta_basica/app/models/debts.model.dart';
import 'package:cesta_basica/app/repositories/database.repository.dart';
import '../../settings.dart';

class DebtsRepository {
  DataBaseRepository dbr = DataBaseRepository();

  Future<int> create(DebtsModel model) async {
    try {
      final db = await dbr.getDatabase();
      var id = await db.insert(
        debtsTableName,
        model.toMap(),
      );
      return id;
    } catch (_) {
      throw ("Não foi possível cadastrar o debito.");
    }
  }

  Future<List<DebtsModel>> searchRequestId(int id) async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db.query(
        debtsTableName,
        where: "requestId = ?",
        whereArgs: [id],
      );
      return List.generate(maps.length, (i) {
        return DebtsModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <DebtsModel>[];
    }
  }

  Future delete(int id) async {
    try {
      final db = await dbr.getDatabase();
      await db.delete(
        debtsTableName,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
