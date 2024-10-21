package com.kdshop.mapper;

import com.kdshop.pojo.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AddressMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated
     */
    Address selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated
     */
    List<Address> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table address
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Address record);


    /**
     * 通过uid查询收获地址
     * @param uid
     * @return
     */
    List<Address> getAllAddressByUid(@Param("uid") Integer uid);

    /**
     * 添加address
     * @param address
     */
    void insert(Address address);


    /**
     * 修改uid的所有的收件地址的is_default的值为0
     * @param uid
     */
    void setCancel(Integer uid);
    /**
     * 修改is_default值为1
     * @param id
     */
    void setDefault(Integer id);
    /**
     * 通过Id查询Address信息
     * @param id
     * @return
     */
    Address getAddressById(@Param("id") Integer id);
    /**
     * 修改address
     * @param address
     */
    void update(Address address);

    /**
     * 根据id删除一个地址信息
     * @param id
     * @return
     */
    Integer delete(Integer id);
}