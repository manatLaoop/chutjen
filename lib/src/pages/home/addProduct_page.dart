// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_cast, prefer_is_empty, unnecessary_import, avoid_print

import 'package:chutjen/src/model/product_Edit_model.dart';
import 'package:chutjen/src/model/product_model.dart';
import 'package:chutjen/src/pages/home/function/addproduct_fc.dart';
import 'package:chutjen/src/services/network_service.dart';
import 'package:chutjen/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

List<ProductModelcontroller> Itemdtail = [];

class _AddProductState extends State<AddProduct> {
//.................
  Map<String, dynamic> dataObj = {'happiness': null, 'price': null};

  Productsmodel productsmodel = Productsmodel();
  int pseparate = 1;
  String? pnames;
  TextInputType? textInputType;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    if (Itemdtail.length > 0) {
      Itemdtail.clear();
      ProductModelcontroller().dtail?.dispose();
      ProductModelcontroller().price?.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: padding(t: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Text('อัปเดตราคา',
                          style: headerStyle(
                              colors: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightGreen)),
                    onPressed: () {},
                    label: Text('รายการอัฟเดตทั้งหมด'),
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FutureBuilder<List<Productsmodel>>(
                          future: NetworkService().getProductmodelForEdit(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Productsmodel>> snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data == null ||
                                  snapshot.data!.length < 0) {
                                return SizedBox(
                                  child: Text(
                                    'ไม่มีข้อมูล',
                                    style: headerStyle(
                                        colors: Colors.red,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }
                              return Column(
                                children: [
                                  DropdownButtonFormField(
                                    validator: (String? value) {
                                      if (value == null) {
                                        return 'กรุณาเลือกรายการ';
                                      }
                                      return null;
                                    },
                                    value: productsmodel.productid,
                                    onChanged: (value) {
                                      productsmodel.productid =
                                          value.toString();
                                    },
                                    items: snapshot.data!.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          onTap: () {
                                            productsmodel.pseparatetype =
                                                e.pseparatetype;
                                            productsmodel.pname = e.pname;
                                            productsmodel.pcolor = e.pcolor;
                                          },
                                          value: e.id,
                                          child: Text('${e.pname}'),
                                        );
                                      },
                                    ).toList(),
                                    decoration: inputDecoration(
                                        lable: Text('รายการ'),
                                        errtexthight: 1.5),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Card(
                                    child: Column(
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                              ),
                                              child: DataTable(
                                                  headingRowColor:
                                                      MaterialStateProperty.all(
                                                          Colors.lightGreen),
                                                  headingTextStyle: headerStyle(
                                                      fontSize: 16,
                                                      colors: Colors.black),
                                                  dataRowHeight: 70,
                                                  horizontalMargin: 0,
                                                  columnSpacing: 0,
                                                  columns: <DataColumn>[
                                                    DataColumn(
                                                      label: Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            'ลำดับ',
                                                            style: TextStyle(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            'ระดับหน่วยวัด',
                                                            style: TextStyle(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            'ราคา',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            'ลบ',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  rows: Itemdtail.map((e) {
                                                    return DataRow(
                                                        cells: <DataCell>[
                                                          DataCell(
                                                            Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  '${Itemdtail.indexOf(e) + 1}'),
                                                            ),
                                                          ),
                                                          // .......................................
                                                          DataCell(
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: SizedBox(
                                                                height: 40,
                                                                child:
                                                                    InputDtail(
                                                                  e,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          //.........................
                                                          DataCell(
                                                            Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                height: 40,
                                                                child:
                                                                    Inputprice(
                                                                        e),
                                                              ),
                                                            ),
                                                          ),
                                                          DataCell(
                                                            Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child:
                                                                  ElevatedButton(
                                                                style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty.all(
                                                                            Colors.red)),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    Itemdtail.removeAt(
                                                                        Itemdtail.indexOf(
                                                                            e));
                                                                  });
                                                                },
                                                                child: Icon(Icons
                                                                    .remove),
                                                              ),
                                                            ),
                                                          ),
                                                        ]);
                                                  }).toList())),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Container(
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, bottom: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.add,
                                                      size: 30,
                                                      color: Colors.lightGreen,
                                                    ),
                                                    Text(
                                                      'เพิ่ม',
                                                      style: headerStyle(
                                                          colors:
                                                              Colors.lightGreen,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  Itemdtail.add(
                                                      ProductModelcontroller());
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  SizedBox(
                                    child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 10.0,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                        ),
                                        onPressed: Itemdtail.length > 0
                                            ? () {
                                                _formKey.currentState!.save();
                                                if (!_formKey.currentState!
                                                    .validate()) {
                                                  return;
                                                }
                                                showDialog(
                                                  barrierDismissible: false,
                                                  barrierColor:
                                                      Colors.transparent,
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (BuildContext) {
                                                    return Alertdialog(
                                                        context: context,
                                                        lable: productsmodel
                                                            .pname
                                                            .toString());
                                                  },
                                                );
                                              }
                                            : null,
                                        icon: Icon(Icons.save),
                                        label: Text('บันทึก')),
                                  )
                                ],
                              );
                            }
                            if (snapshot.hasError) {
                              return SizedBox(
                                child: Text(
                                  'Network Error',
                                  style: headerStyle(
                                      colors: Colors.red,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }
                            return CircularProgressIndicator();
                          }),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField Inputprice(
    ProductModelcontroller e,
  ) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        return null;
      },
      controller: Itemdtail[Itemdtail.indexOf(e)].price,
      keyboardType: pseparate == 1 ? TextInputType.number : TextInputType.text,
      decoration: inputDecoration(redius: 8),
      onChanged: (value) {
        setState(() {
          var data = Itemdtail.indexOf(e) as Object;
        });
      },
    );
  }

  // ignore: non_constant_identifier_names
  TextFormField InputDtail(
    ProductModelcontroller e,
  ) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        return null;
      },
      controller: Itemdtail[Itemdtail.indexOf(e)].dtail,
      keyboardType: pseparate == 1 ? TextInputType.number : TextInputType.text,
      decoration: inputDecoration(redius: 8),
    );
  }

  AlertDialog alertChengeproduct(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Row(
        children: [Icon(Icons.show_chart), Text('ยืนการเลืกรายการ')],
      ),
      content: Text("หากท่านกดยืนยันฟอร์มก่อนหน้าจะกลับสู่ค่าเริ่มต้น"),
      actions: <Widget>[
        TextButton(
          child: Text(
            "ยกเลิก",
            style: headerStyle(colors: Colors.redAccent, fontSize: 18),
          ),
          onPressed: () {
            productsmodel.productid = productsmodel.productid;
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            "ยืนยัน",
            style: headerStyle(colors: Colors.lightBlue, fontSize: 18),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
