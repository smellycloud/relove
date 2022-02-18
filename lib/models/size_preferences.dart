
// FIX THIS CRIME AGAINST HUMANITY!

class SizePreferences {
  final Map<String, Map<String, Map<String, bool>>> _sizeOptions = {
    'tops': {
      'XXS': {'isSelected': false},
      'XS': {'isSelected': false},
      'S': {'isSelected': false},
      'M': {'isSelected': false},
      'L': {'isSelected': false},
      'XL': {'isSelected': false},
      'XXL': {'isSelected': false},
      'XXXL': {'isSelected': false},
    },
    'bottoms': {
      '24': {'isSelected': false},
      '26': {'isSelected': false},
      '28': {'isSelected': false},
      '30': {'isSelected': false},
      '32': {'isSelected': false},
      '34': {'isSelected': false},
      '38': {'isSelected': false},
      '40': {'isSelected': false},
    },
    'jackets': {
      'XXS': {'isSelected': false},
      'XS': {'isSelected': false},
      'S': {'isSelected': false},
      'M': {'isSelected': false},
      'L': {'isSelected': false},
      'XL': {'isSelected': false},
      'XXL': {'isSelected': false},
      'XXXL': {'isSelected': false},
    },
    'shoes': {
      '3': {'isSelected': false},
      '4': {'isSelected': false},
      '5': {'isSelected': false},
      '6': {'isSelected': false},
      '7': {'isSelected': false},
      '8': {'isSelected': false},
      '9': {'isSelected': false},
      '10': {'isSelected': false},
      '11': {'isSelected': false},
    }
  };


  getClothingCategoriesList() {
    return _sizeOptions.keys.toList();
  }

  getSizeOptionsList({required String categoryName}) {
    // var sizeOptionsList = [];
    // for (var key in _sizeOptions.keys) {
    //   sizeOptionsList.add(key);
    // }
    return _sizeOptions[categoryName]?.keys.toList();
    // return sizeOptionsList;
  }

  getSizeSelectedState({required String categoryName, required String size}) {
    return _sizeOptions[categoryName]![size]!['isSelected'];
  }

  toggleSelectedState({required String categoryName, required String size}) {
    if(_sizeOptions[categoryName]![size]!['isSelected'] == true) {
      _sizeOptions[categoryName]![size]!['isSelected'] = false;
    } else {
      _sizeOptions[categoryName]![size]!['isSelected'] = true;
    }
  }

  Map<String, Map<String, Map<String, bool>>> get sizePreferenceData => _sizeOptions;

}
