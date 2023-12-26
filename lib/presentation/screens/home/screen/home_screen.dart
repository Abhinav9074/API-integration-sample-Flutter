// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mini_project2/application/home_bloc/home_cubit.dart';
import 'package:mini_project2/application/home_bloc/home_state.dart';
import 'package:mini_project2/domain/api/api_calling/api_functions.dart';
import 'package:mini_project2/presentation/screens/add/screen/add_screen.dart';
import 'package:mini_project2/presentation/screens/edit/screen/edit_screen.dart';
import 'package:mini_project2/presentation/themes/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              centerTitle: true,
              backgroundColor: Colors.black,
              title: const Text(
                'All Data',
                style: MyTextStyle.buttonText,
              ),
            ),
            body: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeProductsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeProductsLoadedState) {
                  return ListView.builder(
                      itemCount: state.allProducts.length,
                      itemBuilder: (context, index) {
                        final data = state.allProducts[index];
                        return SlidableAutoCloseBehavior(
                          child: Slidable(
                            key: Key(index.toString()),
                            startActionPane:  ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (ctx)async{
                                      bool val = await deleteData(data.id);
                                      if(val){
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Deleted Successfully'),backgroundColor: Colors.green,behavior: SnackBarBehavior.floating,));
                                      }else{
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something Went Wrong'),backgroundColor: Color.fromARGB(255, 255, 2, 2),behavior: SnackBarBehavior.floating,));
                                      }
                                    },
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                  SlidableAction(
                                    onPressed: (ctx){
                                      Navigator.of(context).push(MaterialPageRoute(builder: ((context) => EditScreen(id: data.id, userId: data.userId, title: data.title, body: data.body))));
                                    },
                                    backgroundColor: const Color(0xFF21B7CA),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'Edit',
                                  )
                                ]),
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    data.id.toString(),
                                    style: MyTextStyle.buttonTextBlack,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                      width: 420,
                                      child: Text(data.title,
                                          style: MyTextStyle.buttonTextBlack)),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Unknown Error Occured',
                        style: MyTextStyle.errorText,
                      ),
                    ],
                  ));
                }
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddScreen()));
              },
              child: const Icon(Icons.add),
            )));
  }
}
