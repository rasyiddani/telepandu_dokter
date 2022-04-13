part of 'components.dart';

class ListPatientComponent extends StatefulWidget {
  final ListPatientModel listToday;
  final bool isIndex0;
  final Function ontappMulai;
  final Function ontappSkip;
  const ListPatientComponent({
    Key? key,
    required this.ontappMulai,
    required this.ontappSkip,
    this.isIndex0 = false,
    required this.listToday,
  }) : super(key: key);

  @override
  State<ListPatientComponent> createState() => _ListPatientComponentState();
}

class _ListPatientComponentState extends State<ListPatientComponent> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Widget popupMessageSkip(id) {
      return AlertDialog(
        content: const Text("Apakah anda yakin skip pasien?"),
        actions: [
          TextButton(
            onPressed: () async {
              await Provider.of<ConsultProviders>(context, listen: false)
                  .skipQueue(id);
              Navigator.pop(context, 'Cancel');
              widget.ontappSkip();
            },
            child: const Text('Ya'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Batal', style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    }

    Future skipHandler(id) async {
      showDialog(
          context: context,
          builder: (BuildContext context) => popupMessageSkip(id));
    }

    //widget button
    Widget button() {
      return InkWell(
        onTap: () {
          null;
        },
        child: Container(
          height: 46,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: CustomColor.dark3Color,
          ),
          child: Center(
            child: Text(
              "Mulai",
              style: CustomStyle.profileTextButton
                  .copyWith(color: CustomColor.light1Color),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    //widget button with skip
    Widget buttonWithSkip(id, namePasien, phone) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AvPage(
                      namePasien: namePasien,
                      id: id,
                      phone: phone,
                    ),
                  ));
            },
            child: Container(
              height: 46,
              width: MediaQuery.of(context).size.width / 2 - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: CustomColor.mainColor,
              ),
              child: Center(
                child: Text(
                  "Mulai",
                  style: CustomStyle.profileTextButton
                      .copyWith(color: CustomColor.light4Color),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              skipHandler(id);
              // widget.ontappSkip();
            },
            child: Container(
              height: 46,
              width: MediaQuery.of(context).size.width / 3 - 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: CustomColor.errorColor,
              ),
              child: Center(
                child: Text(
                  "Skip",
                  style: CustomStyle.profileTextButton
                      .copyWith(color: CustomColor.light4Color),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      height: 146,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CustomColor.light3Color,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: CustomColor.dark3Color.withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.listToday.name!,
                style: CustomStyle.profileTextButton,
              ),
              Text(
                widget.listToday.queueNumber.toString(),
                style: CustomStyle.profileTextButton,
              )
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Text(
                  (widget.listToday.gender != "")
                      ? '${widget.listToday.gender!}, '
                      : widget.listToday.gender!,
                  style: CustomStyle.notifSubTitleText),
              Text(widget.listToday.age.toString(),
                  style: CustomStyle.notifSubTitleText),
            ],
          ),
          const SizedBox(height: 30),
          widget.isIndex0
              ? buttonWithSkip(widget.listToday.id, widget.listToday.name,
                  widget.listToday.phone)
              : button(),
        ],
      ),
    );
  }
}
