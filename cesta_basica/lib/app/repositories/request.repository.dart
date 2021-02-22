import 'package:cesta_basica/app/models/request.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../settings.dart';

class RequestRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), databaseName),
      onConfigure: (db) {
        db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) {
        db.execute(createClientTableScript);
        db.execute(createBasicBasketsTableScript);
        db.execute(createProductTableScript);
        db.execute(createBasicBasketsProductsTableScript);
        db.execute(createRequestTableScript);
        db.execute(createRequestBasicBasketsTableScript);
      },
      version: 1,
    );
  }

  Future<int> create(RequestModel model) async {
    try {
      final db = await _getDatabase();
      var id = await db.insert(
        requestTableName,
        model.toMap(),
      );
      return id;
    } catch (ex) {
      throw ("some arbitrary error");
    }
  }

  Future<List<RequestModel>> getRequests() async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(requestTableName);
      return List.generate(maps.length, (i) {
        return RequestModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <RequestModel>[];
    }
  }

  Future<RequestModel> getRequest(int id) async {
    try {
      final db = await _getDatabase();
      final maps =
          await db.query(requestTableName, where: "id = ?", whereArgs: [
        [id],
      ]);
      return RequestModel.fromMap(maps[0]);
    } catch (ex) {
      print(ex);
      return RequestModel();
    }
  }

  Future update(RequestModel model) async {
    try {
      final db = await _getDatabase();
      await db.update(requestTableName, model.toMap(),
          where: "id = ?", whereArgs: [model.id]);
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future delete(int id) async {
    try {
      final db = await _getDatabase();
      await db.delete(
        requestTableName,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
