import '../../keys/keys.dart';
import '../api/api.dart';
import '../local/cacheHelper.dart';
import '../models/Packages.dart';
import '../models/Packages_detail.dart';

class PackageRepo{
  // static Future< List <Packages>>  getPackage()async{
  //   var response= await Api().getHttp(url: 'advertisement-packages');
  //
  //   List<Packages>packageList=[];
  //   for(int i =0;i<response['records'].length;i++){
  //     Packages blogModel=Packages.fromJson(response['records'][i]);
  //     packageList.add(blogModel);
  //
  //   }
  //   print(response.length);
  //   print(packageList.length);
  //
  //   return packageList;
  //
  //
  // }
  static SubscribePackageTest({context}) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    print( token);
    return await Api().getHttp(url: "profile/advertisement-subscription", authToken: token);
  }
  static Future<List<Packages>> getPackage() async {
    String token = await CacheHelper.getString(SharedKeys.token);
    var response =
    await Api().getHttp(url: 'advertisement-packages', authToken: token);

    List<Packages> packageList = [];
    for (int i = 0; i < response['records'].length; i++) {
      Packages blogModel = Packages.fromJson(response['records'][i]);
      packageList.add(blogModel);
    }
    print(response.length);
    print(packageList.length);

    return packageList;
  }

  static Future<List<PackagesDetail>> package() async {
    String token = await CacheHelper.getString(SharedKeys.token);
    var response =
    await Api().getHttp(url: 'advertisements', authToken: token);

    List<PackagesDetail> packageList = [];
    for (int i = 0; i < response['records'].length; i++) {
      PackagesDetail blogModel = PackagesDetail.fromJson(response['records'][i]);
      packageList.add(blogModel);
    }
    print(response.length);
    print(packageList.length);

    return packageList;
  }
  static Future<List<PackagesDetail>> uploadPackage(PackagesDetail? model) async {
    String token = await CacheHelper.getString(SharedKeys.token);
    var response =
    await Api().postHttp(url: 'upload-advertisement', authToken: token,data: model);

    List<PackagesDetail> packageList = [];
    for (int i = 0; i < response['records'].length; i++) {
      PackagesDetail blogModel = PackagesDetail.fromJson(response['records'][i]);
      packageList.add(blogModel);
    }
    print(response.length);
    print(packageList.length);

    return packageList;
  }

}