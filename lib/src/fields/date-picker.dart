import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerFormField extends FormField<DateTime> {
  DatePickerFormField({
    @required BuildContext context,
    String labelText,
    FormFieldSetter<DateTime> onSaved,
    FormFieldValidator<DateTime> validator,
    Color activeColor,
    Color checkColor,
    bool dense = false,
    DateTime initialValue,
    DateTime firstDate,
    DateTime lastDate,
    bool autovalidate = false,
    bool isThreeLine = false,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autovalidate,
          builder: (FormFieldState<DateTime> state) {
            return InkWell(
              child: InputDecorator(
                isEmpty: state.value == null,
                decoration: InputDecoration(
                  labelText: labelText != null ? labelText : "",
                  prefixIcon: Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  errorText: state.errorText,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      state.value != null
                          ? "${state.value.month}/${state.value.day}/${state.value.year}"
                          : "",
                    ),
                    state.value != null
                        ? InkWell(
                            onTap: (() {
                              state.reset();
                            }),
                            child: Icon(
                              Icons.clear,
                              size: 15,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              onTap: () async {
                DateTime date;
                DateTime initialDate =
                    initialValue == null ? DateTime.now() : initialValue;
                DateTime startDate = firstDate == null
                    ? DateTime(DateTime.now().year - 1)
                    : firstDate;
                DateTime endDate = lastDate == null ? DateTime(2100) : lastDate;
                if (Platform.isAndroid) {
                  date = await showDatePicker(
                      context: context,
                      initialDate:
                          state.value != null ? state.value : initialDate,
                      firstDate: startDate,
                      lastDate: endDate);
                  if (date != null) {
                    state.didChange(date);
                    state.save();
                  }
                } else {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext builder) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 4,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (DateTime dateTime) =>
                                state.didChange(dateTime),
                            initialDateTime:
                                state.value != null ? state.value : initialDate,
                            minimumYear: startDate.year,
                            maximumYear: endDate.year,
                          ),
                        );
                      });
                }
              },
            );
          },
        );
}
