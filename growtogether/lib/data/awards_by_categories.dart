//needs api
import 'package:growtogether/models/award.dart';
import 'package:growtogether/data/award_categories.dart';
import 'package:growtogether/data/awards_data.dart';

final Map<String, List<Award>> awardsByCategory = {
  for (var cat in awardCategories)
    cat.id: allAwards.where((a) => a.category == cat.id).toList(),
};
