//login exception
class UserNotFoundAuthException implements Exception{}
class WrongPasswordAuthExceptoin implements Exception{}

//regsister exception

class WeakpasswordAuthException implements Exception{}
class EmailAlreadyInUseAuthException implements Exception{}
class InvalidEmailAuthException implements Exception {}

//generic exception

class GenericAuthException implements Exception {}
class UserNotLoggedInAuthException implements Exception {}