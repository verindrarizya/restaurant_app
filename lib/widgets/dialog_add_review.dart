import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/detail_restaurant_provider.dart';

class DialogAddReview extends StatefulWidget {
  final String id;

  const DialogAddReview({Key? key, required this.id}) : super(key: key);

  @override
  State<DialogAddReview> createState() => _DialogAddReviewState();
}

class _DialogAddReviewState extends State<DialogAddReview> {
  final TextEditingController _nameReviewController = TextEditingController();
  final TextEditingController _valueReviewController = TextEditingController();

  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Review"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameReviewController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Name"),
          ),
          const SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: _valueReviewController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Review"),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            final response = await Provider.of<DetailRestaurantProvider>(
                    context,
                    listen: false)
                .postNewReview(
                    id: widget.id,
                    name: _nameReviewController.text,
                    review: _valueReviewController.text);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(response)));
            Navigator.pop(context);
          },
          child: const Text("Submit"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          DetailRestaurantProvider(apiService: ApiService(), id: widget.id),
      builder: (context, child) {
        return _buildDialog(context);
      },
    );
  }

  @override
  void dispose() {
    _nameReviewController.dispose();
    _valueReviewController.dispose();
    super.dispose();
  }
}
