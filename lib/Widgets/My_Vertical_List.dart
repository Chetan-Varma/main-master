import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyVerticalList extends StatefulWidget {
  const MyVerticalList(
      {Key? key,
      required this.CompanyName,
      required this.PackageOffers,
      required this.CompanyImg,
      required this.tag})
      : super(key: key);

  final String CompanyName, PackageOffers, CompanyImg;
  final String tag;

  @override
  State<MyVerticalList> createState() => _MyVerticalListState();
}

class _MyVerticalListState extends State<MyVerticalList> {
  Uri? uri;
  String? stringUri;

  // uri = Uri.parse(stringUri);
  @override
  Widget build(BuildContext context) {
    stringUri = widget.CompanyImg;
    uri = Uri.parse(stringUri!);
    return Padding(
      padding: EdgeInsets.only(
        bottom: 0,
      ),
      child: SizedBox(
          height: 130,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 92,
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width * 0.13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff3c413f),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.30),
                        spreadRadius: 0,
                        blurRadius: 13,
                        offset: Offset(0, 9),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 17, horizontal: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Hero(
                      tag: widget.tag,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(widget.CompanyImg),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, bottom: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.CompanyName.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              '${widget.PackageOffers} LPA',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFF8C8C8C)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 20, bottom: 20, left: 50),
                    //   child: Icon(
                    //     Icons.arrow_forward_ios,
                    //     color: Colors.white24,
                    //     size: 20,
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
