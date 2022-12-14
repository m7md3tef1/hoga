part of '../view.dart';

class Body extends StatelessWidget {
  var state;
  Body(this.state);
  bool subscription = true;
  @override
  Widget build(BuildContext context) {
    return  Container(
        height:500,child: UpgradeMember('',isSubscriptionPage: true,));


    //   state is GetSubscriptionLoading
    //         ? const Expanded(
    //             // width: MediaQuery.of(context).size.width,
    //             // height: MediaQuery.of(context).size.height,
    //             child: Center(
    //                 child: CircularProgressIndicator(
    //               color: Colors.orange,
    //             )),
    //           )
    //         :
    //   UpdateProfileCubit.get(context).unSubscribe?
    //       Expanded(child: Upgrade())
    //       :
    //             CustomCard(
    //               widget: Column(
    //               children: [
    //                 Plans(),
    //                 const Details(),
    //                 const Facilities(),
    //               ],
    //           ),
    //             )
    //
    // ;
  }
}
