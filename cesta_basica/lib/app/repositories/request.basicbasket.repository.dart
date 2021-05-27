import 'package:cesta_basica/app/models/requestbasicbasket.model.dart';
import 'package:cesta_basica/app/repositories/database.repository.dart';
import '../../settings.dart';

class RequestBasicBasketRepository {
  DataBaseRepository dbr = DataBaseRepository();

  Future create(RequestBasicBasketModel model) async {
    try {
      final db = await dbr.getDatabase();
      await db.insert(
        requestBasicBasketTableName,
        model.toMap(),
      );
    } catch (ex) {
      print(ex);
      throw ("Erro ao cadastrar o pedido.");
    }
  }

  Future<List<RequestBasicBasketModel>> getRequestBasicBasket() async {
    try {
      final db = await dbr.getDatabase();
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
      final db = await dbr.getDatabase();
      await db.update(requestBasicBasketTableName, model.toMap(),
          where: "id = ?", whereArgs: [model.id]);
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future delete(int id) async {
    try {
      final db = await dbr.getDatabase();
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
      final db = await dbr.getDatabase();
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
