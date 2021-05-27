import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../settings.dart';

class DataBaseRepository {
  Future<Database> getDatabase() async {
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
        db.execute(createDebtsTableScript);
        db.execute(createInstallmentTableScript);
      },
      version: 1,
    );
  }
}
