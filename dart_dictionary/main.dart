typedef DictInfoList = List<Map<String, String>>;

class Dictionary {
  final Map<String, String> _items = {};

  void add(String term, String definition) {
    if (_items.containsKey(term)) {
      print(
          'The term "$term" already exists with definition "${_items[term]}".If you want to update it, use "update" method');
    } else {
      _items[term] = definition;
    }
  }

  String? get(String term) {
    return _items[term];
  }

  void delete(String term) {
    _items.remove(term);
  }

  void update(String term, String definition) {
    if (_items.containsKey(term)) {
      _items[term] = definition;
    } else {
      print(
          'The term "$term" is missing in this dictionary. Use the add or upsert method if necessary');
    }
  }

  DictInfoList showAll() {
    DictInfoList result = [];
    _items.forEach((term, definition) {
      result.add({term: definition});
      print("$term:$definition");
    });
    return result;
  }

  int count() {
    return _items.length;
  }

  void upsert(String term, String definition) {
    _items[term] = definition;
  }

  bool exists(String term) {
    if (_items.containsKey(term)) return true;
    return false;
  }

  void bulkAdd(DictInfoList items) {
    for (var item in items) {
      if (item.containsKey("term") && item.containsKey("definition")) {
        add(item['term']!, item['definition']!);
      }
    }
  }

  void bulkDelete(List<String> keys) {
    for (var term in keys) {
      delete(term);
    }
  }
}

void main() {
  var dict = Dictionary();

  // Add Test
  dict.add("kimchi", "spicy korean food");
  assert(dict.get("kimchi") == "spicy korean food");
  dict.add("beer", "배불러");
  assert(dict.get("beer") == "배불러");

  // Add Test - word that are already in the dictionary
  dict.add("kimchi", "delicious");
  assert(dict.get("kimchi") == "spicy korean food"); // Should not update

  // Get Test
  assert(dict.get("banana") == null);
  assert(dict.get("kimchi") == "spicy korean food");

  // Delete Test
  dict.delete("beer");
  assert(dict.get("beer") == null);

  // Upsert Test
  dict.upsert("Balentine", "30년good");
  assert(dict.get("Balentine") == "30년good");
  dict.upsert("안주", "감튀");
  assert(dict.get("안주") == "감튀");
  dict.upsert("안주", "치킨");
  assert(dict.get("안주") == "치킨");

  // Exists Test
  assert(dict.exists("wawoo") == false);
  assert(dict.exists("kimchi") == true);

  // Count Test
  assert(dict.count() == 3);

  // BulkAdd Test
  dict.bulkAdd([
    {"term": "김치", "definition": "대박이네~"},
    {"term": "아파트", "definition": "비싸네~"}
  ]);
  assert(dict.get("김치") == "대박이네~");
  assert(dict.get("아파트") == "비싸네~");

  // BulkDelete Test
  dict.bulkDelete(["kimchi", "김치"]);
  assert(dict.get("kimchi") == null);
  assert(dict.get("김치") == null);

  // ShowAll Test
  var allItems = dict.showAll();
  assert(allItems.length == dict.count());

  print("All tests passed!");
}

// void main() {
//   var dict = Dictionary();
//   print("\n** Add Test");
//   // add
//   dict.add("kimchi", "spicy korean food");
//   dict.add("beer", "배불러");
//   dict.showAll();

//   print("\n** Add Test - word that are already in the dictionary**");
//   dict.add("kimchi", "delicious");

//   //get
//   print("\n** Get Test");
//   print(dict.get("banana"));
//   print(dict.get("kimchi"));

//   //delete
//   dict.delete("beer");

//   //upsert
//   print("\n** Upsert Test");
//   dict.upsert("Balentine", "30년good");
//   dict.upsert("안주", "감튀");
//   dict.upsert("안주", "치킨");

//   dict.showAll();

//   // exists
//   print("\n** Exists Test");
//   print(dict.exists("wawoo"));
//   print(dict.exists("kimchi"));

//   // count
//   print("number of data ${dict.count()}");

//   print("\n** BulkAdd Test");
//   dict.bulkAdd([
//     {"term": "김치", "definition": "대박이네~"},
//     {"term": "아파트", "definition": "비싸네~"}
//   ]);
//   dict.showAll();

//   print("\n** BulkDelete Test");
//   dict.bulkDelete(["kimchi", "김치"]);
//   dict.showAll();
// }

