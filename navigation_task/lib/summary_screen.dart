
import 'package:flutter/material.dart';
import 'package:navigation_task/trave_info.dart';


class SummaryScreen extends StatefulWidget {
  final TravelInfo travelInfo;

  const SummaryScreen({super.key, required this.travelInfo});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {

  Widget _text(String promt,String result){
    return  Text("$promt : $result");
  }

  @override
  Widget build(BuildContext context) {
    print(widget.travelInfo.date);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text("Summary Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            _text("Destination", widget.travelInfo.destName!),
            _text("Travel Mode ", widget.travelInfo.travelMode!),
            _text("Travel Date", widget.travelInfo.date!),
            _text("Number Of Travelers", widget.travelInfo.count.toString()),
            _text("Stay Type", widget.travelInfo.stayType!),
            _text("Mood", widget.travelInfo.mood!),
            _text("Activities :", widget.travelInfo.activity!),

            if (widget.travelInfo.notes != null)
              _text("Notes",widget.travelInfo.notes!),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
