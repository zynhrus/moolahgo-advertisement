import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/modules/home/models/models.dart';
import 'package:moolahgo/modules/home/screens/components/components.dart';

class DetailScreen extends StatefulWidget {
  final PayloadModel payloadData;

  const DetailScreen({Key key, this.payloadData}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: _detailBody(),
      ),
    );
  }

  Widget _detailBody() {
    final dx = 0;
    double maxOffset = MediaQuery.of(context).size.width;
    final payloadData = widget.payloadData;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 310.0,
            ),
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: dx * 1.5,
                  child: Opacity(
                    opacity: 1.0 - (dx.abs() / maxOffset),
                    child: Hero(
                      tag: '${payloadData.id}-img',
                      child: ImagePlaceholder(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 300.0,
                        assetsPlaceholder: AssetImage(
                            "assets/images/${payloadData.imagePath}"),
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                        imageFit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 250.0,
                  left: dx * 1.4 + 16.0,
                  child: FractionalTranslation(
                    translation: Offset(0.0, 0.5),
                    child: Opacity(
                      opacity: 1.0 - (dx.abs() / maxOffset),
                      child: Hero(
                        tag: '${payloadData.id}-title',
                        child: AdvertisementTitle(
                          title: payloadData.name,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color:
                                  Theme.of(context).textTheme.headline1.color,
                            ),
                          ],
                          viewState: ViewState.enlarged,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(dx * 1.2, 0.0, 0.0),
            child: Opacity(
              opacity: 1.0 - (dx.abs() / maxOffset),
              child: Padding(
                padding: const EdgeInsets.all(defaultMargin),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TypographyCustom.heading.h4(
                      payloadData.title,
                    ),
                    SizedBox(height: 15),
                    TypographyCustom.subheading.subHeading1medium(
                      payloadData.body,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white10,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop(true);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
