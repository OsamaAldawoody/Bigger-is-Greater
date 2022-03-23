import 'dart:ffi';

void main(List<String> arguments) {
  print(biggerIsGreater('bb'));
}

String biggerIsGreater(String arr) {
  List<String?> result = List.generate(arr.length, (index) => null);
  for (var i = arr.length - 1; i >= 0; i--) {
    for (var j = i; j >= 0; j--) {
      if (arr[i].codeUnits.first > arr[j].codeUnits.first && i != j) {
        result[i] = arr[j];
        result[j] = arr[i];
        if (j == 0) {
          final restElement = arr.runes.map((e) {
            if (String.fromCharCode(e) != arr[i] &&
                String.fromCharCode(e) != arr[j]) {
              print(String.fromCharCode(e));
              return String.fromCharCode(e);
            }
          }).toList();
          restElement
            ..removeWhere((element) => element == null)
            ..sort();
          print(restElement);
          result.map((e) {
            if (e == null) {
              result[result.indexOf(e)] = restElement.removeAt(0);
            }
          }).toList();
        } else {
          result.map((e) {
            if (e == null) {
              result[result.indexOf(e)] = arr[result.indexOf(e)];
            }
          }).toList();
        }

        return result.contains(null) ? 'no answer' : result.toString();
      }
    }
  }

  return result.contains(null) ? 'no answer' : result.toString();
}
