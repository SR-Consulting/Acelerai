public with sharing class StringUtils {
    
    public static String noSpecialChar(String str) {
        if(String.isBlank(str))
            return '';

        return str.replaceAll('[^ a-zA-Z0-9 \\ s +]', '');
    }

    public static String onlyNumbers(String str) {
        if(String.isBlank(str))
            return '';
        return str.replaceAll('[^0-9]','');
    }
}