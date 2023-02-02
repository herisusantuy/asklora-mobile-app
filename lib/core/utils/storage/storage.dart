abstract class Storage {
  Future<void> writeData(String key, String value);

  Future<String?> readData(String key);

  Future<void> deleteData(String key);

  Future<void> deleteAllData();
}
