import 'package:cesta_basica/app/models/basicbasketproduct.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../settings.dart';

class BasicBasketProductRepository {
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

  Future create(BasicBasketProductModel model) async {
    try {
      final db = await _getDatabase();
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
      final db = await _getDatabase();
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
      final db = await _getDatabase();
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
      final db = await _getDatabase();
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
      final db = await _getDatabase();
      await db.update(basicbasketsproductsTableName, model.toMap(),
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
      final db = await _getDatabase();
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
}
