import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/models/card_model.dart';
import 'package:hoga_load/core/dialoges/toast.dart';

import '../../../core/data/api/api.dart';
import '../../../core/data/local/cacheHelper.dart';
import '../../../core/data/models/Card.dart';
import '../../../core/data/repository/package_repo.dart';
import '../../../core/keys/keys.dart';
import 'addCard_states.dart';

class AddCardCubit extends Cubit<AddCardStates> {
  AddCardCubit() : super(AddingCardLoading());

  static AddCardCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  Card profileData = Card();
  List<Card> profileData2 = [];
  addCard(CardModel cardModel) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        String token = await CacheHelper.getString(SharedKeys.token);
        print(cardModel.toJson());
         await Api().postHttp(
            url: 'payment-method/update',
            authToken: token,
            data: cardModel.toJson()).then((value) => {
              emit(AddingCardSuccess()),
           print('done'),
          showToast(msg: 'done', state: ToastedStates.SUCCESS)
        }).catchError((error, stackTrace) =>
        {emit(AddingCardFailed(error.toString())), print(error),           print('error'),

          showToast(msg: error.toString(), state: ToastedStates.ERROR)
        });


      }
    });
  }

  cancelCard() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        String token = await CacheHelper.getString(SharedKeys.token);
        return await Api().postHttp(
            url: "profile/current-subscription/cancel", authToken: token).then((value) => {
          emit(CancelCardSuccess()),
          print('done'),
          showToast(msg: 'done', state: ToastedStates.SUCCESS)
        }).catchError((error, stackTrace) =>
        {emit(CancelCardFailed(error.toString())), print(error),           print('error'),

          showToast(msg: error.toString(), state: ToastedStates.ERROR)
        });


      }
    });
  }
  getCardCubit() {
   // packageLoading=true;
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        emit(GetUserProfileLoading());
        PackageRepo.getCard()
            .then((value) => {
          print('..................................'),
          print(value),
          profileData2 = value,
       //   packageLoading=false,

          emit(GetUserProfileSuccess2(value))
        })
            .onError((error, stackTrace) =>
        {emit(GetUserProfileFailed(error.toString())),
      //    packageLoading=false,

          print(error)});
      }
    });
  }
  getCard() async {
    var token = await CacheHelper.getString(SharedKeys.token);
    emit(GetUserProfileLoading());
    var response = Api().getHttp(
      url:'payment-method',
      authToken: token,
    );

    print(response);
    response
        .then((value) => {
      print('**********'),
      print('card data'),

      print(value),
      profileData = Card.fromJson(value['record']),
      print(profileData),

      emit(GetUserProfileSuccess(Card.fromJson(value['record']))),
    })
        .catchError((error) => {
      emit(GetUserProfileFailed(error.toString())),
     showToast(msg: error.toString(), state: ToastedStates.ERROR),

      print(error),
    });
  }

}
