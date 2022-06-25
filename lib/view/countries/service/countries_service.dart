import 'package:covid_19_statistic/product/constant/get_storage.dart';
import 'package:covid_19_statistic/view/countries/model/countries.dart';
import 'package:dio/dio.dart';

import '../../../product/constant/api_constant.dart';

abstract class ICountriesService {
  Future<List<String>> getCountries();
  final dio = Dio();
}

class CountriesService extends ICountriesService {
  @override
   // ignore: missing_return
   Future<List<String>> getCountries() async {
    dio.options.headers[ApiConstant.headerHost] = ApiConstant.headerHostValue;
    dio.options.headers[ApiConstant.headerKey] = ApiConstant.headerKeyValue;
    final response =
        await dio.get('${ApiConstant.url}${ApiConstant.countries}');
    try {
      Countries countries = Countries.fromJson(response.data);
      box.write("key", countries.countryList.length);
      return countries.countryList;
    } catch (e) {
      NullThrownError();
    }
  }
}
