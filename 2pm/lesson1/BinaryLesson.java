class BinaryLesson {

  public static void main(String[] args) {

    // binary to decimal
    String num1 = "0010"; // decimal 2
    String num2 = "0100"; // decimal 4
    // sum = 6
    int sum = Integer.parseInt(num1, 2) + Integer.parseInt(num2, 2);
    System.out.println("sum = " + sum);

    byte b = 0b1111111;
    byte b2 = 0b1111111;
    System.out.println("b = " + b);
    System.out.println("b2 = " + b2);
    System.out.println("sum (b + b2) = " + (byte) (b + b2));

    // ASCII character representation
    String value = "1000010";
    int decimal = Integer.parseInt(value, 2);
    System.out.println("Letter " + (char) decimal); // Letter B

    // Two's complement

    String num3 = "00000000000000000000000000001010"; // decimal 10
    System.out.println("num3 = " + Integer.parseInt(num3, 2));

    // negative number
    String num4 = "1111111111111111111111111111111"; // decimal 10

    int a = Integer.MAX_VALUE + 50000;
    System.out.println(a);
    System.out.println("num4 = " + Integer.parseInt(num4, 2) + 1);
  }
}
