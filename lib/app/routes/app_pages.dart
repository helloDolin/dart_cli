import 'package:get/get.dart';
import 'package:myth/app/modules/audit/audit_task/bindings/audit_task_binding.dart';
import 'package:myth/app/modules/audit/audit_task/views/audit_task_level_view.dart';
import 'package:myth/app/modules/audit/audit_task/views/audit_task_view.dart';
import 'package:myth/app/modules/decompose_detail/bindings/decompose_detail_binding.dart';
import 'package:myth/app/modules/decompose_detail/views/decompose_detail_view_new.dart';

import '../modules/activity/activity/bindings/activity_binding.dart';
import '../modules/activity/activity/views/activity_view.dart';
import '../modules/activity/detail/bindings/activity_detail_binding.dart';
import '../modules/activity/detail/views/activity_detail_view.dart';
import '../modules/audit/audit_mine/bindings/audit_mine_binding.dart';
import '../modules/audit/audit_mine/views/audit_mine_view.dart';
import '../modules/audit/audit_notice/bindings/audit_notice_binding.dart';
import '../modules/audit/audit_notice/views/audit_notice_view.dart';
import '../modules/audit/time_keeping/bindings/time_keeping_binding.dart';
import '../modules/audit/time_keeping/views/time_keeping_view.dart';
import '../modules/composite/buy_material/bindings/buy_material_binding.dart';
import '../modules/composite/buy_material/views/buy_material_view.dart';
import '../modules/composite/composite_detail/bindings/composite_detail_binding.dart';
import '../modules/composite/composite_detail/views/composite_detail_view.dart';
import '../modules/composite/related_notice/bindings/related_notice_binding.dart';
import '../modules/composite/related_notice/views/related_notice_view.dart';
import '../modules/decompose/decompose_select_material/bindings/decompose_select_material_binding.dart';
import '../modules/decompose/decompose_select_material/views/decompose_select_material_view.dart';
import '../modules/detail/consignment/bindings/consignment_sales_binding.dart';
import '../modules/detail/consignment/view/consignment_sales_view.dart';
import '../modules/detail/delegation/bindings/delegation_list_binding.dart';
import '../modules/detail/delegation/bindings/delegation_purchase_binding.dart';
import '../modules/detail/delegation/view/delegation_list_view.dart';
import '../modules/detail/delegation/view/delegation_purchase_view.dart';
import '../modules/detail/k_chart/bindings/k_chart_binding.dart';
import '../modules/detail/k_chart/views/k_chart_view.dart';
import '../modules/detail/notice/binding/nft_notice_binding.dart';
import '../modules/detail/notice/view/nft_notice_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/market/market/bindings/market_binding.dart';
import '../modules/market/market/views/market_view.dart';
import '../modules/market/search/bindings/market_search_binding.dart';
import '../modules/market/search/views/market_search_view.dart';
import '../modules/material_select/binding/multi_material_picker_binding.dart';
import '../modules/material_select/view/multi_material_picker_view.dart';
import '../modules/mine/about/about_view.dart';
import '../modules/mine/identity/bindings/identity_check_binding.dart';
import '../modules/mine/identity/view/identity_check_view.dart';
import '../modules/mine/mine/bindings/mine_binding.dart';
import '../modules/mine/mine/blind_box/bindings/blind_box_detail_binding.dart';
import '../modules/mine/mine/blind_box/views/blind_box_detail_view.dart';
import '../modules/mine/mine/fold/bindings/manager_my_collection_binding.dart';
import '../modules/mine/mine/fold/bindings/mine_fold_collection_binding.dart';
import '../modules/mine/mine/fold/views/manager_my_collection_view.dart';
import '../modules/mine/mine/fold/views/mine_fold_collection_view.dart';
import '../modules/mine/mine/views/mine_view.dart';
import '../modules/mine/order/bindings/digital_detail_binding.dart';
import '../modules/mine/order/views/digital_detail_view.dart';
import '../modules/mine/sell_record/bindings/sell_record_binding.dart';
import '../modules/mine/sell_record/views/sell_record_view.dart';
import '../modules/mine/setting/bindings/setting_binding.dart';
import '../modules/mine/setting/view/setting_view.dart';
import '../modules/mine/tx_passwrod/view/pwd_set_view.dart';
import '../modules/mine/wallet/alipay_withdrawal/bindings/alipay_withdrawal_binding.dart';
import '../modules/mine/wallet/alipay_withdrawal/views/alipay_withdrawal_view.dart';
import '../modules/mine/wallet/bindings/my_bank_card_binding.dart';
import '../modules/mine/wallet/bindings/my_wallet_binding.dart';
import '../modules/mine/wallet/bindings/wallet_add_bank_card_binding.dart';
import '../modules/mine/wallet/bindings/wallet_change_add_card_binding.dart';
import '../modules/mine/wallet/bindings/wallet_change_withdrawal_binding.dart';
import '../modules/mine/wallet/bindings/wallet_fast_buy_binding.dart';
import '../modules/mine/wallet/bindings/wallet_kft_open_acccount_binding.dart';
import '../modules/mine/wallet/bindings/wallet_open_yop_binding.dart';
import '../modules/mine/wallet/bindings/wallet_payment_detail_binding.dart';
import '../modules/mine/wallet/bindings/wallet_recharge_binding.dart';
import '../modules/mine/wallet/bindings/wallet_withdrawal_binding.dart';
import '../modules/mine/wallet/bindings/wallet_withdrawal_detail_binding.dart';
import '../modules/mine/wallet/bindings/yop_identity_photo_binding.dart';
import '../modules/mine/wallet/union_rebate/bindings/union_rebate_binding.dart';
import '../modules/mine/wallet/union_rebate/views/union_rebate_view.dart';
import '../modules/mine/wallet/views/my_bank_card_view.dart';
import '../modules/mine/wallet/views/my_wallet_view.dart';
import '../modules/mine/wallet/views/wallet_add_bank_card_view.dart';
import '../modules/mine/wallet/views/wallet_change_add_card_view.dart';
import '../modules/mine/wallet/views/wallet_change_withdrawal_detail_view.dart';
import '../modules/mine/wallet/views/wallet_change_withdrawal_view.dart';
import '../modules/mine/wallet/views/wallet_fast_buy_view.dart';
import '../modules/mine/wallet/views/wallet_kft_open_account_view.dart';
import '../modules/mine/wallet/views/wallet_open_yop_view.dart';
import '../modules/mine/wallet/views/wallet_payment_detail_view.dart';
import '../modules/mine/wallet/views/wallet_recharge_view.dart';
import '../modules/mine/wallet/views/wallet_withdrawal_view.dart';
import '../modules/mine/wallet/views/yop_identity_photo_view.dart';
import '../modules/mine/withdraw/bindings/withdraw_binding.dart';
import '../modules/mine/withdraw/view/withdraw_view.dart';
import '../modules/notice/notice/bindings/notice_binding.dart';
import '../modules/notice/notice/views/notice_view.dart';
import '../modules/notice/notice_detail/bindings/notice_detail_binding.dart';
import '../modules/notice/notice_detail/views/notice_detail_view.dart';
import '../modules/notice/search/bindings/search_notice_binding.dart';
import '../modules/notice/search/views/search_notice_view.dart';
import '../modules/optional/detail/bindings/trend_nft_detail_binding.dart';
import '../modules/optional/detail/view/trend_nft_detail_view.dart';
import '../modules/optional/history/bindings/trend_nft_history_binding.dart';
import '../modules/optional/history/view/trend_nft_history_view.dart';
import '../modules/optional/optional/bindings/optional_binding.dart';
import '../modules/optional/optional/views/optional_view.dart';
import '../modules/payment/bindings/payment_cashier_binding.dart';
import '../modules/payment/bindings/payment_invoice_binding.dart';
import '../modules/payment/bindings/payment_order_delegate_info_binding.dart';
import '../modules/payment/bindings/payment_order_list_binding.dart';
import '../modules/payment/bindings/payment_order_search_binding.dart';
import '../modules/payment/bindings/payment_order_total_binding.dart';
import '../modules/payment/views/payment_cashier_view.dart';
import '../modules/payment/views/payment_invoice_view.dart';
import '../modules/payment/views/payment_order_list_delegate_info_view.dart';
import '../modules/payment/views/payment_order_list_view.dart';
import '../modules/payment/views/payment_order_search_view.dart';
import '../modules/payment/views/payment_order_total_view.dart';
import '../modules/preview_photo/bindings/preview_photo_binding.dart';
import '../modules/preview_photo/view/preview_photo_view.dart';
import '../modules/prop/box/box_batch/bindings/box_batch_binding.dart';
import '../modules/prop/box/box_batch/views/box_batch_view.dart';
import '../modules/prop/box/box_detail/bindings/box_detail_binding.dart';
import '../modules/prop/box/box_detail/views/box_detail_view.dart';
import '../modules/prop/box/box_result/bindings/box_result_binding.dart';
import '../modules/prop/box/box_result/views/box_result_view.dart';
import '../modules/prop/overtime_recovery/bindings/overtime_recovery_binding.dart';
import '../modules/prop/overtime_recovery/views/overtime_recovery_view.dart';
import '../modules/prop/prop_detail/bindings/prop_detail_binding.dart';
import '../modules/prop/prop_detail/views/prop_detail_view.dart';
import '../modules/prop/prop_history/bindings/prop_history_binding.dart';
import '../modules/prop/prop_history/views/prop_history_view.dart';
import '../modules/prop/prop_list/bindings/prop_list_binding.dart';
import '../modules/prop/prop_list/views/prop_list_view.dart';
import '../modules/proxy/bindings/proxy_binding.dart';
import '../modules/proxy/view/proxy_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/view/splash_view.dart';
import '../modules/upgrade/binding/upgrade_details_binding.dart';
import '../modules/upgrade/buy_material/binding/upgrade_buy_material_binding.dart';
import '../modules/upgrade/buy_material/view/upgrade_buy_material_view.dart';
import '../modules/upgrade/view/upgrade_details_view.dart';
import '../modules/webview/bindings/webview_binding.dart';
import '../modules/webview/views/webview_view.dart';
import '../modules/test_page_one/test_page_one_binding.dart';
import '../modules/test_page_one/test_page_one_view.dart;
import '../modules/home/tab2/test_page_tab2/test_page_tab2_view.dart;
import '../modules/home/tab2/test_page_tab2/test_page_tab2_binding.dart';
import '../modules/home/tab3/test_page_tab3/test_page_tab3_binding.dart';
import '../modules/home/tab3/test_page_tab3/test_page_tab3_view.dart;

