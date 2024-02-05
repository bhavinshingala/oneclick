import 'package:flutter/material.dart';
import 'package:oneclick_webearl_interview_project/screens/product_list_screen.dart';
import 'package:oneclick_webearl_interview_project/widgets/CommonAppbar.dart';
import 'package:oneclick_webearl_interview_project/widgets/common_text_view.dart';
import 'package:oneclick_webearl_interview_project/widgets/constants.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<OffersDetails> offersList = [
    OffersDetails(OffersImage: "assets/Book_flight.png", OffersName: "Book Flight"),
    OffersDetails(OffersImage: "assets/Jio.png", OffersName: "Jio"),
    OffersDetails(OffersImage: "assets/Order_food.png", OffersName: "Order Food"),
    OffersDetails(OffersImage: "assets/Pay_bills.png", OffersName: "Pay Bills"),
  ];

  List<String> ocExpertsImages = [
    "assets/WM_repair.png",
    "assets/TV_repair.png",
    "assets/Pest_control_service.png",
    "assets/WM_repair.png",
    "assets/TV_repair.png",
    "assets/Pest_control_service.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CommonAppbar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10,),
          child: Column(
            children: [
              SizedBox(height: 10,),
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
                        Icon(Icons.filter_center_focus, color: greyColor),
                        SizedBox(width: 8), // Add some spacing between
                        Icon(Icons.keyboard_voice_rounded, color: greyColor),
                        SizedBox(width: 8), // Add some spacing between the icons
                      ],
                    ),
                  ),
                ),
              ),
              /// Banner
              Container(
                margin: EdgeInsets.only(top: 2.h,bottom: 2.h),
                height: 17.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage("assets/Dream_home_Banner.png",), fit: BoxFit.fitWidth)
                ),
              ),
              /// View All Text
              Row(
                children: [
                  Spacer(),
                  CommonTextView("View all")
                ],
              ),
              /// Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5.w,top: 1.h),
                    height: 5.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/Categories_text.png",), fit: BoxFit.fitWidth),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: calegoryList.map((e) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListScreen()));
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 2.h, bottom: 0.5.h),
                                  height: 10.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(e.categoryImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                    width: 24.w,
                                    child: CommonTextView(e.categoryName, maxLine: 2,fontSize: 8.sp, fontWeight: FontWeight.normal,textOverflow: TextOverflow.ellipsis,)),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              /// Banner
              Container(
                margin: EdgeInsets.only(top: 2.h,bottom: 2.h),
                height: 15.h,
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage("assets/Talk_to_doctor.png",), fit: BoxFit.fitWidth)
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: offersList.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (context, index){
                    return Stack(
                      children: [
                        Container(
                          height: 12.h,
                          width: 22.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(offersList[index].OffersImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        /// For Text
                        // Positioned(
                        //   bottom: 3.h,
                        //     left: 5.w,
                        //     child: Container(height: 1.h,width: 2.w,color: Colors.red,))
                      ],
                    );
                  }),
              /// View All Text
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 2.h,bottom: 2.h),
                    height: 3.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage("assets/OC_Experts.png",), fit: BoxFit.fitWidth)
                    ),
                  ),
                  Spacer(),
                  CommonTextView("View all")
                ],
              ),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Wrap(
                 spacing: 5.w,
                 runSpacing: 5.w,
                 children: ocExpertsImages.map((e) {
                   return Container(
                     margin: EdgeInsets.only(bottom: 2.h),
                     height: 19.h,
                     width: 32.w,
                     decoration: BoxDecoration(
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black.withOpacity(0.2),
                             spreadRadius: 2,
                             blurRadius: 5,
                             offset: Offset(0, 3), // changes the shadow position
                           ),
                         ],
                       borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(
                         image: AssetImage(e),
                         fit: BoxFit.fitHeight,
                       ),
                     ),
                   );
                 }).toList(),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}

List<CategoryDetails> calegoryList = [
  CategoryDetails(categoryImage: "assets/agriculture_image.png", categoryName: "Agriculture"),
  CategoryDetails(categoryImage: "assets/apparel_image.png", categoryName: "Apparel"),
  CategoryDetails(categoryImage: "assets/automobile_image.png", categoryName: "Automobiles & Two wheelers"),
  CategoryDetails(categoryImage: "assets/baby_leg.jpg", categoryName: "Baby"),
  CategoryDetails(categoryImage: "assets/agriculture_image.png", categoryName: "Agriculture"),
  CategoryDetails(categoryImage: "assets/apparel_image.png", categoryName: "Apparel"),
  CategoryDetails(categoryImage: "assets/automobile_image.png", categoryName: "Automobiles & Two wheelers"),
  CategoryDetails(categoryImage: "assets/baby_leg.jpg", categoryName: "Baby"),
];

class CategoryDetails{
  String categoryImage;
  String categoryName;

  CategoryDetails({required this.categoryImage, required this.categoryName});
}

class OffersDetails{
  String OffersImage;
  String OffersName;

  OffersDetails({required this.OffersImage, required this.OffersName});
}
