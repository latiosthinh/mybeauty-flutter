import 'package:cloud_firestore/cloud_firestore.dart';
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
    for (var menu in menus.docs) {
      var services =
          await _firestore.collection('menus/${menu.id}/services').get();
      for (var service in services.docs) {
        childs.add(ServiceModel(service.id, service.get('name'),
            service.get('description'), service.get('price')));
      }
      returnValue
          .add(MenuModel(menu.id, menu.get('name'), childs, menu.get('image')));
      childs = [];
    }
    return returnValue;
  }
}
