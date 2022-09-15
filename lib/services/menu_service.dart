import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybeauty/services/models.dart';

class MenuService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<MenuModel>> getMenus(int type) async {
    List<MenuModel> returnValue = [];
    List<ServiceModel> services = [];
    await _firestore
        .collection('menus')
        .where('type', isEqualTo: type)
        .get()
        .then((value) => {
              for (var menu in value.docs)
                {
                  services = [],
                  _firestore
                      .collection('menus/${menu.id}/services')
                      .get()
                      .then((value2) => {
                            for (var service in value2.docs)
                              {
                                services.add(ServiceModel(
                                    service.id, service.get('name')))
                              }
                          }),
                  returnValue.add(MenuModel(
                      menu.id, menu.get('name'), services, menu.get('image')))
                }
            });
    return returnValue;
  }
}
