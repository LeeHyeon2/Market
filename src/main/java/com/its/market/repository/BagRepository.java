package com.its.market.repository;

import com.its.market.dto.BagDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BagRepository {
    @Autowired
    public SqlSessionTemplate sql;

    public BagDTO findById(BagDTO bagDTO) {
        return sql.selectOne("Bag.findById",bagDTO);
    }

    public void update(BagDTO bagDTO) {
        sql.insert("Bag.update",bagDTO);
    }

    public void delete(BagDTO bagDTO) {
        sql.delete("Bag.delete",bagDTO);
    }
}
