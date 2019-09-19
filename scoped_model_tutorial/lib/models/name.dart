import 'package:scoped_model/scoped_model.dart';

class NameModel extends Model {
  String _name = 'Base Name';

  String get name => _name;

  set name(String newName) {
    _name = newName;

    notifyListeners();
  }
}