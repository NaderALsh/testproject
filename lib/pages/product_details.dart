
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:testproject/constants/style.dart';
import 'package:testproject/custom_widget/Textwidget.dart';

class ProductDetails extends StatefulWidget {
  dynamic  price ;
  String ? image ;
  String ? decription ;
  ProductDetails({this.decription,this.image,this.price});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final double _initFabHeight = 50.0;
  double _fabHeight = 30;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 50.0;
  bool openslide = false;

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
    _panelHeightOpen = MediaQuery.of(context).size.height * .50;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        top: true,
        child: 
         widget.image! == null ? Center(child: CircularProgressIndicator(color: bluelight,)) :
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                widget.image!,
              ).image,
            ),
          ),
          child: Stack(
            // mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: 30,
            parallaxEnabled: true,
            parallaxOffset: .5,
            // body: _body(),
            panelBuilder: (sc) => _panel(sc,widget.decription!),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
                  openslide =! openslide ;
                }),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          iconSize: 35,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: bluedark2,
                            size: 15,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          iconSize: 35,
                          icon: Icon(
                            Icons.more_vert,
                            color: bluedark2,
                            size: 15,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*0.08,
                left: 15,
                child: TextWidget(fontSize: 24,text: 'Details',fontfamily: 'bold')),
              // Spacer(flex: 10),
              Positioned(
                bottom: _fabHeight,
                left: 15,
                child: TextWidget(fontSize: 24,color: bluedark2,text: widget.price.toString() + ' AED',fontfamily: 'bold')),
              // Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _panel(ScrollController sc,String description){
    return // Generated code for this Column Widget...
      Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: Icon(
                _fabHeight == MediaQuery.of(context).size.height * .50? 
                Icons.keyboard_arrow_down :Icons.keyboard_arrow_up ,
                color: bluelight,
                size: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        iconSize: 40,
                        icon: Icon(
                          Icons.arrow_circle_up,
                          color: bluedark2,
                          size: 24,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFF2AB3C6),
                      borderRadius: BorderRadius.circular(55),
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: 
                    TextWidget(fontSize: 18,text:'Order Now',color:Colors.white ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: 
            TextWidget(fontSize: 16,text:'Description',color:Color(0x82000000) ),
            
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child:TextWidget(fontSize: 12,text:description,color:Color(0x82000000) ),
          ),
        ],
      )
      ;
  }


}
