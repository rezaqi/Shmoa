import 'package:shimoa/core/class/crud.dart';
import 'package:shimoa/links.dart';

class DataSave {
  Crud crud;
  DataSave(this.crud);

  get(id) async {
    var res = await crud.postData(AppLink.saveGet, {"id": id});
    return res.fold((l) => l, (r) => r);
  }
}
