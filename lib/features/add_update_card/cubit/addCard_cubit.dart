import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/models/card_model.dart';
import 'package:hoga_load/core/dialoges/toast.dart';

import '../../../core/data/api/api.dart';
import '../../../core/data/local/cacheHelper.dart';
import '../../../core/keys/keys.dart';
import 'addCard_states.dart';

class AddCardCubit extends Cubit<AddCardStates> {
  AddCardCubit() : super(AddingCardLoading());

  static AddCardCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();

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

}
