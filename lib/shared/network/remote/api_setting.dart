class ApiSetting {
  static const _baseUrl = "https://smart-store.mr-dev.tech/";
  static const _apiUrl = _baseUrl + "api/";

  static const register = _apiUrl + 'auth/register';
  static const login = _apiUrl + 'auth/login';
  static const logout = _apiUrl + 'auth/logout';
  static const activate = _apiUrl +'auth/activate';

  static const forgetPassword = _apiUrl + 'auth/forget-password';

  static const resetPassword = _apiUrl+ 'auth/reset-password';
  static const updateProfile = _apiUrl+'auth/update-profile';
  static const changePassword = _apiUrl + 'auth/change-password';
  static const categories = _apiUrl + 'categories';


  static const subCategory = _apiUrl +'categories/{id}';
  static const products = _apiUrl +'sub-categories/{id}';
  static const productDetails = _apiUrl +'products/{id}';


  static const cities = _apiUrl+ 'cities';
  static const String home = _apiUrl + 'home';

  static const faq = _apiUrl +'faqs';
  static const contactRequest = _apiUrl+'contact-requests';


  static const favoriteProducts = _apiUrl +'favorite-products';
  // static const addFavoriteProducts = _apiUrl +'products/rate';
  static const addFavoriteProducts = _apiUrl +'favorite-products';

  static const createAddress = _apiUrl +'addresses';

  static const deleteAddress = _apiUrl +'addresses/{id}';

  static const createOrder = _apiUrl +'orders';

  static const orderDetails = _apiUrl +'orders/{id}';
static const create_get_Card = _apiUrl +'payment-cards';

  static const delete_update_Card = _apiUrl +'payment-cards/{id}';


  static const storeApiKey = '1915d427-70db-443b-ab9c-84a467c96887';


}