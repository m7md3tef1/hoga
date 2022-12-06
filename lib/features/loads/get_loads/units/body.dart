part of '../view.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  List titlesList = [
    'Available',
    'Origin',
    'State',
    'Destination',
    'State',
    'Type',
    'Size'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      child: Scrollbar(
        thickness: 15,
        trackVisibility: true,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Container(
                    height: 43.h,
                    width: 0.2.sw * 7,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 0.2.sw,
                            child: CustomText(
                              text: titlesList[index],
                              fontSize: 12.sp,
                              align: TextAlign.center,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 0.2.sw * 7,
                    child: BlocConsumer<LoadsCubit, AddLoadStates>(
                      builder: (context, state) {
                        if (state is GetSearchFailed) {
                          return Center(child: CustomText(text: state.msg));
                        } else if (state is GetSearchSuccess) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.loadList.length + 1,
                              itemBuilder: (context, index) {
                                if (index == state.loadList.length) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (LoadsCubit.get(context).page >
                                                1) {
                                              LoadsCubit.get(context)
                                                  .resetPage();
                                              LoadsCubit.get(context).getLoad(
                                                  pag: LoadsCubit.get(context)
                                                      .page,
                                                  val: LoadsCubit.get(context)
                                                      .searchValue);
                                            }
                                          },
                                          child: Icon(
                                            Icons.skip_previous_rounded,
                                            color:
                                                LoadsCubit.get(context).page > 1
                                                    ? Colors.grey[600]
                                                    : Colors.grey[400],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (LoadsCubit.get(context).page >
                                                1) {
                                              LoadsCubit.get(context)
                                                  .changePage(
                                                      LoadsCubit.get(context)
                                                              .page -
                                                          1);
                                              LoadsCubit.get(context).getLoad(
                                                  pag: LoadsCubit.get(context)
                                                      .page,
                                                  val: LoadsCubit.get(context)
                                                      .searchValue);
                                            }
                                          },
                                          child: Icon(
                                            Icons.chevron_left_outlined,
                                            color:
                                                LoadsCubit.get(context).page > 1
                                                    ? Colors.grey[600]
                                                    : Colors.grey[400],
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Container(
                                          height: 24,
                                          width: 24,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          child: Text(
                                            LoadsCubit.get(context)
                                                .page
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        InkWell(
                                          onTap: () {
                                            int page =
                                                LoadsCubit.get(context).page;

                                            if (LoadsCubit.get(context)
                                                    .loadList
                                                    .length
                                                    .remainder(10) ==
                                                0) {
                                              LoadsCubit.get(context)
                                                  .changePage(page + 1);

                                              LoadsCubit.get(context).getLoad(
                                                  pag: LoadsCubit.get(context)
                                                      .page,
                                                  val: LoadsCubit.get(context)
                                                      .searchValue);
                                            }
                                          },
                                          child: Icon(
                                            Icons.chevron_right_outlined,
                                            color: LoadsCubit.get(context)
                                                        .loadList
                                                        .length
                                                        .remainder(10) ==
                                                    0
                                                ? Colors.grey[600]
                                                : Colors.grey[400],
                                          ),
                                        ),
                                        Icon(
                                          Icons.skip_next,
                                          color: Colors.grey[400],
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  final load = state.loadList[index];
                                  return Container(
                                    color: index.isEven
                                        ? Colors.grey[300]
                                        : Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: InkWell(
                                        onTap: () {
                                          MagicRouter.navigateTo(Detail(load));
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              width: 0.2.sw,
                                              text: state.loadList[index]
                                                  .availabilityDate,
                                              align: TextAlign.center,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomText(
//                                height: 20.h,o
                                                width: 0.2.sw,
                                                text: state
                                                        .loadList[index]
                                                        .originCountry!
                                                        .title! ??
                                                    'other',
                                                align: TextAlign.center,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                            CustomText(
//                                  height: 20.h,
                                                width: 0.2.sw,
                                                text: state.loadList[index]
                                                            .originState ==
                                                        null
                                                    ? 'other'
                                                    : state.loadList[index]
                                                        .originState!.title!,
                                                align: TextAlign.center,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                            CustomText(
                                                width: 0.2.sw,
                                                text: state.loadList[index]
                                                            .destinationCity ==
                                                        null
                                                    ? 'other'
                                                    : state
                                                        .loadList[index]
                                                        .destinationCity!
                                                        .title!,
                                                fontSize: 12.sp,
                                                align: TextAlign.center,
                                                fontWeight: FontWeight.w500),
                                            CustomText(
                                                width: 0.2.sw,
//                                  height: 20.h,
                                                text: state.loadList[index]
                                                            .destinationState ==
                                                        null
                                                    ? 'other'
                                                    : state
                                                        .loadList[index]
                                                        .destinationState!
                                                        .title!,
                                                align: TextAlign.center,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                            CustomText(
//                                  height: 30.h,
                                                width: 0.2.sw,
                                                text: state.loadList[index]
                                                    .equipmentTypes2!
                                                    .toString(),
                                                align: TextAlign.center,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                            CustomText(
                                                width: 0.2.sw,
//                                  height: 20.h,
                                                text: state.loadList[index]
                                                    .vehicleSizes2!
                                                    .toString(),
                                                align: TextAlign.end,
                                                color: Colors.green,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              });
                        } else if (state is GetLoadsSuccess) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.loadList.length + 1,
                              itemBuilder: (context, index) {
                                print('llllllll');
                                if (index == state.loadList.length) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (LoadsCubit.get(context).page >
                                                1) {
                                              LoadsCubit.get(context)
                                                  .resetPage();
                                              LoadsCubit.get(context).getLoad(
                                                  pag: LoadsCubit.get(context)
                                                      .page);
                                            }
                                          },
                                          child: Icon(
                                            Icons.skip_previous_rounded,
                                            color:
                                                LoadsCubit.get(context).page > 1
                                                    ? Colors.grey[600]
                                                    : Colors.grey[400],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (LoadsCubit.get(context).page >
                                                1) {
                                              LoadsCubit.get(context)
                                                  .changePage(
                                                      LoadsCubit.get(context)
                                                              .page -
                                                          1);
                                              LoadsCubit.get(context).getLoad(
                                                  pag: LoadsCubit.get(context)
                                                      .page);
                                            }
                                          },
                                          child: Icon(
                                            Icons.chevron_left_outlined,
                                            color:
                                                LoadsCubit.get(context).page > 1
                                                    ? Colors.grey[600]
                                                    : Colors.grey[400],
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Container(
                                          height: 24,
                                          width: 24,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          child: Text(
                                            LoadsCubit.get(context)
                                                .page
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        InkWell(
                                          onTap: () {
                                            int page =
                                                LoadsCubit.get(context).page;

                                            if (LoadsCubit.get(context)
                                                    .loadList
                                                    .length
                                                    .remainder(10) ==
                                                0) {
                                              LoadsCubit.get(context)
                                                  .changePage(page + 1);

                                              LoadsCubit.get(context).getLoad(
                                                  pag: LoadsCubit.get(context)
                                                      .page);
                                            }
                                          },
                                          child: Icon(
                                            Icons.chevron_right_outlined,
                                            color: LoadsCubit.get(context)
                                                        .loadList
                                                        .length
                                                        .remainder(10) ==
                                                    0
                                                ? Colors.grey[600]
                                                : Colors.grey[400],
                                          ),
                                        ),
                                        Icon(
                                          Icons.skip_next,
                                          color: Colors.grey[400],
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  final load = state.loadList[index];
                                  return Container(
                                    color: index.isEven
                                        ? Colors.grey[300]
                                        : Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: InkWell(
                                        onTap: () {
                                          MagicRouter.navigateTo(Detail(load));
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              width: 0.2.sw,
                                              text: state.loadList[index]
                                                  .availabilityDate,
                                              align: TextAlign.center,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomText(
//                                height: 20.h,o
                                                width: 0.2.sw,
                                                text: state
                                                        .loadList[index]
                                                        .originCountry!
                                                        .title! ??
                                                    'other',
                                                align: TextAlign.center,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                            CustomText(
//                                  height: 20.h,
                                                width: 0.2.sw,
                                                text: state.loadList[index]
                                                            .originState ==
                                                        null
                                                    ? 'other'
                                                    : state.loadList[index]
                                                        .originState!.title!,
                                                align: TextAlign.center,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                            CustomText(
                                                width: 0.2.sw,
                                                text: state.loadList[index]
                                                            .destinationCity ==
                                                        null
                                                    ? 'other'
                                                    : state
                                                        .loadList[index]
                                                        .destinationCity!
                                                        .title!,
                                                fontSize: 12.sp,
                                                align: TextAlign.center,
                                                fontWeight: FontWeight.w500),
                                            CustomText(
                                                width: 0.2.sw,
//                                  height: 20.h,
                                                text: state.loadList[index]
                                                            .destinationState ==
                                                        null
                                                    ? 'other'
                                                    : state
                                                        .loadList[index]
                                                        .destinationState!
                                                        .title!,
                                                align: TextAlign.center,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                            CustomText(
//                                  height: 30.h,
                                                width: 0.2.sw,
                                                text: state
                                                        .loadList[index]
                                                        .equipmentTypes2!
                                                        .isEmpty
                                                    ? 'other'
                                                    : state.loadList[index]
                                                        .equipmentTypes2!
                                                        .toString(),
                                                align: TextAlign.center,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                            CustomText(
                                                width: 0.2.sw,
//                                  height: 20.h,
                                                text: state.loadList[index]
                                                        .vehicleSizes2!.isEmpty
                                                    ? 'other'
                                                    : state.loadList[index]
                                                        .vehicleSizes2!
                                                        .toString(),
                                                align: TextAlign.end,
                                                color: Colors.green,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              });
                        } else if (state is AddLoadLoading) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                print('llllllll');

                                return Container(
                                  color: index.isEven
                                      ? Colors.grey[300]
                                      : Colors.white,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                              enabled: true,
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[400]!,
                                              child: Container(
                                                  width: 0.2.sw,
                                                  height: 12.sp,
                                                  color: Colors.grey[300]),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                                enabled: true,
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[400]!,
                                                child: Container(
                                                    width: 0.2.sw,
                                                    height: 12.sp,
                                                    color: Colors.grey[300])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                                enabled: true,
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[400]!,
                                                child: Container(
                                                    width: 0.2.sw,
                                                    height: 12.sp,
                                                    color: Colors.grey[300])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                                enabled: true,
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[400]!,
                                                child: Container(
                                                    width: 0.2.sw,
                                                    height: 12.sp,
                                                    color: Colors.grey[300])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                                enabled: true,
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[400]!,
                                                child: Container(
                                                    width: 0.2.sw,
                                                    height: 12.sp,
                                                    color: Colors.grey[300])),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  LoadsCubit.get(context).loadList.length,
                              itemBuilder: (context, index) {
                                print('llllllll');
                                final load =
                                    LoadsCubit.get(context).loadList[index];
                                return Container(
                                  color: index.isEven
                                      ? Colors.grey[300]
                                      : Colors.white,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: InkWell(
                                      onTap: () {
                                        MagicRouter.navigateTo(Detail(load));
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            width: 0.2.sw,
                                            text: LoadsCubit.get(context)
                                                .loadList[index]
                                                .availabilityDate,
                                            align: TextAlign.center,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          CustomText(
//                                height: 20.h,o
                                              width: 0.2.sw,
                                              text: LoadsCubit.get(context)
                                                          .loadList[index]
                                                          .originCity ==
                                                      null
                                                  ? 'other'
                                                  : LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .originCity!
                                                      .title!
                                                      .toString(),
                                              //   text: '',

                                              align: TextAlign.center,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
//                                  height: 20.h,
                                              width: 0.2.sw,
                                              text: LoadsCubit.get(context)
                                                          .loadList[index]
                                                          .originState ==
                                                      null
                                                  ? 'other'
                                                  : LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .originState!
                                                      .title!
                                                      .toString(),
                                              align: TextAlign.center,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
                                              text: LoadsCubit.get(context)
                                                          .loadList[index]
                                                          .destinationCity ==
                                                      null
                                                  ? 'other'
                                                  : LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .destinationCity!
                                                      .title!
                                                      .toString(),
                                              fontSize: 12.sp,
                                              align: TextAlign.center,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
//                                  height: 20.h,
                                              text: LoadsCubit.get(context)
                                                          .loadList[index]
                                                          .destinationState ==
                                                      null
                                                  ? 'other'
                                                  : LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .destinationState!
                                                      .title!
                                                      .toString(),
                                              align: TextAlign.center,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
//                                  height: 30.h,
                                              width: 0.2.sw,
                                              text: LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .equipmentTypes!
                                                      .first
                                                      .title ??
                                                  'other',
                                              align: TextAlign.end,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                          CustomText(
                                              width: 0.2.sw,
//                                  height: 20.h,
                                              text: LoadsCubit.get(context)
                                                              .loadList[index]
                                                              .vehicleSizes !=
                                                          null &&
                                                      LoadsCubit.get(context)
                                                          .loadList[index]
                                                          .vehicleSizes!
                                                          .isNotEmpty
                                                  ? LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .vehicleSizes!
                                                      .first
                                                      .title
                                                  : 'other',
                                              align: TextAlign.end,
                                              color: Colors.green,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                      listener: (BuildContext context, Object? state) {},
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*

BlocConsumer<LoadsCubit, AddLoadStates>(
        listener: (context, state) {},
        builder: (context, state) {

          if (state is GetSearchFailed) {
            return Center(child: CustomText(text: state.msg));
          } else if (state is GetSearchSuccess) {
            return Container(
              height: .9.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DataTable2(
                    columnSpacing: 1,
                    horizontalMargin: 0,
                    dataRowHeight:
                        state.loadList.length >= 10 ? .06.sh : .09.sh,
                    minWidth: 890,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Available')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Origin')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Destination')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Size')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        state.loadList.length,
                        (index) => DataRow(

                                color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                        ? const Color(0xFFE0E0E0)
                                        : Colors.white),
                                cells: [
                                  DataCell(Center(
                                      child: Text(state
                                          .loadList[index].availabilityDate!))),
                                  DataCell(Center(
                                      child: Text(state.loadList[index]
                                          .originCountry!.title!))),
                                  DataCell(Center(
                                      child: Text(state.loadList[index]
                                          .originState!.title!))),
                                  DataCell(Center(
                                      child: Text(state.loadList[index]
                                                  .destinationCity ==
                                              null
                                          ? 'other'
                                          : state.loadList[index]
                                              .destinationCity!.title!))),
                                  DataCell(Center(
                                      child: Text(state.loadList[index]
                                          .destinationState!.title!))),
                                  DataCell(Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: state.loadList[index]
                                              .equipmentTypes?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(state.loadList[index]
                                                  .equipmentTypes![i].title
                                                  .toString()))),
                                    ),
                                  ))),
                                  DataCell(Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: state.loadList[index]
                                              .vehicleSizes?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(state
                                                      .loadList[index]
                                                      .vehicleSizes![i]
                                                      .title!
                                                      .isEmpty
                                                  ? 'other'
                                                  : state.loadList[index]
                                                      .vehicleSizes![i].title
                                                      .toString()))),
                                    ),
                                  ))),
                                ]))),
              ),
            );
          } else if (state is AddLoadLoading) {
            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                 Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
              ],
            );
          } else if (state is GetLoadsSuccess)  {
            return Container(
              height: .9.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DataTable2(
                    columnSpacing: 1,
                    horizontalMargin: 0,
                    dataRowHeight: LoadsCubit.get(context).loadList.length >= 10
                        ? .06.sh
                        : .09.sh,
                    minWidth: 890,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Available')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Origin')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Destination')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Size')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        LoadsCubit.get(context).loadList.length,
                        (index) => DataRow(
                                color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                        ? const Color(0xFFE0E0E0)
                                        : Colors.white),
                                cells: [
                                  DataCell(Center(
                                      child: Text(LoadsCubit.get(context)
                                          .loadList[index]
                                          .availabilityDate!))),
                                  DataCell(Center(
                                      child: Text(LoadsCubit.get(context)
                                          .loadList[index]
                                          .originCountry!
                                          .title!))),
                                  DataCell(Center(
                                      child: Text(LoadsCubit.get(context)
                                          .loadList[index]
                                          .originState!
                                          .title!))),
                                  DataCell(Center(
                                      child: Text(state.loadList[index]
                                          .destinationCity ==
                                          null
                                          ? 'other'
                                          : state.loadList[index]
                                          .destinationCity!.title!))),
                                  DataCell(Center(
                                      child: Text(LoadsCubit.get(context)
                                          .loadList[index]
                                          .destinationState!
                                          .title!))),
                                  DataCell(Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: LoadsCubit.get(context)
                                              .loadList[index]
                                              .equipmentTypes
                                              ?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(
                                                  LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .equipmentTypes![i]
                                                      .title
                                                      .toString()))),
                                    ),
                                  ))),
                                  DataCell(Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: LoadsCubit.get(context)
                                              .loadList[index]
                                              .vehicleSizes
                                              ?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(
                                                  LoadsCubit.get(context)
                                                              .loadList[index]
                                                              .vehicleSizes ==
                                                          null
                                                      ? 'other'
                                                      : LoadsCubit.get(context)
                                                          .loadList[index]
                                                          .vehicleSizes![i]
                                                          .title!))),
                                    ),
                                  ))),
                                ]))),
              ),
            );
          } else{
          return  Container(
              height: .9.sh,
              width: 1.sw,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: DataTable2(
                    columnSpacing: 1,
                    horizontalMargin: 0,
                    dataRowHeight: LoadsCubit.get(context).loadList.length >= 10
                        ? .06.sh
                        : .09.sh,
                    minWidth: 890,
                    columns: const [
                      DataColumn2(
                        label: Center(child: Text('Available')),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Center(child: Text('Origin')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Destination')),
                      ),
                      DataColumn(
                        label: Center(child: Text('State')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Type')),
                      ),
                      DataColumn(
                        label: Center(child: Text('Size')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        LoadsCubit.get(context).loadList.length,
                            (index) => DataRow(
                            color: MaterialStateColor.resolveWith(
                                    (states) => index.isEven
                                    ? const Color(0xFFE0E0E0)
                                    : Colors.white),
                            cells: [
                              DataCell(Center(
                                  child: Text(LoadsCubit.get(context)
                                      .loadList[index]
                                      .availabilityDate!))),
                              DataCell(Center(
                                  child: Text(LoadsCubit.get(context)
                                      .loadList[index]
                                      .originCountry!
                                      .title!))),
                              DataCell(Center(
                                  child: Text(LoadsCubit.get(context)
                                      .loadList[index]
                                      .originState!
                                      .title!))),
                              DataCell(Center(
                                  child: Text(LoadsCubit.get(context).loadList[index]
                                      .destinationCity ==
                                      null
                                      ? 'other'
                                      : LoadsCubit.get(context).loadList[index]
                                      .destinationCity!.title!))),
                              DataCell(Center(
                                  child: Text(LoadsCubit.get(context)
                                      .loadList[index]
                                      .destinationState!
                                      .title!))),
                              DataCell(Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          itemCount: LoadsCubit.get(context)
                                              .loadList[index]
                                              .equipmentTypes
                                              ?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(
                                                  LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .equipmentTypes![i]
                                                      .title
                                                      .toString()))),
                                    ),
                                  ))),
                              DataCell(Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                      child: ListView.builder(
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          itemCount: LoadsCubit.get(context)
                                              .loadList[index]
                                              .vehicleSizes
                                              ?.length,
                                          itemBuilder: (context, i) => Center(
                                              child: Text(
                                                  LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .vehicleSizes ==
                                                      null
                                                      ? 'other'
                                                      : LoadsCubit.get(context)
                                                      .loadList[index]
                                                      .vehicleSizes![i]
                                                      .title!))),
                                    ),
                                  ))),
                            ]))),
              ),
            );
          }
        });

 */
