package fate.enums;

public enum RizhuEnum {
    
    zi(1, "子"), 
    chou(2, "丑"),
    yin(3, "寅"), 
    mao(4, "卯"),
    chen(5, "辰"), 
    si(6, "巳"), 
    wu(7, "午"), 
    wei(8, "未"),
    shen(9, "申"), 
    you(10, "酉"), 
    xu(11, "戌"), 
    hai(12, "亥");


    public Integer code;
    public String value;

    RizhuEnum(Integer code, String value) {
        this.code = code;
        this.value = value;
    }

    /**
     * 根据code获取一个枚举
     *
     * @param code 枚举的code
     * @return 一个枚举
     */
    public static RizhuEnum search(Integer code) {
        for (RizhuEnum element : values()) {
            if (code.equals(element.code)) {
                return element;
            }
        }
        return null;
    }
    
    
    public static RizhuEnum getRizhuenum(Integer houre) {
        
        if (houre != null) {
            int code = 0;
       
            if (houre % 2 == 0) {
                code = (houre + 2) / 2;
            } else {
                code = (houre + 3) / 2;
            }
       
            if (code > 12) {
                code = 1;
            }
            
            return search(code);
        }
        
        return null;
    }
    
    
    public static void main(String[] args) {
        int code = 13;
        for(int i = 0 ; i<24; i++) {
            System.out.println(getRizhuenum(i).value + i);
        }
    }



}
