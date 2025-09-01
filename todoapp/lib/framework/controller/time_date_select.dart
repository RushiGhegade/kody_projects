
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeDateSelect{

  final BuildContext context;

  const TimeDateSelect({required this.context});

  Future<String> selectTime() async{
     TimeOfDay? time = await showTimePicker(
         context: context,
         initialTime: TimeOfDay.now(),
       builder: (BuildContext context, Widget? child) {
         return MediaQuery(
           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
           child: child!,
         );
       },
     );
    if(time!=null){
      return time.format(context);
    }
    return '';
  }


  Future<String> selectDate() async{
    DateTime? date = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
    );
    if(date!=null){
      return DateFormat("dd/MM/yyyy").format(date);
    }
    return '';
  }

}