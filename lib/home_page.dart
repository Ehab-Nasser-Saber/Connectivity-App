import 'package:check_internet_connection_using_bloc/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state is NotConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.redAccent,
            ));
          }
        },
        builder: (context, state) {
          if (state is ConnectedState) {
            return _buildTextWidget(state.message);
          } else if (state is NotConnectedState) {
            return _buildTextWidget(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildTextWidget(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
