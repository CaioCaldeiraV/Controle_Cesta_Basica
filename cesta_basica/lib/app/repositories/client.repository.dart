import 'package:cesta_basica/app/models/client.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../settings.dart';

class ClientRepository {
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

  Future create(ClientModel model) async {
    try {
      final db = await _getDatabase();
      await db.insert(
        clientTableName,
        model.toMap(),
      );
    } catch (ex) {
      print(ex);
      return ex;
    }
  }

  Future<List<ClientModel>> getClients() async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(clientTableName, orderBy: "name");
      return List.generate(maps.length, (i) {
        return ClientModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <ClientModel>[];
    }
  }

  Future<List<ClientModel>> search(String term) async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(clientTableName,
          where: "name LIKE ?",
          whereArgs: [
            '%$term%',
          ],
          orderBy: "name");
      return List.generate(maps.length, (i) {
        return ClientModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <ClientModel>[];
    }
  }

  Future<ClientModel> getClient(int id) async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(
        clientTableName,
        where: "id = ?",
        whereArgs: [id],
      );
      maps.length;
      return ClientModel.fromMap(maps[0]);
    } catch (ex) {
      print(ex);
      throw ("Erro ao buscar Cliente");
    }
  }

  Future update(ClientModel model) async {
    try {
      final db = await _getDatabase();
      await db.update(clientTableName, model.toMap(),
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
        clientTableName,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
