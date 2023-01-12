class ProductModel {
  late int id;
  late String name;
  late String tagline;
  late String firstBrewed;
  late String description;
  late String imageUrl;
  late int abv;
  late int ibu;
  late int targetFg;
  late int targetOg;
  late int ebc;
  late double srm;
  late double ph;
  late double attenuationLevel;
  late Volume volume;
  late Volume boilVolume;
  late Method method;
  late Ingredients ingredients;
  late List<String> foodPairing;
  late String brewersTips;
  late String contributedBy;

  ProductModel(
      {required this.id,
      required this.name,
      required this.tagline,
      required this.firstBrewed,
      required this.description,
      required this.imageUrl,
      required this.abv,
      required this.ibu,
      required this.targetFg,
      required this.targetOg,
      required this.ebc,
      required this.srm,
      required this.ph,
      required this.attenuationLevel,
      required this.volume,
      required this.boilVolume,
      required this.method,
      required this.ingredients,
      required this.foodPairing,
      required this.brewersTips,
      required this.contributedBy});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagline = json['tagline'];
    firstBrewed = json['first_brewed'];
    description = json['description'];
    imageUrl = json['image_url'];
    abv = json['abv'];
    ibu = json['ibu'];
    targetFg = json['target_fg'];
    targetOg = json['target_og'];
    ebc = json['ebc'];
    srm = json['srm'];
    ph = json['ph'];
    attenuationLevel = json['attenuation_level'];
    volume = (json['volume'] != null ? Volume.fromJson(json['volume']) : null)!;
    boilVolume = (json['boil_volume'] != null
        ? Volume.fromJson(json['boil_volume'])
        : null)!;
    method = (json['method'] != null ? Method.fromJson(json['method']) : null)!;
    ingredients = (json['ingredients'] != null
        ? Ingredients.fromJson(json['ingredients'])
        : null)!;
    foodPairing = json['food_pairing'].cast<String>();
    brewersTips = json['brewers_tips'];
    contributedBy = json['contributed_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tagline'] = tagline;
    data['first_brewed'] = firstBrewed;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['abv'] = abv;
    data['ibu'] = ibu;
    data['target_fg'] = targetFg;
    data['target_og'] = targetOg;
    data['ebc'] = ebc;
    data['srm'] = srm;
    data['ph'] = ph;
    data['attenuation_level'] = attenuationLevel;
    if (volume != null) {
      data['volume'] = volume.toJson();
    }
    if (boilVolume != null) {
      data['boil_volume'] = boilVolume.toJson();
    }
    if (method != null) {
      data['method'] = method.toJson();
    }
    if (ingredients != null) {
      data['ingredients'] = ingredients.toJson();
    }
    data['food_pairing'] = foodPairing;
    data['brewers_tips'] = brewersTips;
    data['contributed_by'] = contributedBy;
    return data;
  }
}

class Volume {
  late int value;
  late String unit;

  Volume({required this.value, required this.unit});

  Volume.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    return data;
  }
}

class Method {
  late List<MashTemp> mashTemp;
  late Fermentation fermentation;
  late Null twist;

  Method({required this.mashTemp, required this.fermentation, this.twist});

  Method.fromJson(Map<String, dynamic> json) {
    if (json['mash_temp'] != null) {
      mashTemp = <MashTemp>[];
      json['mash_temp'].forEach((v) {
        mashTemp.add(MashTemp.fromJson(v));
      });
    }
    fermentation = (json['fermentation'] != null
        ? Fermentation.fromJson(json['fermentation'])
        : null)!;
    twist = json['twist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mashTemp != null) {
      data['mash_temp'] = mashTemp.map((v) => v.toJson()).toList();
    }
    if (fermentation != null) {
      data['fermentation'] = fermentation.toJson();
    }
    data['twist'] = twist;
    return data;
  }
}

class MashTemp {
  late Volume temp;
  late int duration;

  MashTemp({required this.temp, required this.duration});

  MashTemp.fromJson(Map<String, dynamic> json) {
    temp = (json['temp'] != null ? Volume.fromJson(json['temp']) : null)!;
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (temp != null) {
      data['temp'] = temp.toJson();
    }
    data['duration'] = duration;
    return data;
  }
}

class Fermentation {
  late Volume temp;

  Fermentation({required this.temp});

  Fermentation.fromJson(Map<String, dynamic> json) {
    temp = (json['temp'] != null ? Volume.fromJson(json['temp']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (temp != null) {
      data['temp'] = temp.toJson();
    }
    return data;
  }
}

class Ingredients {
  late List<Malt> malt;
  late List<Hops> hops;
  late String yeast;

  Ingredients({required this.malt, required this.hops, required this.yeast});

  Ingredients.fromJson(Map<String, dynamic> json) {
    if (json['malt'] != null) {
      malt = <Malt>[];
      json['malt'].forEach((v) {
        malt.add(Malt.fromJson(v));
      });
    }
    if (json['hops'] != null) {
      hops = <Hops>[];
      json['hops'].forEach((v) {
        hops.add(Hops.fromJson(v));
      });
    }
    yeast = json['yeast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.malt != null) {
      data['malt'] = this.malt.map((v) => v.toJson()).toList();
    }
    if (this.hops != null) {
      data['hops'] = this.hops.map((v) => v.toJson()).toList();
    }
    data['yeast'] = this.yeast;
    return data;
  }
}

class Malt {
  late String name;
  late Amount amount;

  Malt({required this.name, required this.amount});

  Malt.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = (json['amount'] != null ? Amount.fromJson(json['amount']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (amount != null) {
      data['amount'] = amount.toJson();
    }
    return data;
  }
}

class Amount {
  late double value;
  late String unit;

  Amount({required this.value, required this.unit});

  Amount.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    return data;
  }
}

class Hops {
  late String name;
  late Amount amount;
  late String add;
  late String attribute;

  Hops(
      {required this.name,
      required this.amount,
      required this.add,
      required this.attribute});

  Hops.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = (json['amount'] != null ? Amount.fromJson(json['amount']) : null)!;
    add = json['add'];
    attribute = json['attribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (amount != null) {
      data['amount'] = amount.toJson();
    }
    data['add'] = add;
    data['attribute'] = attribute;
    return data;
  }
}
