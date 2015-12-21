package com.cullen.nutz.module;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.cullen.nutz.bean.Goods;


@IocBean
@At("/goods")
@Ok("json")
@Fail("http:500")
public class GoodsModule {
    
    @Inject
    protected Dao dao;
    


    @At
    public int count() {
        return dao.count(Goods.class);
    }
    
    @At
    public Object query(@Param("name")String name, @Param("..")Pager pager) {
        Cnd cnd = Strings.isBlank(name)? null : Cnd.where("name", "like", "%"+name+"%");
        QueryResult qr = new QueryResult();
        qr.setList(dao.query(Goods.class, cnd, pager));
        pager.setRecordCount(dao.count(Goods.class, cnd));
        qr.setPager(pager);
        return qr; //默认分页是第1页,每页20条
    }
    
   


}
