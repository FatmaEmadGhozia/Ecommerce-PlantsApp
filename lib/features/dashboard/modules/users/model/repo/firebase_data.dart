import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_application_2/features/dashboard/modules/users/model/repo/parent_data.dart';
// import 'package:flutter_application_2/features/dashboard/modules/users/model/user_model.dart';

import '../user_model.dart';
import 'parent_data.dart';

class FirebaseRepo extends ParentRepo {
  static FirebaseRepo instance = FirebaseRepo._init();

  FirebaseRepo._init();

  @override
  Future<List<UserModel>> fetch() async {
    /// https://firebase.flutter.dev/docs/firestore/usage
    return await FirebaseFirestore.instance.collection('Users').get().then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((e) {
        final Map data = e.data() as Map;

        Map m = {
          'name': data.containsKey('name') ? data['name'] : "XX",
          'address': data.containsKey('adress') ? data['address'] : "XXXX",
          'id': e.reference.id,
        };
        return UserModel.fromJson(m);
      }).toList();
    });
  }

  @override
  Future<void> delete({required int id}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    await users.doc(id.toString()).update({'company': 'Stokes and Sons'}).then((_) => print("User Updated"));
    // .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Future<void> insert({required String name, String? address}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    await users
        .add({
          'full_name': name, // John Doe
          'address': address, // Stokes and Sons
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}