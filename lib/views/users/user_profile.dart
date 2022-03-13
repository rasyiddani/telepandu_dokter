part of '../views.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late bool isLoading = false;

  @override
  void initState() {
    getApi();

    super.initState();
  }

  getApi() async {
    setState(() {
      isLoading = true;
    });

    await Provider.of<AuthProvider>(context, listen: false).getUserProfile();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: CustomColor.light4Color,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: CardProfile(
                    user: authProvider.profile,
                  )),
              Visibility(
                  visible: isLoading,
                  child: Container(
                    color: CustomColor.mainColor.withOpacity(0.2),
                    height: double.infinity,
                    width: double.infinity,
                    child: const Center(
                      child: LoadingCircle(),
                    ),
                  ))
            ],
          )),
    );
  }
}
