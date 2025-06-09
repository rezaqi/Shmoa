import 'package:shimoa/core/class/crud.dart';
import 'package:shimoa/links.dart';

class DataNovels {
  Crud crud;
  DataNovels(this.crud);

  get() async {
    var res = await crud.postData(AppLink.novelsGet, {});
    print(res);
    return res.fold((l) => l, (r) => r);
  }
}
