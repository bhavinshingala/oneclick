import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:oneclick_webearl_interview_project/widgets/Common_linear_button.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:sizer/sizer.dart';

import '../widgets/CommonAppbar.dart';
import '../widgets/common_text_view.dart';
import '../widgets/constants.dart';
import 'home_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late int selectedPage;
  late final PageController _pageController;
  bool ReadMoreText = false;
  bool isLiked = false;

  int selectedValue = 1;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const pageCount = 5;
    final ScrollController _controllerOne = ScrollController();
    if (_controllerOne.hasClients)
      _controllerOne.jumpTo(50.0);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CommonAppbar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/corner_up_left.png",
              height: 30,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/corner-up-right_app.png",
                height: 30,
              ))
        ],
        title: CommonTextView("Men’s shoes",
            color: darkTealColor, fontSize: 14.sp),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      /// product Images
                      Container(
                        color: Colors.white,
                        height: 50.h,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (page) {
                            setState(() {
                              selectedPage = page;
                            });
                          },
                          children: List.generate(pageCount, (index) {
                            return Image.asset("assets/red_shoes_big.png");
                          }),
                        ),
                      ),

                      /// Dots
                      PageViewDotIndicator(
                        currentItem: selectedPage,
                        count: pageCount,
                        unselectedColor: indicatorColor,
                        selectedColor: darkTealColor,
                        duration: const Duration(milliseconds: 200),
                        boxShape: BoxShape.circle,
                        size: Size(8, 8),
                        margin: EdgeInsets.only(left: 1),
                        onItemClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 55.h),
                    padding: EdgeInsets.only(left: 8.w, top: 8.w,bottom:8.w,right : 8.w),
                    height: 90.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: indicatorColor,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 1), // changes the shadow position
                          ),
                        ],
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: ScrollbarTheme(
                      data: ScrollbarThemeData(
                        interactive: true,
                        thumbColor: MaterialStatePropertyAll(darkTealColor),
                        trackColor: MaterialStatePropertyAll(greenColor.withOpacity(.5)),
                      ),
                      child: Scrollbar(
                        thumbVisibility: true,
                        trackVisibility: true,
                        controller: _controllerOne,
                        scrollbarOrientation: ScrollbarOrientation.right,
                        thickness: 4,
                        radius: Radius.circular(10),
                        child: SingleChildScrollView(
                          controller: _controllerOne,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Product Name
                              Row(
                                children: [
                                  Container(
                                      width: 38.w,
                                      child: CommonTextView(
                                        "Round toe leather loafer shoe(Black)",
                                        fontWeight: FontWeight.bold,
                                        maxLine: 3,
                                        fontSize: 8.sp,
                                        color: Colors.black,
                                      )),
                                  Spacer(),
                                  IconButton(
                                    onPressed: ()
                                    {
                                      setState(() {
                                        isLiked = !isLiked;
                                      });
                                    },
                                    icon: Icon(
                                      isLiked ? Icons.favorite :
                                      Icons.favorite_outline_outlined,
                                      color: redColor,
                                    ),
                                  ),
                                  CommonTextView(
                                    "Add to my wishlist",
                                    fontWeight: FontWeight.normal,
                                    maxLine: 3,
                                    fontSize: 8.sp,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),

                              /// Product Detail Brand
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CommonTextView(
                                            "Brand - ",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 6.sp,
                                            color: greyColor,
                                          ),
                                          CommonTextView(
                                            "RFO",
                                            fontWeight: FontWeight.bold,
                                            maxLine: 3,
                                            fontSize: 6.sp,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CommonTextView(
                                            "Occasion ",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 6.sp,
                                            color: greyColor,
                                          ),
                                          CommonTextView(
                                            "Sports",
                                            fontWeight: FontWeight.w500,
                                            maxLine: 3,
                                            fontSize: 6.sp,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CommonTextView(
                                            "Size      ",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 6.sp,
                                            color: greyColor,
                                          ),
                                          CommonTextView(
                                            "12",
                                            fontWeight: FontWeight.w500,
                                            maxLine: 3,
                                            fontSize: 6.sp,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          CommonTextView(
                                            "Color ",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 6.sp,
                                            color: greyColor,
                                          ),
                                          CommonTextView(
                                            "Red",
                                            maxLine: 3,
                                            fontSize: 6.sp,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CommonTextView(
                                            "Type ",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 6.sp,
                                            color: greyColor,
                                          ),
                                          CommonTextView(
                                            "Running Shoes, Womens Shoes",
                                            maxLine: 3,
                                            fontSize: 6.sp,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),

                              /// Product Price
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonTextView(
                                        "\$ 58.30",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                      ),
                                      CommonTextView(
                                        "\$ 65.12",
                                        fontWeight: FontWeight.bold,
                                        maxLine: 3,
                                        textDecoration:
                                            TextDecoration.lineThrough,
                                        fontSize: 8.sp,
                                        color: greyColor,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(right: 2.w),
                                    padding: EdgeInsets.only(left: 1.w),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    height: 5.h,
                                    width: 12.w,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<int>(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 8.sp),
                                        icon: Icon(
                                            Icons.keyboard_arrow_down_rounded),
                                        value: selectedValue,
                                        onChanged: (int? newValue) {
                                          setState(() {
                                            selectedValue = newValue!;
                                          });
                                        },
                                        items: List.generate(10, (index) {
                                          return DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text('${index + 1}'),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                  CommonLinearButton(
                                    marging: EdgeInsets.zero,
                                    height: 5.h,
                                    width: 35.w,
                                    btnUperSideColor: Color(0xff6ec87e),
                                    btnLowerSideColor: Color(0xff088689),
                                    text: "+ Add to cart",
                                    textColor: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                ],
                              ),
                              SizedBox(height: 2.h),

                              /// Product Choose Varient
                              Row(
                                children: [
                                  CommonTextView(
                                    "Choose Varient",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8.sp,
                                    color: Colors.black,
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 8.h,
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: whiteColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0,
                                                1), // // changes the shadow position
                                          ),
                                        ]),
                                    child: Image.asset(
                                      "assets/brown_shoes.png",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 3.w),
                                    height: 8.h,
                                    width: 18.w,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0,
                                                1), // changes the shadow position
                                          ),
                                        ]),
                                    child: Image.asset(
                                      "assets/pink_shoes.png",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),

                              /// Product Location
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: greenColor,
                                    size: 16,
                                  ),
                                  CommonTextView(
                                    "Ahmedabad",
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 8.sp,
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),

                              /// Product Name
                              CommonTextView(
                                "Round toe leather loafer shoe(Black)",
                                fontWeight: FontWeight.w500,
                                maxLine: 3,
                                fontSize: 8.sp,
                                color: Colors.black,
                              ),
                              SizedBox(height: 1.h),

                              /// Product Rating
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 1.w),
                                    height: 3.h,
                                    child: Image.asset("assets/star.png"),
                                  ),
                                  CommonTextView(
                                    "3.0(52 REVIEWS)",
                                    maxLine: 3,
                                    fontSize: 8.sp,
                                    color: greyColor,
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),

                              /// Product Description
                              CommonTextView(
                                "This pack contains a technical spec drawing is a fully detailed shoe design ready for your creative touch This pack contains a technical spec drawing is a fully detailed shoe design ready for your creative touch",
                                fontWeight: FontWeight.w500,
                                maxLine: ReadMoreText ? 100 : 2,
                                fontSize: 8.sp,
                                color: Colors.black,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ReadMoreText = !ReadMoreText;
                                  });
                                },
                                child: Text(
                                  ReadMoreText ? "Read less" : "Read more",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 9.sp),
                                ),
                              ),
                              SizedBox(height: 2.h),

                              /// Product Specification
                              CommonTextView(
                                "Specification",
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: Colors.black,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                                width: 100.w,
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  border: Border.all(color: greyColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SpecificationContainer(
                                      firstSpecification: "MRP",
                                      secondWidget: CommonLinearButton(
                                        text: "RS. 999",
                                        btnUperSideColor: Color(0xff6ec87e),
                                        btnLowerSideColor: Color(0xff088689),
                                        textColor: whiteColor,
                                        marging: EdgeInsets.zero,
                                        height: 4.5.h,
                                        width: 30.w,
                                      ),
                                    ),
                                    SpecificationContainer(
                                      firstSpecification: "Product Model",
                                      secondSpecification: "Export Meat",
                                    ),
                                    SpecificationContainer(
                                      firstSpecification: "Manufacture Details",
                                      secondSpecification:
                                          "There is very high quality product",
                                    ),
                                    SpecificationContainer(
                                      firstSpecification: "Product Weight",
                                      secondSpecification:
                                          "0.789 gms, 0.25 kgs",
                                    ),
                                    SpecificationContainer(
                                      firstSpecification: "Brand",
                                      secondSpecification: "Puma",
                                    ),
                                    SpecificationContainer(
                                      firstSpecification: "Size",
                                      secondSpecification: "L",
                                    ),
                                    SpecificationContainer(
                                      firstSpecification: "Type",
                                      secondSpecification:
                                          "Very best quality product",
                                    ),
                                    SpecificationContainer(
                                      firstSpecification: "Color",
                                      secondSpecification: "Red ",
                                    ),
                                  ],
                                ),
                              ),

                              /// Follow Detail
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 1.h),
                                    height: 15.h,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/apparel_image.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 15.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 56.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  width: 32.w,
                                                  child: CommonTextView(
                                                    "Round toe leather loafer shoe(Black)",
                                                    fontWeight: FontWeight.bold,
                                                    maxLine: 3,
                                                    fontSize: 6.sp,
                                                    color: Colors.black,
                                                  )),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 1.w),
                                                    height: 2.h,
                                                    child: Image.asset(
                                                        "assets/star.png"),
                                                  ),
                                                  Container(
                                                    width: 10.w,
                                                    child: CommonTextView(
                                                      "3.0(52 REVIEWS)",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      maxLine: 2,
                                                      fontSize: 6.sp,
                                                      color: greyColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 56.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonTextView(
                                                "Open Now",
                                                fontWeight: FontWeight.bold,
                                                maxLine: 3,
                                                fontSize: 6.sp,
                                                color: greyColor,
                                              ),
                                              CommonTextView(
                                                "From-7:00 AM to 7:00 pm",
                                                fontWeight: FontWeight.w500,
                                                maxLine: 2,
                                                fontSize: 6.sp,
                                                color: greyColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 56.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: greenColor,
                                                      size: 10),
                                                  CommonTextView(
                                                    "Location",
                                                    fontWeight: FontWeight.w500,
                                                    maxLine: 2,
                                                    fontSize: 6.sp,
                                                    color: greyColor,
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                  width: 35.w,
                                                  child: CommonTextView(
                                                    "This is a location of the manufracture in the factory",
                                                    fontWeight: FontWeight.bold,
                                                    maxLine: 3,
                                                    fontSize: 6.sp,
                                                    color: greyColor,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              CommonLinearButton(
                                marging: EdgeInsets.only(top: 2.h, bottom: 2.h),
                                text: "Follow",
                                btnUperSideColor: Color(0xff6ec87e),
                                btnLowerSideColor: Color(0xff088689),
                                borderRadius: BorderRadius.circular(10),
                                width: 100.w,
                              ),

                              /// More from this seller
                              CommonTextView(
                                "More from this seller",
                                fontWeight: FontWeight.bold,
                                fontSize: 8.sp,
                                color: Colors.black,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: calegoryList.map((e) {
                                    return InkWell(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 2.h, bottom: 0.5.h),
                                            height: 10.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image:
                                                    AssetImage(e.categoryImage),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 2.h),
                                              alignment: Alignment.center,
                                              width: 24.w,
                                              child: CommonTextView(
                                                e.categoryName,
                                                maxLine: 2,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.normal,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                              )),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),

                              /// User reviews on this screen
                              CommonTextView(
                                "User reviews on this screen",
                                fontWeight: FontWeight.bold,
                                fontSize: 8.sp,
                                color: Colors.black,
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 2.w),
                                            height: 5.h,
                                            width: 10.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/User_Image.png"),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonTextView(
                                                "hello user",
                                                maxLine: 2,
                                                fontSize: 8.sp,
                                                color: Colors.black,
                                              ),
                                              CommonTextView(
                                                "2 days ago)",
                                                fontWeight: FontWeight.w500,
                                                maxLine: 2,
                                                fontSize: 6.sp,
                                                color: greyColor,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 5.h,
                                            width: 15.w,
                                            child: Image.asset(
                                              "assets/brown_shoes.png",
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          Container(
                                            height: 5.h,
                                            width: 15.w,
                                            child: Image.asset(
                                              "assets/brown_shoes.png",
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 54.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonTextView(
                                              "Best Ever Shoes i seen",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 8.sp,
                                              color: Colors.black,
                                            ),
                                            RatingBar.builder(
                                              initialRating: 4,
                                              // Replace with the actual initial rating
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 10,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 0.1),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star_border_outlined,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                // Handle the rating update
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 54.w,
                                        child: CommonTextView(
                                          "Best Ever Shoes i see Best Ever Shoes i seen Best Ever Shoes i see Best Ever Shoes i see Best Ever Shoes i see Best Ever Shoes i see",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 6.sp,
                                          textOverflow: TextOverflow.ellipsis,
                                          maxLine: 4,
                                          color: greyColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 2.h),

                              /// Frequently asked question
                              Row(
                                children: [
                                  CommonTextView(
                                    "Frequently asked questtion(user) => ",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 7.sp,
                                    color: greyColor,
                                  ),
                                  CommonTextView(
                                    "Dealer",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8.sp,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),

                              /// Enter Question Container
                              Container(
                                width: 100.w,
                                height: 20.h,
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  border: Border.all(color: greyColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: CommonTextView(
                                  "Enter your question here.",
                                  fontSize: 6.sp,
                                  color: greyColor,
                                ),
                              ),

                              /// Text and send Button
                              Container(
                                width: 100.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonTextView(
                                      "Your message must be between 1-200 character.",
                                      fontSize: 6.sp,
                                      color: greyColor,
                                    ),
                                    CommonLinearButton(
                                      text: "Send",
                                      btnUperSideColor: Color(0xff6ec87e),
                                      btnLowerSideColor: Color(0xff088689),
                                      textColor: whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                      width: 20.w,
                                      height: 4.5.h,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 5.w),
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white),
              child: Icon(
                Icons.phone_outlined,
                size: 30,
                color: greenColor,
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white),
              child: Icon(
                Icons.chat_bubble_outline_outlined,
                size: 30,
                color: darkTealColor,
              ),
            ),
            Spacer(),
            CommonLinearButton(
              text: "Get Best Price",
              textColor: whiteColor,
              btnLowerSideColor: Color(0xff6ec87e),
              btnUperSideColor: Color(0xff088689),
              height: 7.h,
              marging: EdgeInsets.zero,
            )
          ],
        ),
      ),
    );
  }
}

class SpecificationContainer extends StatelessWidget {
  final String firstSpecification;
  final String? secondSpecification;
  Widget? secondWidget;

  SpecificationContainer({
    required this.firstSpecification,
    this.secondSpecification,
    this.secondWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 1.h),
          width: 18.w,
          child: CommonTextView(
            firstSpecification,
            fontSize: 6.sp,
          ),
        ),
        Spacer(),
        secondWidget ??
            CommonTextView(
              color: Colors.black,
              secondSpecification!,
              fontSize: 6.sp,
            ),
      ],
    );
  }
}
