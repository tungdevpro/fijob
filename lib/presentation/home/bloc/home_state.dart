import 'package:yh_basic/common/blocs/base_state.dart';

import '../../../domain/enities/post_entity.dart';

class HomeState extends ViewState<Post> {
  HomeState({Post? item}) : super(data: item ?? Post());
}

// class HomeInitialState extends HomeState {
//   @override
//   List get props => [];
// }
//
// class HomeGetNewJobState extends HomeState {
//   HomeGetNewJobState(Post? input) : super(item: input);
//   @override
//   List get props => [data];
// }
