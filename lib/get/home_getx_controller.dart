import 'package:get/get.dart';
import 'package:graduation_project/controllers/home_api_controller.dart';
import 'package:graduation_project/models/home_response.dart';

class HomeGetxController extends GetxController{
  HomeResponse? homeResponse;
  bool loading = false;
  final HomeApiController _apiController = HomeApiController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHome();
  }

  Future<void> getHome() async {
    loading = true;
    homeResponse = await _apiController.showHome();
    loading = false;
    update();
  }

}