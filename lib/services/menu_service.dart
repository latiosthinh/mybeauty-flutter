import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybeauty/services/models.dart';

class MenuService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<MenuModel>> getMenus(int type) async {
    List<MenuModel> returnValue = [];
    final menus = await _firestore
        .collection('menus')
        .where('type', isEqualTo: type)
        .orderBy('sort_order')
        .get();
    for (var menu in menus.docs) {
      final services =
          await _firestore.collection('menus/${menu.id}/services').get();
      final childs = services.docs
          .map((e) => ServiceModel.fromJson(e.data(), menu.id))
          .toList();
      returnValue
          .add(MenuModel(menu.id, menu.get('name'), childs, menu.get('image')));
    }
    return returnValue;
  }
}
