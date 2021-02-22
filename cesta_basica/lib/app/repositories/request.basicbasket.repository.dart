import 'package:cesta_basica/app/models/requestbasicbasket.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../settings.dart';

class RequestBasicBasketRepository {
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

  Future create(RequestBasicBasketModel model) async {
    try {
      final db = await _getDatabase();
      await db.insert(
        requestBasicBasketTableName,
        model.toMap(),
      );
    } catch (ex) {
      print(ex);
      return ex;
    }
  }

  Future<List<RequestBasicBasketModel>> getRequestBasicBasket() async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(requestBasicBasketTableName);
      return List.generate(maps.length, (i) {
        return RequestBasicBasketModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <RequestBasicBasketModel>[];
    }
  }

  Future update(RequestBasicBasketModel model) async {
    try {
      final db = await _getDatabase();
      await db.update(requestBasicBasketTableName, model.toMap(),
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
        requestBasicBasketTableName,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<List<RequestBasicBasketModel>> searchIdinRequest(int id) async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(
        requestBasicBasketTableName,
        where: "requestId = ?",
        whereArgs: [id],
      );
      return List.generate(maps.length, (i) {
        return RequestBasicBasketModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <RequestBasicBasketModel>[];
    }
  }
}
