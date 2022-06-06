import 'package:get/get.dart';
import 'package:grocery_application/Repository/repository.dart';

class Controller extends GetxController {
  var isLoading = true.obs;
  var groceryList = [].obs;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  void fetch() async {
    try {
      isLoading(true);
      var groceries = (await Repo.getData())?.data!.products.results;
      if (groceries != null) {
        Rx(groceryList.value = groceries);
      }
    } finally {
      isLoading(false);
    }
  }
}
