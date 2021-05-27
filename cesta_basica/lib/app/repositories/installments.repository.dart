import 'package:cesta_basica/app/models/installments.model.dart';
import 'package:cesta_basica/app/repositories/database.repository.dart';
import '../../settings.dart';

class InstallmentsRepository {
  DataBaseRepository dbr = DataBaseRepository();

  Future create(InstallmentsModel model) async {
    try {
      final db = await dbr.getDatabase();
      await db.insert(
        installmentTableName,
        model.toMap(),
      );
    } catch (_) {
      throw ("Não foi possível cadastrar a parcela.");
    }
  }
}
