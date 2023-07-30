import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/discover_people.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key});

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  String countrySelectedValue = "USA";
 String stateSelectedValue = "USA";
 String citySelectedValue = "USA";
  // List<DropdownMenuItem<String>> get dropdownItems {
  //   List<DropdownMenuItem<String>> menuItems = [
  //     const DropdownMenuItem(value: "USA", child: Text("USA")),
  //     const DropdownMenuItem(value: "Canada", child: Text("Canada")),
  //     const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
  //     const DropdownMenuItem(value: "England", child: Text("England")),
  //   ].toList();
  //   return menuItems;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Center(
                  child: Text(
                "Where do you live?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),

              Container(
                  height: 250,
                  child: Image.asset("assets/images/location2.png")),
              const SizedBox(
                height: 10,
              ),

//Country and State Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //country
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Country",
                          style: TextStyle(fontSize: 16),
                        ),
                        DropdownButtonFormField(
                          value: countrySelectedValue,
			style: TextStyle(fontSize: 16),
                          items: [
                            const DropdownMenuItem(
                                value: "USA", child: Text("USA")),
                            const DropdownMenuItem(
                                value: "Canada", child: Text("Canada")),
                            const DropdownMenuItem(
                                value: "Brazil", child: Text("Brazil")),
                            const DropdownMenuItem(
                                value: "England", child: Text("England")),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              countrySelectedValue = newValue!;
                            });
                          },
                          decoration: InputDecoration(
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
                      ],
                    ),
                  ), // end of country

                  //State
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "State",
                          style: TextStyle(fontSize: 16),
                        ),
                        DropdownButtonFormField(
                          value: stateSelectedValue, 
			  style: TextStyle(fontSize: 16),
                          items: [
                            const DropdownMenuItem(
                                value: "USA", child: Text("USA")),
                            const DropdownMenuItem(
                                value: "Canada", child: Text("Canada")),
                            const DropdownMenuItem(
                                value: "Brazil", child: Text("Brazil")),
                            const DropdownMenuItem(
                                value: "England", child: Text("England")),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              stateSelectedValue = newValue!;
                            });
                          },
                          decoration: InputDecoration(
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
                      ],
                    ),
                  ), // end of State
                ],
              ), // end of country and state Row

//City and PostalCode
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //country
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "City",
                          style: TextStyle(fontSize: 16),
                        ),
                        DropdownButtonFormField(
                          value: citySelectedValue,
			style: TextStyle(fontSize: 16),
                          items: [
                            const DropdownMenuItem(
                                value: "USA", child: Text("USA")),
                            const DropdownMenuItem(
                                value: "Canada", child: Text("Canada")),
                            const DropdownMenuItem(
                                value: "Brazil", child: Text("Brazil")),
                            const DropdownMenuItem(
                                value: "England", child: Text("England")),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              citySelectedValue = newValue!;
                            });
                          },
                          decoration: InputDecoration(
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
                      ],
                    ),
                  ), // end of city

                  //Postal Code
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "State",
                          style: TextStyle(fontSize: 16),
                        ),
                       TextFormField(
      style: TextStyle(fontSize: 16),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: "1111",
        hintStyle: TextStyle(fontSize: 16),
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
    )
                      ],
                    ),
                  ), // end of postal_code
                ],
              ), // end of city and portal_code

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    color: Colors.black,
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => DiscoverPeople())));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
