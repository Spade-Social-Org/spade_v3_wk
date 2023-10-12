import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/widgets/form_title.dart';
import 'package:spade_v4/Presentation/widgets/custom_button.dart';

class AddLocationScreen extends StatefulWidget {
  final String name;
  final String password;
  final String phoneNumber;
  final String email;
  const AddLocationScreen({
    Key? key,
    required this.name,
    required this.password,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  final controller = TextEditingController();

  /// Variables to store country state city data in onChanged method.
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Center(
                  child: FormTitle(
                formTitle: "Where do you live?",
              )),
              const SizedBox(height: 20),
              Image.asset("assets/images/location2.png", height: 250),
              const SizedBox(height: 20),
              CSCPicker(
                flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                countrySearchPlaceholder: "Country",
                stateSearchPlaceholder: "State",
                citySearchPlaceholder: "City",

                ///labels for dropdown
                countryDropdownLabel: "Country",
                stateDropdownLabel: "State",
                cityDropdownLabel: "City",

                ///triggers once country selected in dropdown
                onCountryChanged: (value) {
                  setState(() {
                    ///store value in country variable
                    countryValue = value;
                  });
                },

                ///triggers once state selected in dropdown
                onStateChanged: (value) {
                  setState(() {
                    ///store value in state variable
                    stateValue = value ?? "";
                  });
                },

                ///triggers once city selected in dropdown
                onCityChanged: (value) {
                  setState(() {
                    ///store value in city variable
                    cityValue = value ?? "";
                  });
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller,
                style: const TextStyle(fontSize: 14),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  hintText: "Postal Code",
                  hintStyle: const TextStyle(fontSize: 14),
                  errorStyle: const TextStyle(color: Colors.black),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              CustomButton(
                  color: Colors.black, text: 'Next', onPressed: () async {}),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
