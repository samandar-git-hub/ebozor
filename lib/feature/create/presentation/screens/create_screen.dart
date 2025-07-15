import 'package:ebozor/core/utils/size_utils.dart';
import 'package:ebozor/core/widgets/my_text.dart';
import 'package:ebozor/feature/create/domain/entity/ad_create_entity.dart';
import 'package:ebozor/feature/create/presentation/bloc/ad_create_bloc.dart';
import 'package:ebozor/feature/create/presentation/bloc/ad_create_event.dart';
import 'package:ebozor/feature/create/presentation/bloc/ad_create_state.dart';
import 'package:ebozor/feature/create/presentation/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _priceUzsController = TextEditingController();
  final _descController = TextEditingController();
  final _phoneController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    context.read<AdCreateBloc>().add(
      UploadAdEvent(
        ad: AdCreateEntity(
          title: _titleController.text,
          price: double.tryParse(_priceUzsController.text) ?? 0,
          description: _descController.text,
          contact: _phoneController.text,
          date: DateTime.now().toIso8601String(),
          image: "",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: BlocBuilder<AdCreateBloc, AdCreateState>(
              builder: (context, state) {
                if (state is AdCreateLoading) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight(context) * 0.4,
                      ),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is AdCreateSuccess) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight(context) * 0.4,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _titleController.clear();
                          _priceUzsController.clear();
                          _descController.clear();
                          _phoneController.clear();
                          context.read<AdCreateBloc>().add(
                            ResetAdCreateEvent(),
                          );
                        },
                        child: MyText("obbo"),
                      ),
                    ),
                  );
                } else if (state is AdCreateFailure) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight(context) * 0.4,
                      ),
                      child: MyText(state.message),
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text("Yaratish", style: TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(height: 20),
                    const Text("Rasmlar", style: TextStyle(fontSize: 18)),

                    const SizedBox(height: 20),
                    CustomInputField(
                      hintText: "Sarlavha:",
                      controller: _titleController,
                      minLines: 1,
                      maxLines: 2,
                      validator: (v) => v!.isEmpty ? "Sarlavha kiriting" : null,
                    ),
                    CustomInputField(
                      hintText: "Narx:",
                      suffixText: "UZS",
                      maxLength: 9,
                      controller: _priceUzsController,
                      keyboardType: TextInputType.number,
                      validator: (v) => v!.isEmpty ? "Narx kiriting" : null,
                    ),
                    CustomInputField(
                      hintText: "Tavsif:",
                      controller: _descController,
                      minLines: 1,
                      maxLines: 10,
                      validator: (v) => v!.isEmpty ? "Tavsif kiriting" : null,
                    ),
                    CustomInputField(
                      hintText: "Telefon raqam:",
                      controller: _phoneController,
                      maxLength: 30,
                      validator: (v) =>
                          v!.isEmpty ? "Telefon raqamni kiriting" : null,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: Center(child: Text("Saqlash")),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: _submit,
                            child: Card(
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 18),
                                child: Center(child: Text("E'lon berish")),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
