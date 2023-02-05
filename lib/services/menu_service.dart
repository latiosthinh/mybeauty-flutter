import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybeauty/models/index.dart';
import 'package:mybeauty/services/models.dart';

class MenuService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<MenuModel>> getMenus(int type) async {
    List<MenuModel> returnValue = [];
    List<ServiceModel> childs = [];
    final menus = await _firestore
        .collection('menus')
        .where('type', isEqualTo: type)
        .orderBy('sort_order')
        .get();

    if (menus.docs.isNotEmpty) {
      for (var menu in menus.docs) {
        final services = menu.get('menu_services');
        childs = [];
        for (var s in services) {
          final ss = await _firestore
              .doc(s.path)
              .get();

          if (ss.exists) {
            childs.add(ServiceModel.fromJson(ss.data(), ss.id));
          }
        }
        returnValue
            .add(MenuModel(menu.id, menu.get('name'), childs, menu.get('image')));
      }
    }
    
    return returnValue;
  }
}
