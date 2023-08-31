class Adder {

  public static int add(int a, int b) {
    // algorithm
    int result = 0;
    while (b != 0) {
      a = a + 1;
      b = b - 1;
      result = a;
    }

    return result;
  }

  public static void main(String[] args) {
    int a = 400000000;
    int b = 300000000;
    int result = add(a, b);
    System.out.println(result);
  }
}
