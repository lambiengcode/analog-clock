// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:analog_clock/src/pages/countdown/controllers/count_down_controller.dart';
import 'package:analog_clock/src/public/constants.dart';

class PickTime extends StatefulWidget {
  const PickTime({super.key});

  @override
  State<StatefulWidget> createState() => _PickTimeState();
}

class _PickTimeState extends State<PickTime> {
  List hours = List.generate(99, (index) => index);
  List minutes = List.generate(60, (index) => index);
  int hour = 0, minute = 0, second = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .1,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildColumnTime('Hour', hours, hour),
          _buildColumnTime('Minute', minutes, minute),
          _buildColumnTime('Second', minutes, second),
        ],
      ),
    );
  }

  Widget _buildColumnTime(title, List datas, value) {
    return SizedBox(
      width: width * .215,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: GetBuilder<CountDownController>(
              builder: (_) => DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  icon: const Icon(null),
                  iconEnabledColor: Colors.grey.shade800,
                  decoration: const InputDecoration(
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
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val == null || val is! int) return;

                    setState(() {
                      switch (title) {
                        case "Hour":
                          hour = val;
                          break;
                        case "Minute":
                          minute = val;
                          break;
                        case "Second":
                          second = val;
                          break;
                      }
                      _.updateTime(hour, minute, second);
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            title,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
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
