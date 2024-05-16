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
  int? maxAmount;
  String? modeOfDisplay;

  Fields(
      {this.name,
        this.label,
        this.textColor,
        this.textSize,
        this.labelText,
        this.values,
        this.hintText,
        this.maxAmount,
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
    maxAmount = json['max_amount'];
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
    data['max_amount'] = maxAmount;
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
