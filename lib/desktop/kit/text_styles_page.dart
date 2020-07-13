import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jetkit/jetkit.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/darcula.dart';

extension JetScaleExtention on BuildContext {
  double px(double value) {
    JetThemeData data = JetTheme.of(this);
    return data.scale.px(value);
  }
// ···
}

class TextStylesPage extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    var code = '''
import 'package:flutter/material.dart';
import 'package:jetkit/jetkit.dart';

class TextStylesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return JetPanel(
        color: Color(0xffF7F9FA),
        title: "Typography",
        child: ListView(children: [
          JetCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      JetText.headerLarge('Header Large'),
                      JetText.body( loremText),
                      JetText.body( loremText),
                      JetText.headerMedium('Header Medium', applyParagraph: true),
                      JetText.body( loremText),
                      JetText.body( loremText),
                      JetText.headerSmall('Header Small', applyParagraph: true),
                      JetText.body( loremText),
                  ])),
          JetCard(
              child: SelectableText.rich(
                TextSpan(
                  text: '', // default text style
                  children: <InlineSpan>[
                    ...JetTextSpan.headerLarge(context, 'Header Large'),
                    ...JetTextSpan.body(context, loremText),
                    ...JetTextSpan.body(context, loremText),

                    ...JetTextSpan.headerMedium(context, 'Header Medium', applyParagraph: true),
                    ...JetTextSpan.body(context, loremText),
                    ...JetTextSpan.body(context, loremText),

                    ...JetTextSpan.headerSmall(context, 'Header Small', applyParagraph: true),
                    ...JetTextSpan.body(context, loremText)
                  ],
                ),

              )
          )
        ]));
  }

  final String loremText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
}

     ''';
    JetThemeData theme =
        MaterialJetTheme.getThemeData(Theme.of(c));
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollState) {
        print(scrollState);
        return false;
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: JetPanel(
            color: Color(0xffF7F9FA),
            title: "Typography",
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 900),
              child: Column(children: [
                JetTab(
                  size: c.px(100),
                  uppercase: true,
                  items: [
                    JetTabItem(text: 'All', selected: true, icon: Icons.all_inclusive),
                    JetTabItem(text: 'Video',  icon: Icons.videocam),
                    JetTabItem(text: 'Fibonachi',  icon: Icons.settings),
                    JetTabItem(text: 'Fibonachi',  icon: Icons.settings),
                    JetTabItem(text: 'Tools',  icon: Icons.pan_tool),
                    JetTabItem(text: 'Images',  icon: Icons.image)
                  ],
                  itemBuilder: (JetTabItem item, JetTabStyles styles, bool selected){
                    double p6 = 4 * styles.scaleFactor.scale;
                    double p4 = 4 * styles.scaleFactor.scale;
                      return Padding(
                          padding: EdgeInsets.only(top: c.px(p6), right: c.px(p4), bottom: c.px(p6), left: c.px(p4)),
                          child: JetSquareButton(item.icon, text: item.text, size: styles.height - c.px(p6*2)));
                  }
                ),
                Container(
                  height: 30,
                ),
                JetTab(
                    size: c.px(72),
                    uppercase: true,
                    items: [
                      JetTabItem(text: 'All', selected: true, icon: Icons.all_inclusive),
                      JetTabItem(text: 'Video',  icon: Icons.videocam),
                      JetTabItem(text: 'Fibonachi',  icon: Icons.settings),
                      JetTabItem(text: 'Fibonachi',  icon: Icons.settings),
                      JetTabItem(text: 'Tools',  icon: Icons.pan_tool),
                      JetTabItem(text: 'Images',  icon: Icons.image)
                    ],

                    itemBuilder: (JetTabItem item, JetTabStyles styles, bool selected){
                      double p6 = 0 * styles.scaleFactor.scale;
                      double p4 = 4 * styles.scaleFactor.scale;
                      return Padding(
                          padding: EdgeInsets.only(top: c.px(p6), right: c.px(p4), bottom: c.px(p6), left: c.px(p4)),
                          child: JetSquareButton(item.icon, text: item.text, size: styles.height - c.px(p6*2)));
                    }

                ),
                Container(
                  height: 30,
                ),
                JetTab(
                  uppercase: true,
                  scale: JetScale(scale: 1.5),
                  /*stylesBuilder: (w) {
                    return theme.tabThemeClassic.styles.copyWith(JetTabStyles(
                        textStyle: theme.tabThemeClassic.styles.textStyle
                            .copyWith(fontSize: w.size(15)),
                        textSelectedStyle: theme
                            .tabThemeClassic.styles.textSelectedStyle
                            .copyWith(fontSize: w.size(15))));
                  },*/
                  items: [
                    JetTabItem(text: 'All', selected: true),
                    JetTabItem(text: 'Video'),
                    JetTabItem(text: 'Stores'),
                    JetTabItem(text: 'Settings'),
                    JetTabItem(text: 'Tools'),
                    JetTabItem(text: 'Images')
                  ],
                ),
                JetCard(
                    color: Color(0xffF7F9FA),
                    child: JetText.body(loremText, applyParagraph: false)),
                JetCard(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      JetText.headerLarge('Header Large'),
                      JetText.body(loremText),
                      JetText.body(loremText),
                      JetText.headerMedium('Header Medium',
                          applyParagraph: true),
                      JetText.body(loremText),
                      JetText.body(loremText),
                      JetText.headerSmall('Header Small', applyParagraph: true),
                      JetText.body(loremText),
                    ])),
                Container(
                  height: 450,
                  child: JetCard(
                      color: Color(0xff2a2b2a),
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (scrollState) {
                          print(1);
                          return true;
                        },
                        child: SingleChildScrollView(
                          primary: false,
                          dragStartBehavior: DragStartBehavior.start,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: HighlightView(
                            code,
                            language: 'dart',
                            theme: darculaTheme,
                            padding: EdgeInsets.all(16),
                            textStyle: TextStyle(
                                fontSize: 16,
                                //fontFamily: 'Arial',
                                letterSpacing: 1.5),
                          ),
                        ),
                      )),
                ),
                JetCard(
                    child: SelectableText.rich(
                  TextSpan(
                    text: '', // default text style
                    children: <InlineSpan>[
                      ...JetTextSpan.headerLarge(c, 'Header Large'),
                      ...JetTextSpan.body(c, loremText),
                      ...JetTextSpan.body(c, loremText),
                      ...JetTextSpan.headerMedium(c, 'Header Medium',
                          applyParagraph: true),
                      ...JetTextSpan.body(c, loremText),
                      ...JetTextSpan.body(c, loremText),
                      ...JetTextSpan.headerSmall(c, 'Header Small',
                          applyParagraph: true),
                      ...JetTextSpan.body(c, loremText)
                    ],
                  ),
                ))
              ]),
            )),
      ),
    );
  }

  Future<double> getScale() async {
    return 1.1;
  }

  final String loremText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
}
