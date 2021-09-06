package svm.auxiliar.enums;

/**
 *
 * @author Rafael Coelho
 * @version 23/08/2015
 */
public enum Ortogonal_Codification {

    A('A', "0 1 0 0 "),
    C('C', "0 0 0 1 "),
    T('T', "1 0 0 0 "),
    G('G', "0 0 1 0 ");

    private Ortogonal_Codification(char letter, String binary) {
        this.letter = letter;
        this.binary = binary;
    }

    private String binary;
    private char letter;

    public String getBinary() {
        return binary;
    }

    public char getLetter() {
        return letter;
    }

    public static String getCode(char letter) {
        String cod = A.binary;

        switch (letter) {
            case 'C':
                cod = C.binary;
                break;
            case 'T':
                cod = T.binary;
                break;
            case 'G':
                cod = G.binary;
        }
        return cod;
    }
}
