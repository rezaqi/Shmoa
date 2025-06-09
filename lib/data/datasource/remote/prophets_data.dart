import 'package:shimoa/core/class/crud.dart';
import 'package:shimoa/links.dart';

class DataProphets {
  Crud crud;
  DataProphets(this.crud);

  get() async {
    var res = await crud.postData(AppLink.prophetsGet, {});
    return res.fold((l) => l, (r) => r);
  }
}
