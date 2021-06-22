import 'package:cesta_basica/app/models/installments.model.dart';
import 'package:cesta_basica/app/repositories/database.repository.dart';
import '../../settings.dart';

class InstallmentsRepository {
  DataBaseRepository dbr = DataBaseRepository();

  Future create(InstallmentsModel model) async {
    try {
      final db = await dbr.getDatabase();
      await db.insert(
        installmentTableName,
        model.toMap(),
      );
    } catch (_) {
      throw ("Não foi possível cadastrar a parcela.");
    }
  }

  Future<List<InstallmentsModel>> searchDebtsId(int id) async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db.query(
        installmentTableName,
        where: "debtsId = ?",
        whereArgs: [id],
      );
      return List.generate(maps.length, (i) {
        return InstallmentsModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <InstallmentsModel>[];
    }
  }

  Future<List<InstallmentsModel>> searchDebtsIdWithStatus(int id) async {
    var status = "Pendente";
    try {
      final db = await dbr.getDatabase();
      final maps = await db.query(
        installmentTableName,
        where: "debtsId = ? and status = ?",
        whereArgs: [id, status],
      );
      return List.generate(maps.length, (i) {
        return InstallmentsModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <InstallmentsModel>[];
    }
  }

  Future update(InstallmentsModel model) async {
    try {
      final db = await dbr.getDatabase();
      await db.update(installmentTableName, model.toMap(),
          where: "id = ?", whereArgs: [model.id]);
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
