import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:testproject/constants/style.dart';
import 'package:testproject/controller/get_products_controller.dart';
import 'package:testproject/custom_widget/Textwidget.dart';
import 'package:testproject/pages/product_details.dart';
class Productsview extends StatefulWidget {
  const Productsview({Key? key}) : super(key: key);

  @override
  _ProductsviewState createState() => _ProductsviewState();
}

class _ProductsviewState extends State<Productsview> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xDCF1F4F8),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics:const NeverScrollableScrollPhysics(),
          children: [
            InkWell(
              onTap: (){
                print(Products_controller().productList[0].price);
              },
              child: Material(
                color: Colors.transparent,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Color(0xD1FFFFFF),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child:
                    TextWidget(color: Color(0xC2000000),fontSize: 28,fontfamily: 'bold',text: 'All Product',)
                  ),
                ),
              ),
            ),
            GetBuilder<Products_controller>(
              init: Products_controller(),
              builder: (controller) {
                return  SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemBuilder: (context,int index){
                      return 
                      controller.loadingList ? Center(child: CircularProgressIndicator(color: bluelight,)) : 
                      Padding(
                        padding:const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                        child: InkWell(
                          onTap: () {
                            Get.to(()=>ProductDetails(
                              decription: controller.productList[index].description!,
                              image: controller.productList[index].image!,
                              price: controller.productList[index].price!,
                              ));
                            
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 330,
                            decoration: BoxDecoration(
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            CachedNetworkImage(
                              imageUrl: controller.productList[index].image!,
                              imageBuilder: (context, imageProvider) => 
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 190,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: imageProvider
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextWidget(fontSize: 16,fontfamily: 'bold',text: controller.productList[index].price.toString() + ' AED',color: bluedark2),
                                            Container(
                                              width: 69,),
                                            RatingBar.builder(
                                              onRatingUpdate: (newValue){
                        
                                              },
                                              allowHalfRating: true,
                                              itemBuilder: (context, index) => Icon(
                                                Icons.star_rounded,
                                                color: Color(0xFFEFE482),
                                              ),
                                              direction: Axis.horizontal,
                                              initialRating: controller.productList[index].rating!['rate'],
                                              // initialRating: 1,
                                              unratedColor:Color.fromARGB(255, 241, 239, 218),
                                              itemCount: 5,
                                              itemSize: 25,
                                              glowColor: Color(0xFFEFE482),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              placeholder: (context, url) => Center(
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Center(child: CircularProgressIndicator(color: bluelight,strokeWidth: 2))),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                                
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                  child: TextWidget(color: Color(0x70000000),fontSize: 16,text: controller.productList[index].title!,),
                                ),
                                Expanded(child: TextWidget(color: Color(0xE4000000),fontSize: 12,text: controller.productList[index].description!,fontfamily: 'light')),
                                
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  // , separatorBuilder: (context,index){
                  //   return const SizedBox(height: 0,);
                  // }
                  , itemCount: controller.productList.length),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
