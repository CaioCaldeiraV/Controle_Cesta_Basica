import 'package:cesta_basica/app/models/request.model.dart';
import 'package:cesta_basica/app/repositories/database.repository.dart';
import '../../settings.dart';

class RequestRepository {
  DataBaseRepository dbr = DataBaseRepository();

  Future<int> create(RequestModel model) async {
    try {
      final db = await dbr.getDatabase();
      var id = await db.insert(
        requestTableName,
        model.toMap(),
      );
      return id;
    } catch (ex) {
      throw ("Erro ao cadastrar o pedido.");
    }
  }

  Future<List<RequestModel>> getRequests() async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db.query(requestTableName);
      return List.generate(maps.length, (i) {
        return RequestModel.fromMap(maps[i]);
      });
    } catch (ex) {
      throw ("Erro ao listar o pedido.");
    }
  }

  Future<List<RequestModel>> getRequestsClientId(int clientId) async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db.query(requestTableName,
          where: "clientsId = ?", whereArgs: [clientId]);
      return List.generate(maps.length, (i) {
        return RequestModel.fromMap(maps[i]);
      });
    } catch (ex) {
      throw ("Erro ao listar o pedido.");
    }
  }

  Future<RequestModel> getRequest(int id) async {
    try {
      final db = await dbr.getDatabase();
      final maps =
          await db.query(requestTableName, where: "id = ?", whereArgs: [
        id,
      ]);
      return RequestModel.fromMap(maps[0]);
    } catch (ex) {
      print(ex);
      return RequestModel();
    }
  }

  Future update(RequestModel model) async {
    try {
      final db = await dbr.getDatabase();
      await db.update(requestTableName, model.toMap(),
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
