import 'package:flutter/material.dart';
import 'package:frontend/api/api_response.dart';
import 'package:frontend/api/repositories.dart';
import 'package:frontend/common/helpers.dart' as helpers;
import 'package:frontend/models/bucket.dart';

class BucketFormPage extends StatefulWidget {
  static const routeName = '/bucket/:id';
  const BucketFormPage({Key? key}) : super(key: key);

  @override
  _BucketFormPageState createState() => _BucketFormPageState();
}

class _BucketFormPageState extends State<BucketFormPage> {
  String name = '';
  String? token = '';
  Bucket? bucket;

  bool isNew() {
    return bucket == null;
  }

  String getCreateEditString() {
    if (isNew()) {
      return 'Create';
    }
    return 'Edit';
  }

  String getTitleText() {
    return "${getCreateEditString()} Bucket";
  }

  @override
  void initState() {
    super.initState();
    String _token = helpers.getTokenFromProvider(context);
    if (_token.isEmpty) return;
    token = _token;
  }

  void saveBucket() async {
    // TODO: null safety check please
    bucket?.name = name;
    Repositories repositories = Repositories(token: token!);
    ApiResponse apiResponse = await repositories.saveBucket(bucket!);
    if (apiResponse.wasSuccessful()) {
      Bucket updatedBucket = Bucket.fromMap(apiResponse.getDataAsMap());
      Navigator.of(context).pop(updatedBucket);
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(apiResponse.getError())),
    );
  }

  @override
  Widget build(BuildContext context) {
    bucket = ModalRoute.of(context)?.settings.arguments as Bucket;
    if (!isNew()) {
      name = bucket!.name;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitleText()),
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
              ),
              onChanged: (value) {
                name = value;
              },
            ),
            ElevatedButton(
                onPressed: saveBucket, child: const Text('Save Bucket')),
          ],
        ),
      ),
    );
  }
}
