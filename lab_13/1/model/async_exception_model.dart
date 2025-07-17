class AsyncModel {
  Future<String> fetchData(String input) async {
    await Future.delayed(Duration(seconds: 1));
    if (input == 'error') {
      throw Exception('Something went wrong!');
    }
    return 'Data received: $input';
  }
}
