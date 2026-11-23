class EndPoints {
  //! Base URL
  static String baseUrl = 'https://musharek.evyx.lol';

  //! Authentication
  static String signIn = "$baseUrl/api/user/login";
  static String register = "$baseUrl/api/user/register";
  static String submitOtp = "$baseUrl/api/user/verify-mobile";
  static String getProfile = "$baseUrl/api/user/me";
  static String forgetPassword = "$baseUrl/api/user/forgot-password";
  static String submitForgetPasswordOtp =
      "$baseUrl/api/user/verify-forgot-password-otp";
  static String resetPassword = "$baseUrl/api/user/reset-password";
  static String resendCode = "$baseUrl/api/user/resend-otp";

  //!Profile
  static String updateProfile = "$baseUrl/api/user/profile/update";
  static String userDocumentsStatus = "$baseUrl/api/user/user-documents/status";
  static String documentDefinitions = "$baseUrl/api/user/document-definitions";
  static String userDocuments = "$baseUrl/api/user/user-documents";
  static String userDocument(int documentId) =>
      "$baseUrl/api/user/user-documents/$documentId";
  static String replaceUserDocument(int documentId) =>
      "$baseUrl/api/user/user-documents/$documentId/replace";
  static String verifyChangeEmail =
      "$baseUrl/api/user/profile/verify-change-email";
  static String verifyChangeMobile =
      "$baseUrl/api/user/profile/verify-change-mobile";
  static String postFcmToken = "$baseUrl/api/user/set-device-data";
  static String logout = "$baseUrl/api/user/logout";
  static String categories = "$baseUrl/api/user/categories";
  static String brands = "$baseUrl/api/user/brands";
  static String brandsByCategory(int categoryId) =>
      "$baseUrl/api/user/brands/by-category/$categoryId";
  static String governorates = "$baseUrl/api/user/governorates";
  static String citiesByGovernorate(int governorateId) =>
      "$baseUrl/api/user/cities/by-governorate/$governorateId";
  static String projects = "$baseUrl/api/user/projects";
  static String projectDocumentDefinitions =
      "$baseUrl/api/user/required-documents";
  static String myInvestedProjects = "$baseUrl/api/user/projects/my-invested";
  static String publishedProjects = "$baseUrl/api/user/projects/published";
  static String projectDetails(int projectId) =>
      "$baseUrl/api/user/projects/$projectId";
  static String resubmitProjectBasicData(int projectId) =>
      "$baseUrl/api/user/projects/$projectId/resubmit-basic-data";
  static String projectSharesPlans(int projectId) =>
      "$baseUrl/api/user/projects/$projectId/shares-plans";
  static String resubmitProjectSharesPlan(int projectId) =>
      "$baseUrl/api/user/projects/$projectId/shares-plans/resubmit";
  static String projectLogs(int projectId) =>
      "$baseUrl/api/user/projects/$projectId/logs";
  static String projectFinancialUpdates(int projectId) =>
      "$baseUrl/api/user/projects/$projectId/financial-updates";
  static String savedProjects = "$baseUrl/api/user/saved-projects";
  static String savedProject(int projectId) =>
      "$baseUrl/api/user/saved-projects/$projectId";
  static String toggleSavedProject(int projectId) =>
      "$baseUrl/api/user/saved-projects/$projectId/toggle";
  static String checkSavedProject(int projectId) =>
      "$baseUrl/api/user/saved-projects/$projectId/check";
  static String buyStockRequests = "$baseUrl/api/user/stock-requests/buy";
  static String transferStockRequests =
      "$baseUrl/api/user/stock-requests/transfer";
  static String notifications = "$baseUrl/api/user/notifications";
  static String markNotificationAsRead(int id) =>
      "$baseUrl/api/user/notifications/$id/read";
  static String unreadNotificationsCount =
      "$baseUrl/api/user/notifications/unread-count";
  static String wallet = "$baseUrl/api/user/wallets";
  static String walletTransactions = "$baseUrl/api/user/wallets/transactions";
  static String walletWithdrawals = "$baseUrl/api/user/wallets/withdrawals";
  static String walletWithdrawalDetails(int withdrawalId) =>
      "$baseUrl/api/user/wallets/withdrawals/$withdrawalId";
  static String cancelWalletWithdrawal(int withdrawalId) =>
      "$baseUrl/api/user/wallets/withdrawals/$withdrawalId/cancel";
  static String changeLanguage = "$baseUrl/api/v1/user/lang";
  static String termsConditions = "$baseUrl/api/user/terms-and-conditions";

  //! Addresses
  static String addresses = "$baseUrl/api/v1/user/addresses";
  static String updateAddress(int id) {
    return "$baseUrl/api/v1/user/addresses/$id";
  }

  //! Countries, States, Cities
  static String states(int? countryId) =>
      "$baseUrl/api/v1/countries/$countryId/states";
  static String cities(int? stateId) =>
      "$baseUrl/api/v1/states/$stateId/cities";
}
