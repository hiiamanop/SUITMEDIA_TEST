class PalindromeChecker {
  static bool isPalindrome(String text) {
    String cleanText = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return cleanText == cleanText.split('').reversed.join('');
  }
}