import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isWindows
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'your_api_key',
          appId: 'your_app_id',
          messagingSenderId: 'your_messaging_sender_id',
          projectId: 'your_project_id',
          authDomain: 'your_auth_domain',
          storageBucket: 'your_storage_bucket',
          measurementId: 'your_measurement_id',
        ))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  String _documentId = '';
  Map<String, dynamic> _data = {};

  // Create
  Future<void> createData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _firestore.collection('collectionName').doc(_documentId).set(_data);
    }
  }

  // Read
  Stream<QuerySnapshot> readData() {
    return _firestore.collection('collectionName').snapshots();
  }

  // Update
  Future<void> updateData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _firestore
          .collection('collectionName')
          .doc(_documentId)
          .update(_data);
    }
  }

  // Delete
  Future<void> deleteData(String documentId) async {
    await _firestore.collection('collectionName').doc(documentId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Connection App"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Document ID',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => _documentId = value!,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Data',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => _data = {'field': value},
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: createData,
                        icon: const Icon(Icons.add),
                        label: const Text('Create'),
                      ),
                      ElevatedButton.icon(
                        onPressed: updateData,
                        icon: const Icon(Icons.edit),
                        label: const Text('Update'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            Text(
              'Documents',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 16.0),
            StreamBuilder<QuerySnapshot>(
              stream: readData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final doc = snapshot.data!.docs[index];
                      return Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(doc['field']),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            tooltip: 'Delete Document',
                            onPressed: () => deleteData(doc.id),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
