import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  Widget _text(int i, String name) {
    return Text("${i}) $name");
  }

  double val = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider Widget")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _text(
              1,
              "Slider(value , onchange) : it is use to show the slider ",
            ),
            Slider(
              value: val,
              onChanged: (val1) {
                val = val1;
                setState(() {

                });
              },
            ),

            _text(2, "padding:1 :it give the padding to slider"),
            Slider(padding: EdgeInsets.all(1), value: 0.7, onChanged: (val) {}),

            _text(3, "label : show the label when slider is active"),
            Slider(
              label: "Val",
              padding: EdgeInsets.all(1),
              value: val,
              onChanged: (val1) {
                val = val1;
                setState(() {

                });
              },
            ),


            _text(4, "Active color And InActivecolor "),
            Slider(
              label: "Val",
              activeColor: Colors.orange,
              inactiveColor: Colors.green,
              padding: EdgeInsets.all(1),
              value: val,
              onChanged: (val1) {
                val = val1;
                setState(() {

                });
              },
            ),


            _text(5, "thumbColor "),
            Slider(

              label: "Val",
              thumbColor: Colors.pink,
              activeColor: Colors.orange,
              inactiveColor: Colors.green,
              padding: EdgeInsets.all(1),
              value: val,
              onChanged: (val1) {
                val = val1;
                setState(() {

                });
              },
            ),

            _text(6, '''Remove Thumb : wrap with the widget SliderTheme and give this property\n data: SliderTheme.of(context).copyWith(
                thumbShape: SliderComponentShape.noThumb
            ),'''),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  thumbShape: SliderComponentShape.noThumb
              ),
              child: Slider(

                label: "Val",
                thumbColor: Colors.pink,
                activeColor: Colors.orange,
                inactiveColor: Colors.green,
                padding: EdgeInsets.all(1),
                value: val,
                onChanged: (val1) {
                  val = val1;
                  setState(() {

                  });
                },
              ),

            ),



            _text(5, "min and max :The minimum value the user can select And The maximum value the user can select "),
            Slider(
              label: "Val",
              thumbColor: Colors.pink,
              activeColor: Colors.orange,
              inactiveColor: Colors.green,
              padding: EdgeInsets.all(1),
              min: 0.0,
              max: 0.8,
              value: val,
              // year2023: true,
              onChanged: (val1) {
                val = val1;
                setState(() {

                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
