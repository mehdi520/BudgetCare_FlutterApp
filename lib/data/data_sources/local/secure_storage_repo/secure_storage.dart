import 'package:budget_care/data/models/user/data_model/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../infra/core/core_exports.dart';

class SecureStorage{
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<bool> setValue(String key, String value) async {
    await storage.write(key: key, value: value);
    return true;
  }

  Future<String?> getToken() async {
    return await storage.read(key: usertoken);
  }
  /// Reads the value associated with the given key from the local storage.
  ///
  /// Returns a Future<dynamic> representing the value stored for the key.
  Future<dynamic> readValue(String key) async {
    return await storage.read(key: key);
  }

  /// Clears the value associated with the given key from the local storage.
  ///
  /// Returns a Future<bool> indicating the success of the operation.
  Future<bool> clearValue(String key) async {
    await storage.delete(key: key);
    return true;
  }

 Future<bool> saveProfile(UserModel? data) async {
    if(data != null)
      {
        await storage.write(key: kName, value: data.name);
        await storage.write(key: kEmail, value: data.email);
        await storage.write(key: kPhone, value: data.phone);
        await storage.write(key: kId, value: data.id);
        await storage.write(key: kcreatedAt, value: data.createdAt);

        return true;

      }
    else
      {
        return false;
      }
  }

  Future<UserModel> getProfile() async {
    // Fetch values asynchronously
    final name = await readValue(kName);
    final email = await readValue( kEmail);
    final phone = await readValue(kPhone);
    final id = await readValue( kId);
    final createdAt = await readValue(kcreatedAt);

    // Return UserModel with fetched values
    return UserModel(
      name: name,
      email: email,
      phone: phone,
      createdAt: createdAt,
    );
  }
}