import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:weight_loss_planner/Calculator/bmr_calculator.dart';
import 'package:weight_loss_planner/sidebar.dart';

// The Calculator Class Page
class Calculator extends StatelessWidget {
  Calculator({super.key});
  final _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Calorie Calculator'),
        centerTitle: true,
      ),
      drawer: Sidebar(),
      drawerEnableOpenDragGesture: false,
      body: FormBuilder(
        key: _formkey,
        // TODO: Get the styling working to avoid the pixel overflow
        child: Column(
          children: [
            /// This will contain all the contents of the form
            /// except for the buttons
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
                            onPressed: () {
                              _formkey.currentState?.saveAndValidate();
                              debugPrint(_formkey.currentState?.value.toString());
                            },
                            child: Text('Calculate',
                                style: TextStyle(fontSize: 24)))),
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
                          onPressed: () {
                            _formkey.currentState?.reset();
                          },
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
