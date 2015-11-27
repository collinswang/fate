package fate.enums;

public enum YuezhuEnum {
    
    yin(1, "寅"), 
    mao(2, "卯"),
    chen(3, "辰"), 
    si(4, "巳"), 
    wu(5, "午"), 
    wei(6, "未"),
    shen(7, "申"), 
    you(8, "酉"), 
    xu(9, "戌"), 
    hai(10, "亥"), 
    zi(11, "子"), 
    chou(12, "丑"),;


    public Integer code;
    public String value;

    YuezhuEnum(Integer code, String value) {
        this.code = code;
        this.value = value;
    }

    /**
     * 根据code获取一个枚举
     *
     * @param code 枚举的code
     * @return 一个枚举
     */
    public static YuezhuEnum search(Integer code) {
        for (YuezhuEnum element : values()) {
            if (code.equals(element.code)) {
                return element;
            }
        }
        return null;
    }



}
