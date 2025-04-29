import 'package:flutter/material.dart';
import 'package:rest_api_integration/model/post_model.dart';
import 'package:rest_api_integration/services/remot_service.dart';

class HomeScrenn extends StatefulWidget {
  const HomeScrenn({super.key});

  @override
  State<HomeScrenn> createState() => _HomeScrennState();
}

class _HomeScrennState extends State<HomeScrenn> {
  List<Post>? post;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    post = await RemotService().getPsot();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator(value: 6,))
              : post == null || post!.isEmpty
              ? const Center(child: Text("No posts available"))
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: post!.length > 50 ? 50 : post!.length,
                itemBuilder: (context, index) {
                  final item = post![index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.body,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
