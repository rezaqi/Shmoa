import 'package:shimoa/core/class/crud.dart';
import 'package:shimoa/links.dart';

class DataChild {
  Crud crud;
  DataChild(this.crud);

  get() async {
    var res = await crud.postData(AppLink.childrenGet, {});
    return res.fold((l) => l, (r) => r);
  }
}
