import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:uitask/home2.dart';
import 'package:uitask/survey.dart';


class SurveyForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey Form'),
      ),
      body: Consumer<SurveyModel>(
        builder: (context, survey, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: RequiredValidator(errorText: "Name is required").call,
                      onChanged: (value) {
                        survey.updateName(value);
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Email is required"),
                        EmailValidator(errorText: "Enter a valid email address")
                      ]).call,
                      onChanged: (value) {
                        survey.updateEmail(value);
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Feedback'),
                      maxLines: 4,
                      validator: RequiredValidator(errorText: "Feedback is required").call,
                      onChanged: (value) {
                        survey.updateFeedback(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (survey.isSubmitted) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home2(),));
                          }
                          survey.submit();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Survey Submitted')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                    // if (survey.isSubmitted)
                    //   const Padding(
                    //     padding: EdgeInsets.only(top: 20.0),
                    //     child: Text(
                    //       'Thank you for your feedback!',
                    //       style: TextStyle(color: Colors.green, fontSize: 16),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
