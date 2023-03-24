import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/main.library.dart';
import 'package:moolahgo/modules/home/cubit/cubits.dart';
import 'package:moolahgo/modules/home/models/models.dart';
import 'package:moolahgo/modules/home/screens/fragments/fragments.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AdvertisementCubit>(
                create: (context) =>
                    getIt.get<AdvertisementCubit>()..advertisementGet(),
              ),
              BlocProvider<UserCubit>(
                create: (context) => getIt.get<UserCubit>()..userGet(),
              ),
            ],
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  final userData = state.userData;
                  return _buildUserSuccess(context, userData: userData);
                } else if (state is UserLoading) {
                  return _buildStateLoading();
                } else {
                  return _buildStateFailed(context, type: "User");
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserSuccess(BuildContext context, {UserModel userData}) {
    return BlocBuilder<AdvertisementCubit, AdvertisementState>(
      builder: (context, state) {
        if (state is AdvertisementSuccess) {
          final advertisementData = state.advertisementDatas;
          return HomeFragment(
            advertisementData: advertisementData,
            userData: userData,
          );
        } else if (state is AdvertisementLoading) {
          return _buildStateLoading();
        } else {
          return _buildStateFailed(context, type: "Advertisement");
        }
      },
    );
  }

  Widget _buildStateLoading() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SkeletonLoaderSquare(
              width: 200,
              height: 50,
            ),
            SkeletonLoaderCircle(
              size: 40,
            ),
          ],
        ),
        SizedBox(height: 30),
        Column(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SkeletonLoaderSquare(
                width: double.infinity,
                height: 80,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStateFailed(BuildContext context, {String type}) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("Sorry their is something error, failed fetch the $type data"),
          SizedBox(height: 20),
          CustomButton(
            width: 50,
            onTap: () {
              if (type == "User") {
                context.read<UserCubit>().userGet();
              } else if (type == "Advertisement") {
                context.read<AdvertisementCubit>().advertisementGet();
              }
            },
          )
        ],
      ),
    );
  }
}
