import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:weight_loss_planner/Calculator/bmr_calculator.dart';
import 'package:weight_loss_planner/Calculator/result.dart';
import 'package:weight_loss_planner/sidebar.dart';

// The Calculator Class Page
class Calculator extends StatelessWidget {
  Calculator({super.key});
  final _formkey = GlobalKey<FormBuilderState>();

  /// Navigates to the result page when the form is filled
  void navigateToResult(BuildContext context) {
    if (_formkey.currentState?.saveAndValidate() == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Result(
                  weight: int.parse(_formkey.currentState?.value['weight']),
                  height: int.parse(_formkey.currentState?.value['height']),
                  age: int.parse(_formkey.currentState?.value['age']),
                  gender: _formkey.currentState?.value['gender'],
                  activity: _formkey.currentState?.value['activity'])
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Calorie Calculator'),
        centerTitle: true,
      ),
      drawer: Sidebar(),
      drawerEnableOpenDragGesture: false,
      body: FormBuilder(
        key: _formkey,
        child: Column(
          children: [
            /// This will contain all the contents for the form
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(children: [
                  for (int i = 0; i < ListInformation.formname.length; i++) ...[
                    FormBuilderTextField(
                      name: ListInformation.formname[i],
                      decoration: InputDecoration(
                          labelText: ListInformation.formtext[i]),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'This field is required'),
                        FormBuilderValidators.numeric(
                            errorText: 'Must be an number')
                      ]),
                    ),
                    SizedBox(height: 10)
                  ],

                  /// Gender Radio Button Selection
                  FormBuilderRadioGroup(
                    name: 'gender',
                    decoration: InputDecoration(
                        labelText: 'Gender', border: InputBorder.none),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'This field is required'),
                    ]),
                    options: const [
                      FormBuilderFieldOption(value: 'Male'),
                      FormBuilderFieldOption(value: 'Female'),
                    ],
                  ),
                  SizedBox(height: 10),

                  /// The Activity Drop Down Selection
                  FormBuilderDropdown(
                    name: 'activity',
                    decoration: InputDecoration(
                        labelText: 'Activity', border: OutlineInputBorder()),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'This field is required'),
                    ]),
                    items: ListInformation.formdropdown
                        .map((fields) => DropdownMenuItem(
                            value: fields['key'],
                            child: Text(fields['value'] as String)))
                        .toList(),
                  ),
                  SizedBox(height: 10),
                ]),
              ),
            ),

            /// The buttons at the bottom of the form
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    /// The Calculate Button
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 80),
                              backgroundColor: Colors.green[600],
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                ),
                              ),
                            ),
                            onPressed: () => navigateToResult(context),
                            child: Text('Calculate',
style: TextStyle(fontSize: 24)))),

                    /// The Reset Button
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(0, 80),
                            backgroundColor: Colors.red,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                              ),
                            ),
                          ),
                          onPressed: () => _formkey.currentState?.reset(),
                          child: Text('Reset', style: TextStyle(fontSize: 24))),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
