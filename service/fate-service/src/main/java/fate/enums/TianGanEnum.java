package fate.enums;

/**
 * Created by xieyang on 11-9.
 */
public enum TianGanEnum {

    JIA(4, "甲", "阳" ,"木"), YI(5, "乙", "阴" ,"木"), BING(6, "丙", "阳" ,"火"),
    DING(7, "丁", "阴" ,"火"), WU(8, "戊", "阳" ,"土"), JI(9, "己", "阴" ,"土"),
    GENG(0, "庚", "阳" ,"金"), XIN(1, "辛", "阴" ,"金"), REN(2, "壬", "阳" ,"水"),
    GUI(3, "癸", "阴" ,"水");


    public Integer code;
    public String value;
    public String yingyang;
    public String xing;
//    public String

    TianGanEnum(Integer code, String value, String yingyang, String xing) {
        this.code = code;
        this.value = value;
        this.yingyang = yingyang;
        this.xing = xing;
    }

    /**
     * 根据code获取一个枚举
     *
     * @param code 枚举的code
     * @return 一个枚举
     */
    public static TianGanEnum search(Integer code) {
        for (TianGanEnum element : values()) {
            if (code.equals(element.code)) {
                return element;
            }
        }
        return null;
    }

    public String toString() {

        return "" + this.yingyang + this.xing;
    }

}
