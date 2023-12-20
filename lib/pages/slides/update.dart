import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'SettingPage.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User _user;
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _numberController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
    _nameController = TextEditingController(text: _user.displayName ?? '');
    _addressController = TextEditingController();
    _numberController = TextEditingController();
    _emailController = TextEditingController(text: _user.email ?? '');
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
    try {
      // Perform profile update logic
      await _user.updateDisplayName(_nameController.text);
      await _user.updateEmail(_emailController.text);

      // Check if the user document exists
      DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(_user.uid).get();
      if (userSnapshot.exists) {
        // Update additional user information in Firestore
        await _firestore.collection('users').doc(_user.uid).update({
          'address': _addressController.text,
          'number': _numberController.text,
        });

        // Check if the password field is not empty and update the password
        if (_passwordController.text.isNotEmpty) {
          await _user.updatePassword(_passwordController.text);
        }

        // Reload the user to get the updated information
        await _user.reload();
        _user = _auth.currentUser!;
        print('Profile updated successfully');

        // Show a pop-up message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')),
        );

        // Show confirmation dialog
        await _showUpdateConfirmationDialog();

        // Navigate to the dashboard page after confirming the update
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SettingPage()),
        );
      } else {
        print('User document does not exist');
        throw Exception('User document does not exist');
      }
    } catch (e) {
      print('Error updating profile: $e');
      // Show a pop-up message for the specific error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile: $e')),
      );
    }
  }



  Future<void> _showUpdateConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Confirmed'),
          content: Text('Your profile has been updated!'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _numberController,
                decoration: InputDecoration(labelText: 'Number'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                readOnly: true,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // Perform profile update logic
                    await _user.updateDisplayName(_nameController.text);
                    await _user.updateEmail(_emailController.text);

                    // Check if the user document exists
                    DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(_user.uid).get();
                    if (userSnapshot.exists) {
                      // Update additional user information in Firestore
                      await _firestore.collection('users').doc(_user.uid).update({
                        'address': _addressController.text,
                        'number': _numberController.text,
                      });

                      // Check if the password field is not empty and update the password
                      if (_passwordController.text.isNotEmpty) {
                        await _user.updatePassword(_passwordController.text);
                      }

                      // Reload the user to get the updated information
                      await _user.reload();
                      _user = _auth.currentUser!;
                      print('Profile updated successfully');

                      // Show a pop-up message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Profile updated successfully')),
                      );

                      // Show confirmation dialog
                      await showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Update Sucess'),
                            content: Text('Your profile has been updated!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );

                      // Navigate to the dashboard page after confirming the update
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SettingPage()),
                      );
                    } else {
                      print('User document does not exist');
                      throw Exception('User document does not exist');
                    }
                  } catch (e) {
                    // Check if the exception is related to a successful update
                    if (e.toString().contains('Profile updated successfully')) {
                      print('Profile updated successfully');
                      return;
                    }

                    print('Error updating profile: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update profile: $e')),
                    );
                  }
                },
                child: Text('Update Profile'),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
