import 'package:dio/src/response.dart';
import 'package:technicaltask/model_layer/model.dart';
import 'package:technicaltask/shared/network/remote.dart';

class RestExhibitsLoader extends ExhibitsLoader {
  @override
  Future<List<Exhibit>> getExhibitList() async {
    Response res =
        await DioHelper.getData(url: 'Reyst/exhibit_db/list', query: null);
    print(res);
    List<Exhibit> allHabit = [];
    if (res.data != null) {
      for (int i = 0; i < res.data.length; i++) {
        allHabit.add(Exhibit.fromJson(res.data[i]));
      }
    }

    return allHabit;
  }
}
