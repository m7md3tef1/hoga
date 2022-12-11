import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoga_load/core/data/models/Packages.dart';
import 'package:hoga_load/core/data/repository/vehicle_repo.dart';
import 'package:hoga_load/features/packages/cubit/package_states.dart';

import '../../../core/data/repository/plans_repo.dart';
import '../../../core/dialoges/toast.dart';

class PackageCubit extends Cubit<PackageStates> {
  PackageCubit() : super(PackageLoading());

  static PackageCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  List<Packages> packageList = [];
  int selectedPackage = 0;
  changeSelectedPackage(int index) {
    print(index);
    selectedPackage = index;
    emit(GetPackageSuccess(packageList));
  }

  getPackageCubit() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        VehicleRepo.getPackage()
            .then((value) => {
                  print('..................................'),
                  print(value),
                  packageList = value,
                  emit(GetPackageSuccess(value))
                })
            .onError((error, stackTrace) =>
                {emit(GetPackageFailed(error.toString())), print(error)});
      }
    });
  }

  subscribePackage(id,{firstDate,endDate}) {
    emit(PackageSubscribeLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
      } else {
        PlansRepo.subscribePackage(id,fistDate: firstDate,endDate: endDate)
            .then((value) => {
          print('..................................'),
          print("this value--------Plans"),
          print(value),
          emit(PackageSubscribeSuccess()),
          showToast(msg: 'Done', state: ToastedStates.SUCCESS),

        })
            .catchError((error) =>
        {emit(PackageSubscribeFailed()),
          showToast(msg: error.toString(), state: ToastedStates.ERROR),
          print(error)});
      }
    });
  }

}
