
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technicaltask/presentation_layer/components/list_of_images.dart';
import 'package:technicaltask/presentation_layer/screens/home/cubit/cubit.dart';
import 'package:technicaltask/presentation_layer/screens/home/cubit/states.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    ExhibitCubit.get(context).getExhibitList();

  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
            appBar: AppBar(),
            body:BlocConsumer<ExhibitCubit, ExhibitsLoaderStates>(
                builder: (context, state){
                  var exhibitCubit = ExhibitCubit.get(context);
                  if(state is ExhibitLoadingStates){
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemBuilder: (context,index)=>ListOfImages(exhibit: exhibitCubit.allExhibit[index] ,),
                    itemCount: exhibitCubit.allExhibit.length
                    ,
                  );
                  },
                  listener: (context, state){
                  if(state is ExhibitErrorStates){
                    print(state.error);
                  }
                  }
              ),

          );


  }
}
