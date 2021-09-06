package svm.auxiliar.enums;

/**
 * @author Rafael Coelho
 * @version 22/09/2015
 */
public enum Svm_Type {

    C_SVC("0"),
    NU_SVC("1"),
    ONE_CLASS("2"),
    EPSILON_SVR("3"),
    NU_SVR("4");

    private String value;

    private Svm_Type(String value) {
        this.value = value;
    }

    public static String getValue(String t) {
        String cod = C_SVC.value;

        switch (t) {
            case "NU_SVC":
                cod = NU_SVC.value;
                break;
            case "ONE_CLASS":
                cod = ONE_CLASS.value;
                break;
            case "EPSILON_SVR":
                cod = EPSILON_SVR.value;
                break;
            case "NU_SVR":
                cod = NU_SVR.value;                
        }
        return cod;
    }
}
