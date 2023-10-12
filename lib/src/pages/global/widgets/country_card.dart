// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:analog_clock/src/public/size_config.dart';

class CountryCard extends StatelessWidget {
  final String country, timeZone, iconSrc, time, period;

  const CountryCard({
    super.key,
    required this.country,
    required this.iconSrc,
    required this.period,
    required this.time,
    required this.timeZone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(233),
        child: AspectRatio(
          aspectRatio: 1.32,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).primaryIconTheme.color ?? Colors.black,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: getProportionateScreenWidth(16)),
                ),
                const SizedBox(height: 5),
                Text(timeZone),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      iconSrc,
                      width: getProportionateScreenWidth(40),
                    ),
                    const Spacer(),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(period),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
