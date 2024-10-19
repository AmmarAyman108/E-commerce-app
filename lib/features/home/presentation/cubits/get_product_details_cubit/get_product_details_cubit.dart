import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_product_details_state.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {
  GetProductDetailsCubit() : super(GetProductDetailsInitial());
}
