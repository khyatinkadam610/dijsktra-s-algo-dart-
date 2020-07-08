import 'package:test/test.dart';

void main() {
  List dijkstra(var vertices, int start) {
    int i;
    var n = 6;

    var unvisited = List.generate(n, (index) => index);
    // print(unvisited);

    var weight = List.generate(n, (index) => 999);
    weight[start] = 0;
    // print(weight);
// check whether the node is member of unvisited or not
    bool member(k) {
      bool flag;
      for (var i = 0; i < unvisited.length; i++) {
        if (k == unvisited[i]) {
          return true;
        } else {
          flag = false;
        }
      }
      return flag;
    }

// returning the node with min weught
    int min(var weight) {
      int a = 999, index = 0;
      for (int k = 0; k < n; k++) {
        // print(k);
        if (member(k)) {
          if (a > weight[k]) {
            index = k;
            a = weight[k];
          }
        }
      }
      // print(index);

      unvisited.remove(index);
      return index;
    }

    i = start;
    unvisited.remove(start);
    //relaxation to all connected vertices
    for (int x = 0; x < n - 1; x++) {
      for (int j = 0; j < n; j++) {
        // print(vertices[i][j]);
        if (vertices[i][j] != 0 && weight[j] > vertices[i][j] + weight[i]) {
          int n = vertices[i][j];
          // print("vertices :$n ");
          weight[j] = vertices[i][j] + weight[i];
          // print(weight);
        }
      }
      // returns next vertice to be observed
      i = min(weight);
      // print("$i is selected");
    }
    return weight;
  }

  test('testing algo implementation', () {
    var expected = [0, 2, 3, 8, 6, 9];
    var vertices = [
      [0, 2, 4, 0, 0, 0],
      [0, 0, 1, 7, 0, 0],
      [0, 0, 0, 0, 3, 0],
      [0, 0, 0, 0, 0, 1],
      [0, 0, 0, 2, 0, 5],
      [0, 0, 0, 0, 0, 0],
    ];
    var actual = dijkstra(vertices, 0);
    expect(actual, expected);
    var expected1 = [0, 45, 45, 10, 25, 999];
    var vertices1 = [
      [0, 50, 45, 10, 0, 0],
      [0, 0, 10, 15, 0, 0],
      [0, 0, 0, 0, 30, 0],
      [10, 0, 0, 0, 15, 0],
      [0, 20, 35, 0, 0, 0],
      [0, 0, 0, 0, 0, 30],
    ];
    var actual1 = dijkstra(vertices1, 0);
    expect(actual1, expected1);
  });
}
