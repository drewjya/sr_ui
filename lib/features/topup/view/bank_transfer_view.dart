import 'package:sr_ui/core/core.dart';
import 'package:sr_ui/features/topup/widget/bank_transfer_card.dart';
import 'package:sr_ui/features/topup/widget/bank_transfer_warning.dart';

class BankTransferView extends HookConsumerWidget {
  const BankTransferView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final items = [
      VPanelItem(
        title: "ATM Transfer",
        items: [
          "Visit the nearest ATM",
          "Select the language used",
          "Enter ATM pin",
          "Select the Transfer menu",
          "Then select the bank destination (make sure the bank destination matches the bank that Warga Cuan chose when opening a stock account, OK!)",
          "Enter the stock account number as stated on the page above.",
          "Fill in the nominal amount to be transferred by Warga Cuan",
          "Transaction completed. The RDN balance of the cuan citizen has increased!",
        ],
      ),
      VPanelItem(
        title: "M-Banking",
        items: [
          "Visit the nearest ATM",
          "Select the language used",
          "Enter ATM pin",
          "Select the Transfer menu",
          "Then select the bank destination (make sure the bank destination matches the bank that Warga Cuan chose when opening a stock account, OK!)",
          "Enter the stock account number as stated on the page above.",
          "Fill in the nominal amount to be transferred by Warga Cuan",
          "Transaction completed. The RDN balance of the cuan citizen has increased!",
        ],
      ),
      VPanelItem(
        title: "E-Wallet",
        items: [
          "Open the Citizens Cuan E-Wallet application",
          'Click the "Send Free Money" menu for Flip, the "Transfer" menu for OVO, "Pay" for GoPay and "Send from" for Dana',
          "Select the destination bank, enter the stock account number as stated on the page above.",
          'If the account number and name of the transfer destination are correct, click "Continue".',
          "Fill in the nominal amount to be transferred by WargaCuan. Then confirm the transaction.",
          "Congratulations, Warga Cuan's RDN balance has increased!",
        ],
      ),
    ];
    return ScaffoldBasic(
      titleText: "BANK TRANSFERS",
      onBack: () => ref.pop(),
      body: Container(
        margin: 20.horizontal,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VText(
                    "Please Transfer To:",
                    style: context.text.title,
                  ),
                  Gap(15.sp),
                  BankTransferCard(),
                  Gap(15.sp),
                  BankTransferWarning(),
                  Gap(15.sp),
                ],
              ),
            ),
            VExpansionPanelListSliver(
              items: items,
              sticky: false,
            ),
          ],
        ),
      ),
    );
  }
}
