import 'package:flutter/material.dart';
import 'package:analog_clock/src/public/constants.dart';
import 'package:flutter/rendering.dart';

class PickTime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PickTimeState();
}

class _PickTimeState extends State<PickTime> {
  List hours = List.generate(99, (index) => index);
  List minutes = List.generate(60, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .095,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildColumnTime('Hour', hours),
          _buildColumnTime('Minute', hours),
          _buildColumnTime('Second', hours),
        ],
      ),
    );
  }

  Widget _buildColumnTime(title, List datas) {
    return Container(
      width: width * .2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 35.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                icon: Icon(null),
                iconEnabledColor: Colors.grey.shade800,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                value: 0,
                style: TextStyle(
                  fontSize: width / 28.5,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).iconTheme.color,
                  fontFamily: 'Lato',
                ),
                items: datas.map((data) {
                  return DropdownMenuItem(
                      value: data,
                      child: Text(
                        data.toString(),
                        style: TextStyle(
                          fontSize: width / 28.5,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).iconTheme.color,
                          fontFamily: 'Lato',
                        ),
                        textAlign: TextAlign.end,
                      ));
                }).toList(),
                onChanged: (val) {},
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            title,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: width / 26.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).iconTheme.color,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
