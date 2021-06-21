//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T value;
  final String Function(T) getLabel;
  final void Function(T) onChanged;


  AppDropdownInput({
    this.hintText = 'Please select an Option',
    this.options = const [],
    this.getLabel,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(

          decoration: InputDecoration(

            contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 15.0),
            hintText: hintText,
            // labelText: hintText,
            labelStyle: TextStyle(fontFamily: 'Rubik',fontWeight: FontWeight.w400),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.grey,width: 0.5)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.blue,width: 0.5)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.grey,width: 0.5)),

          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isDense: true,
              onChanged: onChanged,
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(getLabel(value),style: TextStyle(fontFamily: 'Rubik',fontWeight: FontWeight.w400)),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}