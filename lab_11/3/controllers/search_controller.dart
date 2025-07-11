import 'package:second/lab_11/3/utils/import_export.dart';

class ApiSearchController extends GetxController {
  var allDataList = <ApiSearchModel>[].obs;
  var dataList = <ApiSearchModel>[].obs;
  var searchText = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataFromApi();
  }

  void fetchDataFromApi() async {
    isLoading.value = true;
    final data = await SearchApi().fetchData();
    allDataList.value = data;
    dataList.value = data;
    isLoading.value = false;
  }

  void filterData(String query) {
    if (query.isEmpty) {
      dataList.value = allDataList;
    } else {
      final lowerQuery = query.toLowerCase();
      dataList.value = allDataList.where((item) {
        final name = item.name?.toLowerCase() ?? '';
        final desc = item.description?.toLowerCase() ?? '';
        return name.contains(lowerQuery) || desc.contains(lowerQuery);
      }).toList();
    }
  }
}