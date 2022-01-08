import 'package:flutter_test/flutter_test.dart';
import 'package:provider_form/model/userlist.dart';
import 'package:provider_form/provider/list_provider.dart';

void main() {
  setUp() {
    ListProvider listProvider = ListProvider();
  }

  ;
  test("initializes with empty", () {
    ListProvider listProvider = ListProvider();

    expect(listProvider.list.length, 0);
  });

  test("initializes with user added", () {
    ListProvider listProvider = ListProvider();

    listProvider.addItem('Lukman');

    expect(listProvider.list.length, 1);
  });
}
