import 'package:cesta_basica/app/models/product.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../settings.dart';

class ProductRepository {
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
      },
      version: 1,
    );
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(productTableName, orderBy: "name");
      return List.generate(maps.length, (i) {
        return ProductModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <ProductModel>[];
    }
  }

  Future create(ProductModel model) async {
    try {
      final db = await _getDatabase();
      await db.insert(
        productTableName,
        model.toMap(),
      );
    } catch (ex) {
      print(ex);
      return ex;
    }
  }

  Future<List<ProductModel>> search(String term) async {
    try {
      final db = await _getDatabase();
      final maps = await db.query(productTableName,
          where: "name LIKE ?",
          whereArgs: [
            '%$term%',
          ],
          orderBy: "name");
      return List.generate(maps.length, (i) {
        return ProductModel.fromMap(maps[i]);
      });
    } catch (ex) {
      print(ex);
      return <ProductModel>[];
    }
  }

  Future update(ProductModel model) async {
    try {
      final db = await _getDatabase();
      await db.update(productTableName, model.toMap(),
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
        productTableName,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<ProductModel> getProduct(int id) async {
    try {
      final db = await _getDatabase();
      final maps =
          await db.query(productTableName, where: "id = ?", whereArgs: [id]);
      return ProductModel.fromMap(maps[0]);
    } catch (ex) {
      print(ex);
      return ProductModel();
    }
  }

  Future<double> getProductValue(int id) async {
    try {
      final db = await _getDatabase();
      final maps =
          await db.query(productTableName, where: "id = ?", whereArgs: [id]);
      return ProductModel.fromMap(maps[0]).value;
    } catch (ex) {
      print(ex);
      return 0;
    }
  }

  Future<String> getProductNameBrand(int id) async {
    try {
      final db = await _getDatabase();
      final maps =
          await db.query(productTableName, where: "id = ?", whereArgs: [id]);
      // ignore: lines_longer_than_80_chars
      return "${ProductModel.fromMap(maps[0]).name} - ${ProductModel.fromMap(maps[0]).brand}";
    } catch (ex) {
      print(ex);
      return "";
    }
  }
}
