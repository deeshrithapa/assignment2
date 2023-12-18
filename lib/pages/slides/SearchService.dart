import '../../components/data_detailpage.dart';

class SearchService {
  static List<Map<String, dynamic>> searchInMamaEarthDetails(String query) {
    // Implement your search logic here
    // Return a list of items matching the query from MamaEarthDetails
    return data_detailpage
        .where((item) =>
        item['name'].toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
