import 'package:shimoa/core/class/status_request.dart';

handling(res) {
  if (res is StatusRequest) {
    print("++++++++++++++++++ STATUS REQUEST +++++++++++++++++++ ");
    print(res);
    return res;
  } else {
    return StatusRequest.success;
  }
}
