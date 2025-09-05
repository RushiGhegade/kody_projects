import 'package:flutter/cupertino.dart';

// this class store the information about app controller that required in app
class AppController {
  // this search controller for search products
  static TextEditingController searchController = TextEditingController();

  // these are text controller
  static final formKey = GlobalKey<FormState>();
  static final formKeyCreateAccountMobile = GlobalKey<FormState>();
  static final formKeyLoginWeb = GlobalKey<FormState>();
  static final formKeyCreateAccountWeb = GlobalKey<FormState>();
}
