const baseUrl = "https://spade-backend-v3-production.up.railway.app/api/v1/";

class AppEndpoints {
  static const baseUrl =
      "https://spade-backend-v3-production.up.railway.app/api/v1/";
}

const Map<String, String> customHeader = {
  'content-type': 'application/json; charset=UTF-8',
};

const timeLimit = Duration(seconds: 40);
const noConnection = 'No Internet Connection';
const timeout =
    'Looks like the server is taking too long to respond, You can still try again later.';
const retry =
    "We are unable to load this request at the moment, kindly check your network connection and try again.";
const somethingWentWrong = 'Something went wrong';
const unknownError = 'Unknown Error';
