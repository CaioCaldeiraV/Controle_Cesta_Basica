import 'package:cesta_basica/app/models/basicbasketproduct.model.dart';
import 'package:cesta_basica/app/repositories/database.repository.dart';
import '../../settings.dart';

class BasicBasketProductRepository {
  DataBaseRepository dbr = DataBaseRepository();

  Future create(BasicBasketProductModel model) async {
    try {
      final db = await dbr.getDatabase();
      await db.insert(
        basicbasketsproductsTableName,
        model.toMap(),
      );
    } catch (ex) {
      print(ex);
      return ex;
    }
  }

  Future<List<BasicBasketProductModel>> getBasicBasketsProducts() async {
    try {
      final db = await dbr.getDatabase();
      final maps =
          await db.query(basicbasketsproductsTableName, orderBy: "name");
      return List.generate(maps.length, (i) {
        return BasicBasketProductModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <BasicBasketProductModel>[];
    }
  }

  Future<List<BasicBasketProductModel>> search(int id) async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db.query(
        basicbasketsproductsTableName,
        where: "productsId = ?",
        whereArgs: [
          id,
        ],
      );
      return List.generate(maps.length, (i) {
        return BasicBasketProductModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <BasicBasketProductModel>[];
    }
  }

  Future<BasicBasketProductModel> getBasicBasketsProduct(int id) async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db.query(basicbasketsproductsTableName,
          where: "id = ?", whereArgs: [id]);
      return BasicBasketProductModel.fromMap(maps[0]);
    } catch (ex) {
      print(ex);
      return BasicBasketProductModel();
    }
  }

  Future update(BasicBasketProductModel model) async {
    try {
      final db = await dbr.getDatabase();
      await db.update(basicbasketsproductsTableName, model.toMap(),
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
        basicbasketsproductsTableName,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<List<BasicBasketProductModel>> searchIdinBasicBaskets(int id) async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db.query(
        basicbasketsproductsTableName,
        where: "basicbasketsId = ?",
        whereArgs: [id],
      );
      return List.generate(maps.length, (i) {
        return BasicBasketProductModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <BasicBasketProductModel>[];
    }
  }

  Future<List<BasicBasketProductModel>> productsInBasicBasket(int id) async {
    try {
      final db = await dbr.getDatabase();
      final maps = await db.query(
        basicbasketsproductsTableName,
        where: "basicbasketsId = ?",
        whereArgs: [id],
      );
      return List.generate(maps.length, (i) {
        return BasicBasketProductModel.fromMap(maps[i]);
      });
    } catch (ex) {
      throw ("Erro ao buscar produtos de uma cesta básica");
    }
  }
}
