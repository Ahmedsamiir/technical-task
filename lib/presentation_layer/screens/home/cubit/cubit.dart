
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technicaltask/controller_layer/exhibit_loader.dart';
import 'package:technicaltask/model_layer/model.dart';
import 'package:technicaltask/presentation_layer/screens/home/cubit/states.dart';

class ExhibitCubit extends Cubit<ExhibitsLoaderStates> {

  ExhibitCubit() : super(ExhibitInitialStates());

  static ExhibitCubit get(context) => BlocProvider.of(context);
  List<Exhibit> allExhibit=[];
  Future<void> getExhibitList() async{
    emit(ExhibitLoadingStates());
    try{
      allExhibit = await RestExhibitsLoader().getExhibitList();
      emit(ExhibitSuccessStates());

    }catch(e){
      emit(ExhibitErrorStates(e.toString()));
    }


  }

}