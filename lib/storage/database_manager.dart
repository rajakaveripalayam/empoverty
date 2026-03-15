import 'package:em_poverty/storage/service_provider_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as pathPlugin;

import '../objectbox.g.dart';

class DatabaseManager {
   static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager(){
  return _instance;
  }

   DatabaseManager._internal();

  late Box<ServiceProviderModel> _box;

   Future<void> createAppDb() async {
      var dbDirectory = await getApplicationDocumentsDirectory();
     var objectBoxStore = await openStore(directory: pathPlugin.join(dbDirectory.path, "app-db"));
     _box = objectBoxStore.box<ServiceProviderModel>();
    }

   void addNewProvider({required ServiceProviderModel model}) {
       _box.put(model);
       print("Result");
       print(_box.getAll().last);
   }
   Stream<List<ServiceProviderModel>> listenToPersonStore() async*{
     final queryBuilder = _box.query();
     final Stream<Query<ServiceProviderModel>> queryToWatch = queryBuilder.watch(triggerImmediately: true);
     Stream<List<ServiceProviderModel>> rowsInStream = queryToWatch.map((query) => query.find());
     yield* rowsInStream;
   }
}