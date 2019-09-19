import 'package:scoped_model/scoped_model.dart';

class AgeModel extends Model {
  String _age = 'Base Age';

  String get age => _age;

  set age(String newAge) {
    _age = newAge;

    notifyListeners();
  }
}