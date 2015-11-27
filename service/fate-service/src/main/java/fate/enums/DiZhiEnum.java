package fate.enums;

/**
 * Created by xieyang on 11-9.
 */
public enum DiZhiEnum {

    zi(4, "子", "鼠"), chou(5, "丑", "牛"), yin(6, "寅", "虎"), mao(7, "卯", "兔"),
    chen(8, "辰", "龙"), si(9, "巳", "蛇"), wu(10, "午", "马"), wei(11, "未", "羊"),
    shen(0, "申", "猴"), you(1, "酉", "鸡"), xu(2, "戌", "狗"), hai(3, "亥", "猪");


    public Integer code;
    public String value;
    public String xiao;

    DiZhiEnum(Integer code, String value, String xiao) {
        this.code = code;
        this.value = value;
        this.xiao = xiao;
    }

    /**
     * 根据code获取一个枚举
     *
     * @param code 枚举的code
     * @return 一个枚举
     */
    public static DiZhiEnum search(Integer code) {
        for (DiZhiEnum element : values()) {
            if (code.equals(element.code)) {
                return element;
            }
        }
        return null;
    }


}
