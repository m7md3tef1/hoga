part of '../view.dart';

class FormCard extends StatefulWidget {
  const FormCard({Key? key}) : super(key: key);

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  var countryOrigin;
  var countryCode = 0;
  var stateOrigin ;
  var stateCode = 0;
  var cityOrigin ;
  var cityCode = 0;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardNumberController.text =
    AddCardCubit.get(context).profileData.cardDetails==null?'':AddCardCubit.get(context).profileData.cardDetails!.cardNumber.toString();
cityOrigin=
AddCardCubit.get(context).profileData.billingDetails==null?'Select a city': AddCardCubit.get(context).profileData.billingDetails!.city!.title.toString();
    countryOrigin=
    AddCardCubit.get(context).profileData.billingDetails==null?'Select a country':   AddCardCubit.get(context).profileData.billingDetails!.country!.title.toString();
    stateOrigin=
    AddCardCubit.get(context).profileData.billingDetails==null?'Select a state':  AddCardCubit.get(context).profileData.billingDetails!.state!.title.toString();
    monthController.text =
    AddCardCubit.get(context).profileData.cardDetails==null?'':   AddCardCubit.get(context).profileData.cardDetails!.month.toString();
    yearController.text =
    AddCardCubit.get(context).profileData.cardDetails==null?'':   AddCardCubit.get(context).profileData.cardDetails!.year.toString() ;
    nameController.text =
    AddCardCubit.get(context).profileData.billingDetails==null?'':   AddCardCubit.get(context).profileData.billingDetails!.name.toString();
    emailController.text =
    AddCardCubit.get(context).profileData.billingDetails==null?'':  AddCardCubit.get(context).profileData.billingDetails!.email.toString() ;
    contactNumberController.text =
    AddCardCubit.get(context).profileData.userDetails==null?'':  AddCardCubit.get(context).profileData.userDetails!.contactNumber.toString() ;
    addressController.text =
    AddCardCubit.get(context).profileData.billingDetails==null?'':    AddCardCubit.get(context).profileData.billingDetails!.addressLine1.toString();
    postalCodeController.text =
    AddCardCubit.get(context).profileData.billingDetails==null?'': AddCardCubit.get(context).profileData.billingDetails!.postalCode.toString();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      widget: BlocConsumer<DataFormCubit, AddDataFormStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            print(cardNumberController.text);
            cardNumberController.text =
            AddCardCubit.get(context).profileData.cardDetails==null?'':AddCardCubit.get(context).profileData.cardDetails!.cardNumber.toString();
            cityOrigin=
            AddCardCubit.get(context).profileData.billingDetails==null?'Select a city': AddCardCubit.get(context).profileData.billingDetails!.city!.title.toString();
            countryOrigin=
            AddCardCubit.get(context).profileData.billingDetails==null?'Select a country':   AddCardCubit.get(context).profileData.billingDetails!.country!.title.toString();
            stateOrigin=
            AddCardCubit.get(context).profileData.billingDetails==null?'Select a state':  AddCardCubit.get(context).profileData.billingDetails!.state!.title.toString();
            monthController.text =
            AddCardCubit.get(context).profileData.cardDetails==null?'':   AddCardCubit.get(context).profileData.cardDetails!.month.toString();
            yearController.text =
            AddCardCubit.get(context).profileData.cardDetails==null?'':   AddCardCubit.get(context).profileData.cardDetails!.year.toString() ;
            nameController.text =
            AddCardCubit.get(context).profileData.billingDetails==null?'':   AddCardCubit.get(context).profileData.billingDetails!.name.toString();
            emailController.text =
            AddCardCubit.get(context).profileData.billingDetails==null?'':  AddCardCubit.get(context).profileData.billingDetails!.email.toString() ;
            contactNumberController.text =
            AddCardCubit.get(context).profileData.userDetails==null?'':  AddCardCubit.get(context).profileData.userDetails!.contactNumber.toString() ;
            addressController.text =
            AddCardCubit.get(context).profileData.billingDetails==null?'':    AddCardCubit.get(context).profileData.billingDetails!.addressLine1.toString();
            postalCodeController.text =
            AddCardCubit.get(context).profileData.billingDetails==null?'': AddCardCubit.get(context).profileData.billingDetails!.postalCode.toString();

