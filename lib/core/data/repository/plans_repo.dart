
import 'package:hoga_load/core/data/models/plans/plans_model.dart';
import 'package:hoga_load/features/plans/cubit/plans_cubit.dart';
import '../api/api.dart';

class PlansRepo{
  static Future< List <PlansModel>>  getPlans(isFreeTrial)async{
    var response= await Api().getHttp(url: 'subscription-plans');

    List<PlansModel>plansList=[];

    for(int i =0;i<response['records'].length;i++){
      print('freeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
//      print(response['records'][i]['name']);
//      print(response['records'][i]['name'].contains('Free Trial'));
//      print(isFreeTrial);


//
//      if(isFreeTrial==false&&!response['records'][i]['name'].contains('Free Trial')){
//        print('freeeeeeeeeeeeeeeeeeeeeeeeeeeeee22');
//        PlansModel plansModel=PlansModel.fromJson(response['records'][i]);
//        plansList.add(plansModel);
//      }
     // else{
        print('freeeeeeeeeeeeeeeeeeeeeeeeeeeeee11');

        PlansModel plansModel=PlansModel.fromJson(response['records'][i]);
        plansList.add(plansModel);
      }


   // }
    print(response.length);
    print(plansList.length);

    return plansList;


  }


}