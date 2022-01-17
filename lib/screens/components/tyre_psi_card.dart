import 'package:flutter/material.dart';
import 'package:tesla_app/models/tyre_psi.dart';

import '../../constanins.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    Key? key,
    required this.isBottomTwoTyre,
    required this.tyrePsi,
  }) : super(key: key);

  final bool isBottomTwoTyre;
  final TyrePsi tyrePsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color:
        tyrePsi.isLowPressure ? redColor.withOpacity(0.1) : Colors.white10,
        border: Border.all(
            color: tyrePsi.isLowPressure ? redColor : primaryColor, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: isBottomTwoTyre
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(tyrePsi.isLowPressure) lowPressureText(context),
          const Spacer(),
          Text(
            '${tyrePsi.temp}\u2103',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: defaultPadding),
          psiText(context, psi: tyrePsi.psi.toString()),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          psiText(context, psi: tyrePsi.psi.toString()),
          const SizedBox(height: defaultPadding),
          Text(
            '${tyrePsi.temp}\u2103',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Spacer(),
          if(tyrePsi.isLowPressure) lowPressureText(context),
        ],
      ),
    );
  }

  Column lowPressureText(BuildContext context) {
    return Column(
      children: [
        Text(
          'Low'.toUpperCase(),
          style: Theme.of(context).textTheme.headline3!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Pressure'.toUpperCase(),
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Text psiText(BuildContext context, {required String psi}) {
    return Text.rich(
      TextSpan(
        text: psi,
        style: Theme.of(context).textTheme.headline4!.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        children: const <TextSpan>[
          TextSpan(
            text: 'psi',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}