            return BlocConsumer<AddCardCubit,AddCardStates>(
              listener: (context,state){},
              builder:(context,state){
                print(cardNumberController.text);
                cardNumberController.text =
                AddCardCubit.get(context).profileData.cardDetails==null?'':AddCardCubit.get(context).profileData.cardDetails!.cardNumber.toString();
                cityOrigin=
                AddCardCubit.get(context).profileData.billingDetails==null?'Select a city': AddCardCubit.get(context).profileData.billingDetails!.city!.title.toString();
                countryOrigin=
                AddCardCubit.get(context).profileData.billingDetails==null?'Select a country':   AddCardCubit.get(context).profileData.billingDetails!.country!.title.toString();
                stateOrigin=
                AddCardCubit.get(context).profileData.billingDetails==null?'Select a state':  AddCardCubit.get(context).profileData.billingDetails!.state!.title.toString();
                monthController.text =
                AddCardCubit.get(context).profileData.cardDetails==null?'':   AddCardCubit.get(context).profileData.cardDetails!.month.toString();
                yearController.text =
                AddCardCubit.get(context).profileData.cardDetails==null?'':   AddCardCubit.get(context).profileData.cardDetails!.year.toString() ;
                nameController.text =
                AddCardCubit.get(context).profileData.billingDetails==null?'':   AddCardCubit.get(context).profileData.billingDetails!.name.toString();
                emailController.text =
                AddCardCubit.get(context).profileData.billingDetails==null?'':  AddCardCubit.get(context).profileData.billingDetails!.email.toString() ;
                contactNumberController.text =
                AddCardCubit.get(context).profileData.userDetails==null?'':  AddCardCubit.get(context).profileData.userDetails!.contactNumber.toString() ;
                addressController.text =
                AddCardCubit.get(context).profileData.billingDetails==null?'':    AddCardCubit.get(context).profileData.billingDetails!.addressLine1.toString();
                postalCodeController.text =
                AddCardCubit.get(context).profileData.billingDetails==null?'': AddCardCubit.get(context).profileData.billingDetails!.postalCode.toString();
                return
                  state is GetUserProfileLoading?
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: CircularProgressIndicator(color: Colors.orange,),),
                      ],
                    ),
                  )
                 :Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15.h),
                                  child: CustomText(
                                    text: 'ENTER CARD INFORMATION',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 9.h, bottom: 14.h),
                                  child: CustomText(
                                    text: 'Add a Payment Method',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 1.sw,
                          child: const Divider(
                            thickness: 1,
                          ),
                        ),
                        CustomTextField(
                          controller: cardNumberController,
                       //   hintText: '4242-4242-4242-4242',
                          color: ColorManager.darkGrey,
                          maxLength: 16,
                          keyboardType: TextInputType.number,
                          validate: Validator.validateEmpty,
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 14.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  // height: 55.h,
                                  // width: 155.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      border:
                                      Border.all(color: ColorManager.greyColor)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsets.only(left: 14.0.w, bottom: 0.h),
                                        child: TextFormField(
                                            autofocus: false,
                                            controller: monthController,
                                            validator: Validator.validateEmpty,

                                            textDirection: TextDirection.ltr,
                                            keyboardType: TextInputType.number,
                                            maxLength: 2,
                                            buildCounter: (context,
                                                {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                            null,
                                            decoration: InputDecoration(
                                            //  hintText: '03',
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: ColorManager.darkGrey,
                                              ),
                                              border: InputBorder.none,
                                              focusColor: ColorManager.blackColor,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
                              Expanded(
                                child: Container(
                                  //height: 55.h,
                                  //width: 155.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      border:
                                      Border.all(color: ColorManager.greyColor)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsets.only(left: 14.0.w, bottom: 0.h),
                                        child: TextFormField(
                                            autofocus: false,
                                            textDirection: TextDirection.ltr,
                                            keyboardType: TextInputType.number,
                                            controller: yearController,
                                            validator: Validator.validateEmpty,

                                            maxLength: 4,
                                            buildCounter: (context,
                                                {required currentLength,
                                                  required isFocused,
                                                  maxLength}) {
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                           //   hintText: '2026',
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: ColorManager.darkGrey,
                                              ),
                                              border: InputBorder.none,
                                              focusColor: ColorManager.blackColor,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 14.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  //height: 55.h,
                                  //width: 155.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      border:
                                      Border.all(color: ColorManager.greyColor)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsets.only(left: 14.0.w, bottom: 0.h),
                                        child: TextFormField(
                                            autofocus: false,
                                            textDirection: TextDirection.ltr,
                                            keyboardType: TextInputType.number,
                                            controller: cvvController,
                                            validator: Validator.validateEmpty,

                                            maxLength: 3,
                                            buildCounter: (context,
                                                {required currentLength,
                                                  required isFocused,
                                                  maxLength}) {
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'CVV',
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: ColorManager.darkGrey,
                                              ),
                                              border: InputBorder.none,
                                              focusColor: ColorManager.blackColor,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/Credit_Card_01.svg',
                                      color: const Color(0xFF3D3D3D),
                                    ),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      //height: 24.h,
                                      //width: 114.w,
                                      child: CustomText(
                                        color: const Color(0xFF3D3D3D),
                                        align: TextAlign.start,
                                        text:
                                        '3 digits can be found onthe signature strip.',
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomTextField(
                          controller: nameController,
                      //    hintText: 'Name',
                          validate: Validator.validateEmpty,

                          color: ColorManager.darkGrey,
                        ),
                        CustomTextField(
                          controller: emailController,
                      //    hintText: 'Email',
                          validate: Validator.validateEmpty,

                          color: ColorManager.darkGrey,
                        ),
                        CustomTextField(
                          controller: contactNumberController,
                      //    hintText: 'Phone',

                          validate: Validator.validateEmpty,

                          color: ColorManager.darkGrey,
                        ),
                        CustomTextField(
                          controller: addressController,
                         // hintText: 'Address 1',
                          color: ColorManager.darkGrey,
                          validate: Validator.validateEmpty,

                        ),
                        CustomTextField(
                         // controller: countryOrigin.toString(),
                            hintText: countryOrigin == '' ? 'Select a state' : countryOrigin,
                            readOnly: true,
                            color: ColorManager.darkGrey,
                            suffixIcon: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ListView.builder(
                                        itemCount: DataFormCubit.get(context)
                                            .countryList
                                            .length,
                                        itemBuilder: (context, index) => Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  countryOrigin =
                                                  DataFormCubit.get(context)
                                                      .countryList[index]
                                                      .title!;
                                                  countryCode =
                                                  DataFormCubit.get(context)
                                                      .countryList[index]
                                                      .id!;
                                                  Navigator.of(context).pop();
                                                  DataFormCubit.get(context)
                                                      .countryOriginID =
                                                      DataFormCubit.get(context)
                                                          .countryList[index]
                                                          .id!
                                                          .toString();
                                                });
                                                DataFormCubit.get(context).getState(
                                                    DataFormCubit.get(context)
                                                        .countryList[index]
                                                        .id!);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: DataFormCubit.get(context)
                                                    .countryList[index]
                                                    .title ==
                                                    null
                                                    ? const Center(
                                                  child:
                                                  CircularProgressIndicator(
                                                    color: Colors.orange,
                                                  ),
                                                )
                                                    : Text(
                                                  DataFormCubit.get(context)
                                                      .countryList[index]
                                                      .title!,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.sp),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                );
                              },
                              child: Icon(
                                Icons.expand_more,
                                size: 30.sp,
                                color: ColorManager.blackColor,
                              ),
                            )),
                        state is GetStateLoading
                            ? CustomText(
                          text: 'Loading....',
                        )
                            : CustomTextField(
                            readOnly: true,
                            color: ColorManager.darkGrey,
                           // controller: stateOrigin.toString(),
                            hintText: stateOrigin == '' ? 'Select a state' : stateOrigin,
                            suffixIcon: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ListView.builder(
                                        itemCount: DataFormCubit.get(context)
                                            .stateList
                                            .length,
                                        itemBuilder: (context, index) => Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  stateOrigin =
                                                  DataFormCubit.get(context)
                                                      .stateList[index]
                                                      .title!;
                                                  stateCode =
                                                  DataFormCubit.get(context)
                                                      .stateList[index]
                                                      .id!;
                                                  Navigator.of(context).pop();
                                                  DataFormCubit.get(context)
                                                      .stateOriginID =
                                                      DataFormCubit.get(context)
                                                          .stateList[index]
                                                          .id!
                                                          .toString();
                                                });
                                                print('sssssssss');
                                                DataFormCubit.get(context)
                                                    .getCity(DataFormCubit.get(
                                                    context)
                                                    .stateList[index]
                                                    .title!);
                                              },
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: DataFormCubit.get(
                                                    context)
                                                    .stateList[index]
                                                    .title ==
                                                    null
                                                    ? const Center(
                                                  child:
                                                  CircularProgressIndicator(
                                                    color: Colors.orange,
                                                  ),
                                                )
                                                    : Text(
                                                  DataFormCubit.get(
                                                      context)
                                                      .stateList[index]
                                                      .title!,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.sp),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                );
                              },
                              child: Icon(
                                Icons.expand_more,
                                size: 30.sp,
                                color: ColorManager.blackColor,
                              ),
                            )),
                        state is GetCityLoading
                            ? CustomText(
                          text: 'Loading....',
                        )
                            : CustomTextField(
                            readOnly: true,
                          //  controller: cityOrigin.toString(),
                            hintText: cityOrigin=='' ? 'Select a city' :cityOrigin,
                            color: ColorManager.darkGrey,
                            suffixIcon: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ListView.builder(
                                        itemCount: DataFormCubit.get(context)
                                            .cityList
                                            .length,
                                        itemBuilder: (context, index) => Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  cityOrigin =
                                                  DataFormCubit.get(context)
                                                      .cityList[index]
                                                      .title!;
                                                  cityCode =
                                                  DataFormCubit.get(context)
                                                      .cityList[index]
                                                      .id!;
                                                  Navigator.of(context).pop();
                                                  DataFormCubit.get(context)
                                                      .cityOriginID =
                                                      DataFormCubit.get(context)
                                                          .cityList[index]
                                                          .id!
                                                          .toString();
                                                });
                                              },
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: DataFormCubit.get(
                                                    context)
                                                    .cityList[index]
                                                    .title ==
                                                    null
                                                    ? const Center(
                                                  child:
                                                  CircularProgressIndicator(
                                                    color: Colors.orange,
                                                  ),
                                                )
                                                    : Text(
                                                  DataFormCubit.get(
                                                      context)
                                                      .cityList[index]
                                                      .title!,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.sp),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                );
                              },
                              child: Icon(
                                Icons.expand_more,
                                size: 30.sp,
                                color: ColorManager.blackColor,
                              ),
                            )),
                        CustomTextField(
                   //       hintText: 'Postal Code',
                          controller: postalCodeController,
                          color: ColorManager.darkGrey,
                          validate: Validator.validateEmpty,

                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 11.w, right: 14.w, top: 17.h),
                          child: CustomText(
                            color: const Color(0xFF666666),
                            align: TextAlign.center,
                            text:
                            'We do NOT store your card details, it will be used as your payment method for subscription.',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        CustomButton(
                            text: 'PROCEED',
                            colortext: Colors.white,
                            function: () {
                              print("PROCEED");
                              if (formKey.currentState!.validate()) {
                                AddCardCubit.get(context).addCard(CardModel(
                                    cardNumberController.text,
                                    int.parse(monthController.text),
                                    int.parse(yearController.text),
                                    int.parse(cvvController.text),
                                    countryCode,
                                    stateCode,
                                    cityCode,
                                    nameController.text,
                                    emailController.text,
                                    contactNumberController.text,
                                    addressController.text,
                                    postalCodeController.text));

                              }

                            },
                            font: 15.sp,
                            color: ColorManager.primaryColor),
                        SizedBox(
                          height: 14.h,
                        ),
                        CustomButton(
                            function: (){
                              AddCardCubit.get(context).cancelCard();

                            },
                            text: 'REMOVE THIS PAYMENT METHOD',
                            colortext: Colors.white,
                            font: 14.sp,
                            color: const Color(0xFFDC3545)),
                        SizedBox(
                          height: 18.h,
                        ),
                        SizedBox(
                          width: 322.h,
                          child: const Divider(
                            thickness: 1,
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        InkWell(
                          onTap: (){
                            MagicRouter.navigateTo( Home());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: 'Skip',
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600,
                                      color:  const Color(0xFF0D6EFD),
                                    ),
                                    const Icon(
                                      Icons.keyboard_double_arrow_right_outlined,
                                      color: Color(0xFF0D6EFD),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                      ],
                    ),
                  );
              }
            );
          }),
    );
  }
}
