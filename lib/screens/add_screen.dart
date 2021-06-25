import 'package:flash_shoes_flutter/components/custom_button.dart';
import 'package:flash_shoes_flutter/components/input_field.dart';
import 'package:flash_shoes_flutter/components/reusable_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_shoes_flutter/constants.dart';

class AddScreen extends StatefulWidget {
  static String id = 'add_screen';

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Text("Tambah Data", style: kTitleTextStyle),
                    ),
                    ReusableBackButton(onTap: () {
                      Navigator.pop(context);
                    }),
                  ],
                ),
                SizedBox(height: 50.0),
                // Kode
                Text("Kode", style: kLabelTextStyle),
                SizedBox(height: 10.0),
                InputField(
                  obscureText: false,
                ),
                SizedBox(height: 20.0),
                // Nama
                Text("Nama", style: kLabelTextStyle),
                SizedBox(height: 10.0),
                InputField(
                  obscureText: false,
                ),
                SizedBox(height: 20.0),
                // Harga
                Text("Harga", style: kLabelTextStyle),
                SizedBox(height: 10.0),
                InputField(
                  obscureText: false,
                  type: TextInputType.number,
                ),
                SizedBox(height: 20.0),
                // Stok
                Text("Stok", style: kLabelTextStyle),
                SizedBox(height: 10.0),
                InputField(
                  obscureText: false,
                  type: TextInputType.number,
                ),
                SizedBox(height: 20.0),
                // Image URL
                Text("Image URL", style: kLabelTextStyle),
                SizedBox(height: 10.0),
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      border: InputBorder.none,
                    ),
                    maxLines: 8,
                    style: kInputTextStyle,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return "Profile image link cannot be empty";
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                ),
                SizedBox(height: 20.0),
                CustomButton(
                  color: kPrimaryColor,
                  text: 'Simpan',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
