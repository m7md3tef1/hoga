part of '../view.dart';

class Body extends StatelessWidget {
  var state;
  Body(this.state);
  bool subscription = true;
  @override
  Widget build(BuildContext context) {
    return
       state is GetSubscriptionLoading
             ?  SizedBox(
                 // width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.5,
                 child: const Center(
                     child: CircularProgressIndicator(
                   color: Colors.orange,
                 )),
               )
             :
       UpdateProfileCubit.get(context).unSubscribe?
       Container(
           height:500,child: UpgradeMember('',isSubscriptionPage: true,))
           :
                 CustomCard(
                   widget: Column(
                   children: [
                     Plans(),
                     const Details(),
                     const Facilities(),
                   ],
               ),
                 )

     ;
  }
}
