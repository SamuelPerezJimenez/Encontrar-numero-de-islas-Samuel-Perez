class CountIsland {
  getNumberOfIslands(List<List<int>> array, int r, int c) {
    int count = 0;
    for (var i = 0; i < r; i++) {
      for (var j = 0; j < c; j++) {
        if (array[i][j] == 1) {
          count++;
          searchIsland(array, r, c, i, j);
        }
      }
    }
    if (count == 0) {
      return 0;
    }
    return count;
  }

  searchIsland(List<List<int>> array, int r, int c, int i, int j) {
    if (isSafe(r, c, i, j) && array[i][j] == 1) {
      array[i][j] = 0;
      searchIsland(array, r, c, i - 1, j);
      searchIsland(array, r, c, i - 1, j - 1);
      searchIsland(array, r, c, i - 1, j + 1);
      searchIsland(array, r, c, i, j - 1);
      searchIsland(array, r, c, i, j + 1);
      searchIsland(array, r, c, i + 1, j - 1);
      searchIsland(array, r, c, i + 1, j);
      searchIsland(array, r, c, i + 1, j + 1);
    }
  }

  bool isSafe(int r, int c, int i, int j) {
    if (i < 0 || i >= r) return false;
    if (j < 0 || j >= c) return false;
    return true;
  }
}
