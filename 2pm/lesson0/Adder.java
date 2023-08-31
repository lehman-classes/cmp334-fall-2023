class Adder {

  public static int add(int a, int b) {
    int total = 0;

    while (b != 0) {
      b = b - 1;
      a = a + 1;
      total = a;
    }

    return total;
  }

  public static void main(String[] args) {
    int a = 4;
    int b = 3;
    int total = add(a, b);
    System.out.println(total);
  }
}
