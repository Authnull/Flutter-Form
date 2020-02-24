import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    @required BuildContext context,
    Widget title,
    Widget subtitle,
    Widget secondary,
    FormFieldSetter<bool> onSaved,
    FormFieldValidator<bool> validator,
    Color activeColor,
    Color checkColor,
    bool dense = false,
    bool initialValue = false,
    bool autovalidate = false,
    bool isThreeLine = false,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autovalidate,
          builder: (FormFieldState<bool> state) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CheckboxListTile(
                    activeColor: activeColor,
                    checkColor: checkColor,
                    dense: dense,
                    title: title,
                    subtitle: subtitle,
                    secondary: secondary,
                    value: state.value,
                    onChanged: state.didChange,
                    isThreeLine: isThreeLine,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: state.hasError
                        ? Text(
                            state.errorText,
                            style:
                                TextStyle(color: Theme.of(context).errorColor),
                          )
                        : null,
                  )
                ],
              ),
            );
          },
        );
}
