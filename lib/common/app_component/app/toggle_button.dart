import 'package:flutter/material.dart';
import 'package:voice_verse/common/constant/app_colors/colors.dart';


class ToggleButtonsSwitch extends StatefulWidget {
  final Function(bool) onSelectedChanged; // Callback function

  ToggleButtonsSwitch({required this.onSelectedChanged}); // Constructor with callback

  @override
  _ToggleButtonsSwitchState createState() => _ToggleButtonsSwitchState();
}

class _ToggleButtonsSwitchState extends State<ToggleButtonsSwitch> {
  bool _isFirstDesign = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: secondColor, // Modify this color as needed
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildToggleButton("Movies", _isFirstDesign),
            _buildToggleButton("Education", !_isFirstDesign),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: isSelected ? buttonColor : secondColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            _isFirstDesign = !_isFirstDesign;
          });
          // Call the callback function and pass the isSelected value
          widget.onSelectedChanged(_isFirstDesign);
        },
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white30,
          ),
        ),
      ),
    );
  }
}
