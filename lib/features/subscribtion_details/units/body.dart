part of '../view.dart';

class Body extends StatelessWidget {
  var state;
  Body(this.state);
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget:  state is GetSubscriptionLoading
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.orange,
                )),
              )
            : Column(
                children: [
                  Plans(),
                  const Details(),
                  const Facilities(),
                ],
              ),

    );
  }
}
