import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:cesta_basica/app/repositories/database.repository.dart';
import '../../settings.dart';

class BasicBasketRepository {
  DataBaseRepository dbr = DataBaseRepository();

  Future<int> create(BasicBasketModel model) async {
    try {
      final db = await dbr.getDatabase();
      var id = await db.insert(
        basicbasketTableName,
        model.toMap(),
      );
      return id;
    } catch (ex) {
      print(ex);
      return ex;
    }
  }

  Future<List<BasicBasketModel>> getBasicBaskets() async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db.query(basicbasketTableName, orderBy: "name");
      return List.generate(maps.length, (i) {
        return BasicBasketModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <BasicBasketModel>[];
    }
  }

  Future<List<BasicBasketModel>> search(String term) async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db.query(basicbasketTableName,
          where: "name LIKE ?",
          whereArgs: [
            '%$term%',
          ],
          orderBy: "name");
      return List.generate(maps.length, (i) {
        return BasicBasketModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <BasicBasketModel>[];
    }
  }

  Future<BasicBasketModel> getBasicBasket(int id) async {
    try {
      final db = await dbr.getDatabase();
      final maps =
          await db.query(basicbasketTableName, where: "id = ?", whereArgs: [
        id,
      ]);
      return BasicBasketModel.fromMap(maps[0]);
    } catch (ex) {
      print(ex);
      return BasicBasketModel();
    }
  }

  Future update(BasicBasketModel model) async {
    try {
      final db = await dbr.getDatabase();
      await db.update(basicbasketTableName, model.toMap(),
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
        basicbasketTableName,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<double> getBasicBasketValue(int id) async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db
          .query(basicbasketTableName, where: "id = ?", whereArgs: [id]);
      return BasicBasketModel.fromMap(maps[0]).value;
    } catch (ex) {
      print(ex);
      return 0;
    }
  }

  Future<String> getBasicBasketName(int id) async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db
          .query(basicbasketTableName, where: "id = ?", whereArgs: [id]);
      return BasicBasketModel.fromMap(maps[0]).name;
    } catch (ex) {
      print(ex);
      return "";
    }
  }
}
