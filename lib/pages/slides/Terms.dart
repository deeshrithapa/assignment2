import 'package:flutter/material.dart';

void main() {
  runApp(termspage());
}

class termspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Terms & Conditions',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: TermsAndConditionsPage(),
    );
  }
}

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        title: Center(child: Text('Terms & Conditions')),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Text(
                    'Terms and Conditions for SkinSync',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'By using this application, you agree to the following terms and conditions:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '1. Creating an Account:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'To use any features of the Mobile Application, you must set up an account with SkinSync and provide certain information about yourself as prompted by the form, including, your name, email address, account password, mobile phone number and billing/shipping address. Our Privacy Policy protects all of your registration information.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'You represent and warrant that the information you submit during registration is truthful and accurate and that you will maintain the accuracy of such information.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'It is your responsibility to keep your email address up-to-date on your account setup at Jeevee so that we can communicate with you electronically as well.',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '2. User Agreement:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'By accessing and using this application, you are agreeing to be bound by these Terms and Conditions of Use. If you do not agree to all the terms and conditions of this agreement, then you may not access the application.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '3. Data Privacy:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'SkinSync respects your privacy and takes reasonable measures to protect your personal data from unauthorized access, use, or disclosure. By using this application, you consent to the collection, use, and disclosure of your personal data in accordance with this policy.',
                    style: TextStyle(fontSize: 14),
                  ),
                  /*SizedBox(height: 16),
                  Text(
                    '. Security Privacy:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'All your transactions are 100% secure when you place an order online at SkinSync. Your personal information is encrypted by using 256-bit Secure Sockets Layer (SSL) encryption technology before being sent over the Internet, which ensures the privacy and high level of security of all your information.',
                    style: TextStyle(fontSize: 14),
                  ),*/
                  SizedBox(height: 16),
                  Text(
                    '4. Privacy Policy:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your personally identifiable information will be used in accordance with our Privacy Policy (kindly refer to “Privacy Policy”). To understand our practices, as to how we collect, use and disclose your personally identifiable information, please refer our Privacy Policy, which also governs your visit to SkinSYnc.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We understand the privacy of all information you provide is of a primary importance. This is why we do everything possible to use it carefully and sensibly. This information is never shared with other companies or person or third party service providers.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '5. Disclaimer of Warranties and Limitation of Liability:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'SkinSync assumes no responsibility for any damages or viruses that may infect your computer equipment or other property on account of your access to, use of, or browsing in this site.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Please note that while SkinSync has made every effort to accurately display the colours of products on its Mobile Application, the actual colour you see will depend on your monitor. We cannot guarantee that your monitors display of any colour will be the same as the colour of the Products delivered to you.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'SkinSync accepts no responsibility for any loss or damage suffered due to your reliance on the product reviews posted by the SkinSync Users.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'SkinSync reserves the right to modify or withdraw any part of the Mobile Application or any of its content at any time without notice.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '6. Website/Mobile Application Availability:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We take all reasonable care to ensure the availability of the SkinSync Mobile Application 24 hours every day, 365 days per year. However, Mobile Application may become temporarily unavailable due to maintenance, server or other technical issues, or for reasons beyond our control. SkinSync does not warrant uninterrupted access to this Mobile Application or any linked Mobile Application. However, we may, but shall not be obliged to, issue a notice when we know of scheduled maintenance of our Mobile Application.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '7. Links to third-party Website/Mobile Applications:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We provide link to third-party Mobile Applications, our online payment service partners, which process your Net Banking and Credit/Debit Card payments, respectively. We are not responsible for the availability or proper functioning of such linked pages or sites, and we will not be held responsible for any loss or inconvenience encountered as a result of using such Mobile Application link.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '8. Changes to these Terms and Conditions:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We reserve the right to amend these terms and conditions from time to time without further notice to you. Any such amendments we make shall be effective once we post a revised version of these Terms and Conditions on the Mobile Application. It is your responsibility to review the SkinSync Terms and Conditions regularly. Your continued use of the Mobile Application following the publication of any such changes will constitute your agreement to follow and be automatically bound by the amended terms and conditions. These Terms were published on 11/30/2023.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Contact Information:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Please contact us for any questions or comments regarding these Terms and Conditions.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Contact Number:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '+977 9816877218, +977',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'skinsync@gmail.com',
                    style: TextStyle(fontSize: 14),
                  ),
                  // Add more terms and conditions here...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}