class CalculatorInputModel {
  List<Fields>? fields;

  CalculatorInputModel({this.fields});

  CalculatorInputModel.fromJson(Map<String, dynamic> json) {
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(Fields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fields != null) {
      data['fields'] = fields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fields {
  String? name;
  String? label;
  String? textColor;
  double? textSize;
  String? labelText;
  List<Values>? values;
  String? hintText;
  MinAmount? minAmount;
  int? maxAmount;
  String? errorMessage;
  String? modeOfDisplay;

  Fields(
      {this.name,
        this.label,
        this.textColor,
        this.textSize,
        this.labelText,
        this.values,
        this.hintText,
        this.minAmount,
        this.maxAmount,
        this.errorMessage,
        this.modeOfDisplay});

  Fields.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    label = json['label'];
    textColor = json['text_color'];
    textSize = json['text_size'];
    labelText = json['label_text'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
    hintText = json['hint_text'];
    minAmount = json['min_amount'] != null
        ? MinAmount.fromJson(json['min_amount'])
        : null;
    maxAmount = json['max_amount'];
    errorMessage = json['error_message'];
    modeOfDisplay = json['mode_of_display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['label'] = label;
    data['text_color'] = textColor;
    data['text_size'] = textSize;
    data['label_text'] = labelText;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    data['hint_text'] = hintText;
    if (minAmount != null) {
      data['min_amount'] = minAmount!.toJson();
    }
    data['max_amount'] = maxAmount;
    data['error_message'] = errorMessage;
    data['mode_of_display'] = modeOfDisplay;
    return data;
  }
}

class Values {
  String? value;
  String? label;

  Values({this.value, this.label});

  Values.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}

class MinAmount {
  int? i1;
  int? i2;
  int? i3;
  int? i4;
  int? i5;
  int? i6;
  int? i7;
  int? i8;
  int? i9;
  int? i10;
  int? i11;
  int? i12;
  int? i13;

  MinAmount(
      {this.i1,
        this.i2,
        this.i3,
        this.i4,
        this.i5,
        this.i6,
        this.i7,
        this.i8,
        this.i9,
        this.i10,
        this.i11,
        this.i12,
        this.i13});

  MinAmount.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    i4 = json['4'];
    i5 = json['5'];
    i6 = json['6'];
    i7 = json['7'];
    i8 = json['8'];
    i9 = json['9'];
    i10 = json['10'];
    i11 = json['11'];
    i12 = json['12'];
    i13 = json['13'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = i1;
    data['2'] = i2;
    data['3'] = i3;
    data['4'] = i4;
    data['5'] = i5;
    data['6'] = i6;
    data['7'] = i7;
    data['8'] = i8;
    data['9'] = i9;
    data['10'] = i10;
    data['11'] = i11;
    data['12'] = i12;
    data['13'] = i13;
    return data;
  }
}