// ignore_for_file: non_constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String get INITIAL => Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.TEST_PAGE_TAB3,
      page: () => const TestPageTab3View(),
      binding: TestPageTab3Binding(),
    ),
  
    GetPage(
      name: Routes.TEST_PAGE_TAB2,
      page: () => const TestPageTab2View(),
      binding: TestPageTab2Binding(),
    ),
  
    GetPage(
      name: Routes.TEST_PAGE_ONE,
      page: () => const TestPageOneView(),
      binding: TestPageOneBinding(),
    ),
  
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.MARKET,
      page: () => const MarketView(),
      binding: MarketBinding(),
    ),
    GetPage(
      name: _Paths.MARKET_SEARCH,
      page: () => const MarketSearchView(),
      binding: MarketSearchBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY,
      page: () => const ActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.MINE,
      page: () => const MineView(),
      binding: MineBinding(),
    ),
    GetPage(
      name: _Paths.NOTICE,
      page: () => const NoticeView(),
      binding: NoticeBinding(),
      children: [
        GetPage(
          name: _Paths.NOTICE_DETAIL,
          page: () => const NoticeDetailView(),
          binding: NoticeDetailBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.OPTIONAL,
      page: () => const OptionalView(),
      binding: OptionalBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      // transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.PROXY,
      page: () => const ProxyView(),
      binding: ProxyBinding(),
      // transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.WEBVIEW,
      page: () => const WebviewView(),
      binding: WebviewBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
    ),
    GetPage(
      name: _Paths.WITHDRAW,
      page: () => const WithdrawView(),
      binding: WithdrawBinding(),
    ),
    GetPage(
      name: _Paths.TX_PWD_SETTING,
      page: () => const PwdSetView(),
    ),
    GetPage(
      name: _Paths.IDENTITY_CHECK,
      page: () => const IdentityCheckView(),
      binding: IdentityCheckBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => const MyWalletView(),
      binding: MyWalletBinding(),
    ),
    GetPage(
      name: _Paths.ALIPAY_WITHDRAWAL,
      page: () => const AlipayWithdrawalView(),
      binding: AlipayWithdrawalBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_KFT,
      page: () => const FastBuyWalletView(),
      binding: WalletFastBuyBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_OPEN_YOP,
      page: () => const WalletOpenYopView(),
      binding: WalletOpenYopBinding(),
    ),
    GetPage(
      name: _Paths.YOP_IDENTITY,
      page: () => const YopIdentityPhotoView(),
      binding: YopIdentityPhotoBinding(),
    ),
    GetPage(
      name: _Paths.MY_BANK_CARD,
      page: () => const MyBankCardView(),
      binding: MyBankCardBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BANK_CARD,
      page: () => const WalletAddCardView(),
      binding: WalletAddCardBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_RECHARGE,
      page: () => const WalletRechargeView(),
      binding: WalletRechargeBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_WITHDRAWAL,
      page: () => const WalletWithdrawalView(),
      binding: WalletWithdrawalBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_KFT_OPEN,
      page: () => const KFTOpenAccountView(),
      binding: KFTOpenAccountBinding(),
    ),
    GetPage(
        name: _Paths.ACTIVE_DETAIL,
        page: () => const ActivityDetailView(),
        binding: ActivityDetailBinding()),
    // GetPage(
    //   name: _Paths.NFT_DETAIL,
    //   page: () => const NftDetailView(),
    //   binding: NftDetailBinding(),
    // ),
    GetPage(
      name: _Paths.WALLET_KFT_FAST_BUY,
      page: () => const PaymentCashierView(),
      binding: PaymentCashierBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_ORDER_LIST,
      page: () => const PaymentOrderListView(),
      binding: PaymentOrderListBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_CHANGE_MAIN,
      page: () => const WalletChangeWithdrawalView(),
      binding: WalletChangeWithdrawalBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_CHANGE_WITHDRAWAL,
      page: () => const WalletWithdrawalDetailView(),
      binding: WalletWithdrawalDetailBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_CHANGE_ADD_CARD,
      page: () => const WalletChangeAddCardView(),
      binding: WalletChangeAddCardBinding(),
    ),
    GetPage(
      name: _Paths.DELEGATION_PURCHASE,
      page: () => const DelegationPurchaseView(),
      binding: DelegationPurchaseBinding(),
    ),
    GetPage(
      name: _Paths.CONSIGNMENT_SALES,
      page: () => const ConsignmentSalesView(),
      binding: ConsignmentSalesBinding(),
    ),
    GetPage(
      name: _Paths.NFT_NOTICE,
      page: () => const NftNoticeView(),
      binding: NftNoticeBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_ORDER_DETAIL_LIST,
      page: () => const WalletPaymentDetailView(),
      binding: WalletPaymentDetailBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_NOTICE,
      page: () => const SearchNoticeView(),
      binding: SearchNoticeBinding(),
    ),
    GetPage(
      name: _Paths.DIGITAL_DETAIL_ORDER,
      page: () => const DigitalDetailView(),
      binding: DigitalDetailBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_ORDER_DELEGATE_DETAIL,
      page: () => const OrderDelegateInfoDetailView(),
      binding: OrderDelegateInfoBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO_PREVIEW,
      page: () => const PreViewPhotoView(),
      binding: PreviewPhotoBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_ORDER_SEARCH_LIST,
      page: () => const PaymentOrderSearchView(),
      binding: PaymentOrderSearchBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_ORDER_TOTAL_LIST,
      page: () => const PaymentOrderTotalView(),
      binding: PaymentOrderTotalBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_INVOICE,
      page: () => const PaymentInvoiceView(),
      binding: PaymentInvoiceBinding(),
    ),
    GetPage(
      name: _Paths.COMPOSITE_DETAIL,
      page: () => const CompositeDetailView(),
      binding: CompositeDetailBinding(),
    ),
    GetPage(
      name: _Paths.BUY_MATERIAL,
      page: () => const BuyMaterialView(),
      binding: BuyMaterialBinding(),
    ),
    GetPage(
      name: _Paths.K_CHART,
      page: () => const KChartView(),
      binding: KChartBinding(),
    ),
    GetPage(
      name: _Paths.DECOMPOSE_DETAIL,
      page: () => const DecomposeDetailView(),
      binding: DecomposeDetailBinding(),
    ),
    GetPage(
      name: _Paths.DECOMPOSE_SELECT_MATERIAL,
      page: () => const DecomposeSelectMaterialView(),
      binding: DecomposeSelectMaterialBinding(),
    ),
    GetPage(
      name: _Paths.UPGRADE_DETAIL,
      page: () => const UpgradeDetailsView(),
      binding: UpgradeDetailsBinding(),
    ),
    GetPage(
      name: _Paths.UPGRADE_BUY_MATERIAL,
      page: () => const UpgradeBuyMaterialView(),
      binding: UpgradeBuyMaterialBinding(),
    ),
    GetPage(
      name: _Paths.PROP_DETAIL,
      page: () => const PropDetailView(),
      binding: PropDetailBinding(),
    ),
    GetPage(
      name: _Paths.PROP_LIST,
      page: () => const PropListView(),
      binding: PropListBinding(),
    ),
    GetPage(
      name: _Paths.PROP_HISTORY,
      page: () => const PropHistoryView(),
      binding: PropHistoryBinding(),
    ),

    GetPage(
      name: _Paths.BOX_BATCH,
      page: () => const BoxBatchView(),
      binding: BoxBatchBinding(),
    ),
    GetPage(
      name: _Paths.BOX_RESULT,
      page: () => const BoxResultView(),
      binding: BoxResultBinding(),
    ),
    GetPage(
      name: _Paths.BOX_DETAIL,
      page: () => const BoxDetailView(),
      binding: BoxDetailBinding(),
    ),
    GetPage(
      name: _Paths.TREND_NFT_DETAIL,
      page: () => const TrendNftDetailView(),
      binding: TrendNftDetailBinding(),
    ),
    GetPage(
      name: _Paths.TREND_NFT_HISTORY,
      page: () => const TrendNftHistoryView(),
      binding: TrendNftHistoryBinding(),
    ),
    GetPage(
      name: _Paths.SELL_RECORD_LIST,
      page: () => const SellRecordView(),
      binding: SellRecordBinding(),
    ),
    GetPage(
      name: _Paths.UNION_REBATE,
      page: () => const UnionRebateView(),
      binding: UnionRebateBinding(),
    ),
    GetPage(
      name: _Paths.FOLD_COLLECTION_LIST,
      page: () => const MineFoldCollectionView(),
      binding: MineFoldCollectionBinding(),
    ),
    GetPage(
      name: _Paths.MY_COLLECTION_MANAGER,
      page: () => const ManagerMyCollectionView(),
      binding: ManagerMyCollectionBinding(),
    ),
    GetPage(
      name: _Paths.BLIND_BOX_DETAIL,
      page: () => const BlindBoxDetailView(),
      binding: BlindBoxDetailBinding(),
    ),
    GetPage(
      name: _Paths.MULTI_MATERIAL_PICKER,
      page: () => const MultiMaterialPickerView(),
      binding: MultiMaterialPickerBinding(),
    ),
    GetPage(
      name: _Paths.OVERTIME_RECOVERY,
      page: () => const OvertimeRecoveryView(),
      binding: OvertimeRecoveryBinding(),
    ),

    GetPage(
      name: _Paths.RELATED_NOTICE,
      page: () => const RelatedNoticeView(),
      binding: RelatedNoticeBinding(),
    ),
    GetPage(
      name: _Paths.AUDIT_NOTICE,
      page: () => const AuditNoticeView(),
      binding: AuditNoticeBinding(),
    ),
    GetPage(
      name: _Paths.TIME_KEEPING,
      page: () => const TimeKeepingView(),
      binding: TimeKeepingBinding(),
    ),
    GetPage(
      name: _Paths.AUDIT_MINE,
      page: () => const AuditMineView(),
      binding: AuditMineBinding(),
    ),
    GetPage(
      name: _Paths.DELEGATION_LIST,
      page: () => const DelegationListView(),
      binding: DelegationListBinding(),
    ),
    GetPage(
      name: Routes.LEVEL_TASK,
      page: () => const AuditTaskLevelView(),
      binding: AuditTaskLevelBinding(),
    ),
    GetPage(
      name: Routes.MY_TASK,
      page: () => const AuditTaskView(),
      binding: AuditTaskBinding(),
    ),
  ];
}
