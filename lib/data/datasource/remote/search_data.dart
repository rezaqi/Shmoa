import 'package:shimoa/core/class/crud.dart';
import 'package:shimoa/links.dart';

class DataSearch {
  Crud crud;
  DataSearch(this.crud);

  search(String search) async {
    print("nter");
    var res = await crud.postData(AppLink.search, {"search": search});
    print("object");
    print(res);
    return res.fold((l) => l, (r) => r);
  }
}
