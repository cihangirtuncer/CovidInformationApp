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
  Future<List<String>> getCountries() async {
    dio.options.headers['x-rapidapi-host'] = 'covid-193.p.rapidapi.com';
    dio.options.headers['x-rapidapi-key'] =
        '7230f0073fmsh19c10074c514c59p16793ejsn6aa0e35fe867';
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
