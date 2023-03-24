import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/modules/home/models/models.dart';
import 'package:moolahgo/modules/home/screens/components/components.dart';
import 'package:moolahgo/modules/detail/screens/detail_screen.dart';
import 'package:moolahgo/modules/user/user.dart';

class HomeFragment extends StatefulWidget {
  final List<PayloadModel> advertisementData;
  final UserModel userData;

  const HomeFragment({
    Key key,
    this.advertisementData,
    this.userData,
  }) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  bool returnFromDetailPage = false;
  ValueNotifier<bool> stateNotifier;
  String selectedSortType;
  final sorting = [
    "default",
    "appearanceOrder",
  ];

  @override
  void initState() {
    super.initState();
    _initAnimationController();
  }

  void _initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    )..addListener(() {
        setState(() {});
      });

    stateNotifier = ValueNotifier(returnFromDetailPage)
      ..addListener(() {
        if (stateNotifier.value) {
          _animationController.reverse(from: 1.0);
          stateNotifier.value = false;
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    stateNotifier.dispose();
    super.dispose();
  }

  void onSelected(PayloadModel payloadData) async {
    _animationController.forward(from: 0.0);
    stateNotifier.value = await Navigator.of(context).push(
      FadePageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return DetailScreen(
            payloadData: payloadData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _appBar(),
        SizedBox(height: 20),
        _buildPromotionList(context),
      ],
    );
  }

  Widget _buildPromotionList(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: widget.advertisementData.map((e) {
            return _promoCard(e, context);
          }).toList(),
        ),
      ),
    );
  }

  Widget _promoCard(PayloadModel e, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () => onSelected(e),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.55,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: '${e.id}-img',
                      child: ImagePlaceholder(
                        height: 70,
                        width: 70,
                        assetsPlaceholder:
                            AssetImage("assets/images/${e.imagePath}"),
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                        imageFit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: TypographyCustom.bodyText.bodyCustomSize(e.title,
                          color: Theme.of(context).appBarTheme.color,
                          fontSize: 10),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).appBarTheme.color,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Hero(
                  tag: '${e.id}-title',
                  flightShuttleBuilder: (
                    BuildContext flightContext,
                    Animation<double> animation,
                    HeroFlightDirection flightDirection,
                    BuildContext fromHeroContext,
                    BuildContext toHeroContext,
                  ) {
                    return AdvertisementTitle(
                      title: e.name,
                      viewState: flightDirection == HeroFlightDirection.push
                          ? ViewState.enlarge
                          : ViewState.shrink,
                      smallFontSize: 15.0,
                      largeFontSize: 48.0,
                    );
                  },
                  child: AdvertisementTitle(
                    title: e.name,
                    viewState: ViewState.shrunk,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserScreen(user: widget.userData)),
        );
      },
      child: Row(
        children: <Widget>[
          Expanded(
              child:
                  TypographyCustom.heading.h3("Newest Promos From MoolahGo")),
          SizedBox(width: 30),
          ImagePlaceholder(
            height: 45,
            width: 45,
            shape: BoxShape.circle,
            imageUrl: widget.userData.data.photo,
          ),
        ],
      ),
    );
  }
}
