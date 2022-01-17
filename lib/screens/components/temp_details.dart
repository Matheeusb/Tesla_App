import 'package:flutter/material.dart';
import 'package:tesla_app/screens/components/temp_button.dart';

import '../../constanins.dart';
import '../../home_controller.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempButton(
                  isActive: _controller.isCoolSelected,
                  title: 'Cool',
                  svgSrc: 'assets/icons/cool_shape.svg',
                  press: _controller.updateCoolSelectedTab,
                ),
                const SizedBox(width: defaultPadding),
                TempButton(
                  isActive: !_controller.isCoolSelected,
                  title: 'Heat',
                  svgSrc: 'assets/icons/heat_shape.svg',
                  activeColor: redColor,
                  press: _controller.updateCoolSelectedTab,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => _controller.incrementTemp(),
                icon: const Icon(
                  Icons.arrow_drop_up,
                  size: 48,
                ),
              ),
              Text(
                _controller.isCoolSelected
                    ? _controller.tempCool.toString() + '\u2103'
                    : _controller.tempHeat.toString() + '\u2103',
                style: const TextStyle(fontSize: 86),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => _controller.decrementTemp(),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 48,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text('Current Temperature'.toUpperCase()),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Inside'.toUpperCase()),
                  Text('23' '\u2103',
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
              const SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Outside'.toUpperCase(),
                      style: const TextStyle(color: Colors.white54)),
                  Text(
                    '31' '\u2103',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white54),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
