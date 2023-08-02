
import 'json_reader_service.dart';

class StoriesService {
  JSONReaderService jsonReaderService = JSONReaderService();

  //fetch stories data from data source
  Future<List> fetchAllStories() async {
    // fake waiting time
    await Future.delayed(const Duration(seconds: 1));
    return await jsonReaderService.readJsonFile('stories');
  }
}
