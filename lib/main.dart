import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DropDownButton',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  // Initial Selected Value
  String dropdownvalue = 'Select';
  String dropdownvalue1 = 'Select';

  List<String> cities = ['Select', 'Erbil', 'Duhok'];

  List<String> erbil = ['Select', 'Kasnazan', 'Parki Sami'];

  List<String> duhok = ['Select', 'Azadi Hos..', 'Location2'];

  List<String> cityName = [];

  @override
  Widget build(BuildContext context) {
    debugPrint('Intial Value :::B::: '+dropdownvalue);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geeksforgeeks"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              // Initial Value - Select
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: cities.map((String city) {
                debugPrint('City Name |||| '+city);
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  if (newValue == 'Erbil') {
                    // cityName > 0
                    if (cityName.isNotEmpty) {
                      dropdownvalue1 = 'Select';
                      cityName.clear();
                      //
                      for (var i = 0; i < erbil.length; i++) {
                        cityName.add(erbil[i]);
                      }
                    } else {
                      for (var i = 0; i < erbil.length; i++) {
                        cityName.add(erbil[i]);
                      }
                    }
                  }
                  else if (newValue == 'Duhok') {
                    if (cityName.isNotEmpty) {
                      dropdownvalue1 = 'Select';
                      cityName.clear();
                      for (var i = 0; i < erbil.length; i++) {
                        cityName.add(duhok[i]);
                      }
                    } else {
                      for (var i = 0; i < duhok.length; i++) {
                        cityName.add(duhok[i]);
                      }
                    }
                  }
                  else if (newValue == 'Select') {
                    cityName.clear();
                  }
                });
              },
            ),
            DropdownButton(
              // Initial Value
              value: dropdownvalue1,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: cityName.map((String location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue1 = newValue!;
                  debugPrint('Selected Value ::::: '+dropdownvalue1);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
