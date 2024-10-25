abstract class Routes {
  static const splash = "/splash";
  static const startup = "/startUp";
  static const forceUpdate = "/forceUpdate";
  static const introduction = "/introduction";
  static const login = "/login";
  static const registerSR = "/registerSR";
  static const forgetPasswordSr = "/forgetPasswordSr";

  static const confirmForgetPasswordSr = "/confirmForgetPasswordSr";

  static changePasswordSr({String? email}) => "/changePassword/${email ?? ''}";

  static const search = "/search";

  static const changePasswordRoute = "/changePassword/:email";

  static const detailStockRoute = "/stock/:stock";

  static goToDetailStock(String stockCode) => "/stock/$stockCode";

  static const welcome = "/welcome";

  static const logoutDialog = "/logoutDialog";
  static const logoutSR = "/logoutSR";
  static const watchlist = "/watchlist/:id";

  static goToWatchlist(String id) => "/watchlist/$id";

  static const home = "/home";
  static const market = "/market";
  static const order = "/order";
  static const community = "/community";

  static const loadingDialog = "/loading";

  static const profile = "/profile";

  static const loginPin = "/loginPin";
  static const loginInvestScreen = "/loginInvestScreen";

  static const topUpScreen = '/top_up';
  static const withdraw = '/withdraw';
  static const bankTransfers = '/bank_transfers';


  static const changePinScreen = "/change_pin";

  static const changePasswordInvestScreen = "/change_password_invest";

  static const shareCuan = "/share_cuan";
  static const mutasi = "/mutasi";
  static const portfolio = "/portfolio";
  static const notifications = "/notification";

  static const personalDetail = "/personal_detail";
  static const giveIdea = "/give_idea";
  static const manageBankAccount = "/manage_bank_account";
  static const tnc = "/tnc";
  static const dictionary = "/dictionary";
  static const eStatement = "/e_statement";
  static const help = "/help";
  static const accountSecurity = "/accountSecurity";
  


  static String messageDialog(String message, [bool bold = false]) =>
      "/message_dialog?message=$message&bold=$bold";
}
