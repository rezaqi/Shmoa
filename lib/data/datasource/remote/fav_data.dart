import 'package:shimoa/core/class/crud.dart';
import 'package:shimoa/links.dart';

class DataFav {
  Crud crud;
  DataFav(this.crud);

  get(id) async {
    var res = await crud.postData(AppLink.favGet, {"id": id});
    print("-------------------------d---------------------");
    print(res);
    return res.fold((l) => l, (r) => r);
  }
}
