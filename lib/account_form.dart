import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:jetkit/jetkit.dart';

class AccountForm extends StatelessWidget {


  AccountForm();
  @override
  Widget build(BuildContext context) {
    return  RepaintBoundary(
      child: m.Container(
        //  height: 500,
          padding: EdgeInsets.only(left: 32, top: 32, right: 32, bottom: 32),
          alignment: m.Alignment(-1, -1),
          color: Color(0xffF1F3F4),
          child: m.ConstrainedBox(
            constraints: m.BoxConstraints(
             //  maxWidth: 670,
            ),
            child: m.Column(
              children: [
                m.Row(
                  children: [
                    m.Expanded(
                      flex: 1,
                      child: Field(
                        label: "First name",
                        child: TextFormField(
                          maxLines: 1,
                          minLines: 1,
                          initialValue: "Alexander",
                          style: m.TextStyle(
                              fontSize: 16,
                              color: Colors.black, fontWeight: m.FontWeight.w300),
                          obscureText: false,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: m.Color(0xffF7F9FA),
                              border: m.OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: m.BorderSide(
                                      width: 1,
                                      color:
                                      m.Color(0xffA6ADAF)))),
                        ),
                      ),
                    ),
                    m.Container(
                      width: 24,
                    ),
                    m.Expanded(
                      flex: 1,
                      child: Field(
                        label: "Second name",
                        child: TextFormField(
                          initialValue: "Yemelianenko",
                          style: m.TextStyle(
                              fontSize: 16,
                              height: 1,
                              color: Colors.black, fontWeight: m.FontWeight.w300),
                          obscureText: false,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: m.Color(0xffF7F9FA),
                              border: m.OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: m.BorderSide(
                                      width: 1,
                                      color:
                                      m.Color(0xffA6ADAF)))),
                        ),
                      ),
                    )
                  ],
                ),
                m.Container(
                  height: 24,
                ),
                m.Row(children: [
                  m.Expanded(
                    flex: 1,
                    child: Field(
                      label: "Welcome message",
                      fixedHeight: false,
                      child: TextFormField(
                        maxLines: 3,
                        initialValue: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                        //keyboardType: TextInputType.multiline,
                        style: m.TextStyle(
                            fontSize: 16, color: Colors.black, fontFamily: 'Roboto',fontWeight: m.FontWeight.w300),
                        obscureText: false,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: m.Color(0xffF7F9FA),
                            border: m.OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide: m.BorderSide(
                                    width: 1,
                                    color: m.Color(0xffA6ADAF)))),
                      ),
                    ),
                  )
                ]),
                m.Container(
                  height: 24,
                ),
                m.Row(
                  children: [
                    m.Expanded(
                      flex: 1,
                      child: Field(
                        label: "First name",
                        child: TextFormField(
                          initialValue: "Alexander",
                          style: m.TextStyle(
                              fontSize: 16,
                              height: 1,
                              color: Colors.black, fontWeight: m.FontWeight.w300),
                          obscureText: false,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: m.Color(0xffF7F9FA),
                              border: m.OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: m.BorderSide(
                                      width: 1,
                                      color:
                                      m.Color(0xffA6ADAF)))),
                        ),
                      ),
                    ),
                    m.Container(
                      width: 24,
                    ),
                    m.Expanded(
                      flex: 1,
                      child: Field(
                        label: "Second name",
                        child: TextFormField(
                          initialValue: "Yemelianenko",
                          style: m.TextStyle(
                              fontSize: 16,
                              height: 1,
                              color: Colors.black, fontWeight: m.FontWeight.w300),
                          obscureText: false,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: m.Color(0xffF7F9FA),
                              border: m.OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: m.BorderSide(
                                      width: 1,
                                      color:
                                      m.Color(0xffA6ADAF)))),
                        ),
                      ),
                    ),
                    m.Container(
                      width: 24,
                    ),
                    m.Expanded(
                      flex: 1,
                      child: Field(
                        label: "Second name",
                        child: TextFormField(
                          initialValue: "Yemelianenko",
                          style: m.TextStyle(
                              fontSize: 16,
                              height: 1,
                              color: Colors.black, fontWeight: m.FontWeight.w300),
                          obscureText: false,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: m.Color(0xffF7F9FA),
                              border: m.OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: m.BorderSide(
                                      width: 1,
                                      color:
                                      m.Color(0xffA6ADAF)))),
                        ),
                      ),
                    )
                  ],
                ),
                m.Container(
                  height: 38,
                ),
                m.Row(
                  children: [
                    m.FlatButton.icon(
                      onPressed: (){},
                      color:Color(0xffE3E5E5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      padding:EdgeInsets.only(left: 32, right: 32, top:12, bottom: 12),
                      label: Text('Cancel', overflow: TextOverflow.ellipsis, style: m.TextStyle(fontSize: 20, color: Colors.black, fontWeight: m.FontWeight.w400, fontFamily: "Roboto")) ,
                      icon: m.Padding( padding:m.EdgeInsets.only(right: 1),child: m.Icon(m.Icons.clear, color: Colors.red)),
                    ),
                    m.Expanded(
                      flex: 1,
                      child: m.Container(

                      ),
                    ),
                    m.RaisedButton.icon(
                      onPressed: (){},

                      color:Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      // padding:EdgeInsets.only(left: 32, right: 32, top:12, bottom: 12),
                      label: m.Padding(
                          padding:EdgeInsets.only ( top:12, bottom: 12),
                          child: Text('Save changes', overflow: TextOverflow.ellipsis, style: m.TextStyle(fontSize: 20, color: Colors.black, fontWeight: m.FontWeight.w400, fontFamily: "Roboto"))) ,
                      icon: m.Padding( padding:m.EdgeInsets.only(right: 1),child: m.Icon(m.Icons.check, color: Colors.green)),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
