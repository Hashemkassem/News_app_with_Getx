// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: [
          // Profile Section
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('assets/gif/personn.gif'), // Placeholder
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'john.doe@example.com',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                            ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {}, // No function
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),

          // Account Section
          Text(
            'Account',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 8.0),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Personal Information'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}, // No function
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Change Password'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}, // No function
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sign Out'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}, // No function
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),

          // Preferences Section
          Text(
            'Preferences',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 8.0),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.palette),
                  title: Text('Theme'),
                  subtitle: Text('Light'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}, // No function
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                  subtitle: Text('English'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}, // No function
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.article),
                  title: Text('News Categories'),
                  subtitle: Text('General, Technology'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}, // No function
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),

          // Notifications Section
          Text(
            'Notifications',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 8.0),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Push Notifications'),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {}, // No function
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email Notifications'),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {}, // No function
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),

          // Help & Support Section
          Text(
            'Help & Support',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 8.0),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help Center'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}, // No function
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.contact_support),
                  title: Text('Contact Us'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}, // No function
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text('Send Feedback'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}, // No function
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),

          // About Section
          Text(
            'About',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 8.0),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('App Version'),
                  subtitle: Text('1.0.0'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}, // No function
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.description),
                  title: Text('Terms of Service'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}, // No function
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
