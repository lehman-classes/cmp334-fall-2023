class Stack {
  public static int procedure_a(int n) {
    // procedure_a is the called procedure from main
    // procedure_a is the caller to procedure_b
    n = n + 7;
    n = procedure_b(n, 5);
    return n;
  }

  public static int procedure_b(int n, int m) {
    // procedure_b is the called procedure from procedure_a
    n = n + m;
    return n;
  }

  public static void main(String[] args) {
    // caller to procedure_a
    int n = 5;
    int a = procedure_a(n);
    System.out.println(a);
  }
}
