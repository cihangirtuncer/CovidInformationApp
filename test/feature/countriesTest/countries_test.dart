import 'package:covid_19_statistic/view/countries/service/countries_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ICountriesService countriesService;
  setUp(() {
    countriesService = CountriesService();
  });

  group("COUNTRIES DATAS TEST/", (){
test(" countries data is not null ", () async {
    final listDatas = await countriesService.getCountries();
    expect(listDatas, isNotNull);
  });

  test(" countries data list 235 length ", () async {
    final listDatas = await countriesService.getAllCountriesCounterForTesting();
    expect(listDatas, 235);
  });

  });
  
  tearDown( (){
    countriesService.dio.close();
  }
    
  );
}
