package svm.auxiliar.enums;

/**
 * @author Rafael Coelho
 * @version 22/09/2015
 */
public enum Kernel_Type {
	LINEAR("0"),
	POLY("1"),
	RBF("2"),
        SIGMOID("3"),
	PRECOMPUTED("4");

    private String value;

    private Kernel_Type(String value) {
        this.value = value;
    }

    public static String getValue(String t) {
        String cod = LINEAR.value;

        switch (t) {
            case "POLY":
                cod = POLY.value;
                break;
            case "RBF":
                cod = RBF.value;
                break;
            case "SIGMOID":
                cod = SIGMOID.value;
                break;
            case "PRECOMPUTED":
                cod = PRECOMPUTED.value;                
        }
        return cod;
    }
}