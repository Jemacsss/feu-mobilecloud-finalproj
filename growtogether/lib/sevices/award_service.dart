import 'package:growtogether/models/award.dart';
import 'package:growtogether/data/award_categories.dart';
import 'package:growtogether/data/awards_data.dart';
import 'package:growtogether/data/awards_by_categories.dart';

class AwardsService {

  List<AwardCategory> getCategories() {
    return awardCategories;
  }


  List<Award> getAllAwards() {
    return allAwards;
  }


  List<Award> getAwardsByCategory(String categoryId) {
    return awardsByCategory[categoryId] ?? [];
  }


  Award? getAward(String awardId) {
    try {
      return allAwards.firstWhere((a) => a.id == awardId);
    } catch (_) {
      return null;
    }
  }
}
