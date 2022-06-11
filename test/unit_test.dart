import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_application/Repository/repository.dart';

void main() {
  test('Fetch Api', () async {
    bool done = false;
    var fetch = (await Repo.getData())?.data!.products.results;
    if (fetch != null) {
      done = true;
    }
    expect(done, true);
  });
}
