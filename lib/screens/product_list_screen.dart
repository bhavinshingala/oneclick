import 'package:flutter/material.dart';
import 'package:oneclick_webearl_interview_project/screens/product_detail_screen.dart';
import 'package:oneclick_webearl_interview_project/widgets/CommonAppbar.dart';
import 'package:oneclick_webearl_interview_project/widgets/Common_linear_button.dart';
import 'package:oneclick_webearl_interview_project/widgets/common_text_view.dart';
import 'package:oneclick_webearl_interview_project/widgets/constants.dart';
import 'package:sizer/sizer.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

List<String> productItems = ["","",""];
bool isLiked = false;

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
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
        actions: [],
        title: CommonTextView("Men’s shoes",
            color: darkTealColor, fontSize: 14.sp),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Textfield
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: greyColor),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: greyColor),
                    hintText: "Search for a Restaurant",
                    hintStyle: TextStyle(color: greyColor, fontSize: 10.sp),
                    border: InputBorder.none,
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.keyboard_voice_rounded, color: greyColor),
                      ],
                    ),
                  ),
                ),
              ),

              /// All Products
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 CommonLinearButton(text: "All Products", onTap: (){
                 },),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        color: greyColor,
                        size: 30,
                      ))
                ],
              ),

              /// List
              Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 1.w, // Adjust spacing as needed
                    mainAxisSpacing: 2.w, // Adjust spacing as needed
                    mainAxisExtent: 300
                  ),
                  itemCount: productItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen()));
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.w),
                            width: 42.w, // Adjust width as needed
                            margin: EdgeInsets.only(right: 4.w,left: 2.w,top: 2.w,bottom: 2.w),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: whiteColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonTextView("RFQ", fontWeight: FontWeight.w500, fontSize: 8.sp,),
                                    IconButton(
                                      onPressed: () {
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
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
                                  alignment: Alignment.center,
                                  height: 10.h,
                                  child: Image.asset(
                                    "assets/red_shoes.png",
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonTextView(
                                      "Round toe leather loafer shoe(Black)",
                                      color: Colors.black,
                                      maxLine: 2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 9.sp,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                    CommonTextView(
                                      "Rainbow shoes & enterprise",
                                      color: darkTealColor,
                                      fontSize: 6.sp,
                                    ),
                                    /// Location
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: greenColor,
                                          size: 15,
                                        ),
                                        CommonTextView(
                                          "Ahmedabad",
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 7.sp,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CommonTextView(
                                          "₹",
                                          color: darkTealColor,
                                          fontSize: 20.sp,
                                        ),
                                        SizedBox(width: 2.w),
                                        CommonTextView(
                                          "1800",
                                          color: darkTealColor,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12.sp,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 2.h,
                            right: 0,
                            child: Column(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  padding: EdgeInsets.all(1.5.w),
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
                                      color: Colors.white
                                  ),
                                  child: Image.asset("assets/phone.png", height: 3.5.h),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  margin: EdgeInsets.only(top: 1.h),
                                  padding: EdgeInsets.all(1.w),
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
                                      color: Colors.white
                                  ),
                                  child: Image.asset("assets/corner_up_right.png", height: 3.8.h),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
