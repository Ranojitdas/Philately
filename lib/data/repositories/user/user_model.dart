import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:philately/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;
  final String aadhar;
  final String mailing;
  List<String> preferences; // List of user preferences

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
    required this.aadhar,
    required this.mailing,
    required this.preferences, // Initialize preferences as List<String>
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Split the full name into a list of parts
  static List<String> nameParts(String fullName) => fullName.split(" ");

  /// Generate a unique username based on the user's full name
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    // Create a camel-case username and prefix it
    String camelCaseUsername = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUsername";
    return userNameWithPrefix;
  }

  /// Create an empty user model (useful for default values)
  static UserModel empty() => UserModel(
    id: '',
    userName: '',
    email: '',
    firstName: '',
    lastName: '',
    phoneNumber: '',
    profilePicture: '',
    aadhar: '',
    mailing: '',
    preferences: [], // Default empty list for preferences
  );

  /// Convert the UserModel instance to a Map for storing in Firestore
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Aadhaar': aadhar,
      'Mailing Address': mailing,
      'Preference': preferences, // Storing preferences as List<String>
    };
  }

  /// Convert Firestore document snapshot to UserModel instance
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        userName: data['UserName'] ?? '',
        email: data['Email'] ?? '',
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        aadhar: data['Aadhaar'] ?? '',
        mailing: data['Mailing Address'] ?? '',
        preferences: List<String>.from(data['Preference'] ?? []), // Deserialize preference as List<String>
      );
    } else {
      throw Exception('Document data is null');
    }
  }
}
