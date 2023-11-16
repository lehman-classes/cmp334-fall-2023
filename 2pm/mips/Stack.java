class Stack {

  public static int procedure_a(int a, int b) {
    a = a + b;
    a = procedure_b(a);
    return a;
  }

  public static int procedure_b(int a) {
    a = a + a;
    return a;
  }

  public static void main(String[] args) {

    int a = 1;
    int b = 2;
    procedure_a(a, b);
  }
}
