package com.yswsoft.lms.core.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

/**
 * BaseService,泛型封装一下
 * @author chenxuebin
 * @date 2013-09-03 下午15:04:40
 */
public interface BaseService<T> {

/**
 * load
 * @author chenxuebin
 * @param id
 * @return
 */
T load(Serializable id);

/**
 * load
 * @author chenxuebin
 * @param id
 * @return
 */
T loadAfterLoad(Serializable id);

/**
 * load按条件查询单个记录
 * @author chenxuebin
 * @return
 */
T load(String listName,Object[] object);

/**
 * 取count数
 * @param listName
 * @param object
 * @return
 */
Integer count(String listName,Object[] object);


T loadAddition(String listName,Object[] object);
/**
 * 批量load
 * @author chenxuebin
 * @param ids
 * @return
 */
List<T> loads(List<Serializable> ids);

/**
 * 批量load,加载相关附加对象
 * @author chenxuebin
 * @param ids
 * @return
 */
List<T> loadsAddition(List<Serializable> ids);

/**
 * 插入
 * @author chenxuebin
 * @param entity
 * @return
 */
Serializable insert(T entity);

/**
 * 批量插入
 * @author chenxuebin
 * @param entity
 * @return
 */
public List<T> batchInsert(List<T> entity);

/**
 * 更新
 * @author chenxuebin
 * @param entity
 * @return
 */
boolean update(T entity);

/**
 * author chenxuebin
 * 批量更新
 * @param list
 * @return
 */
public boolean batchUpdate(List<T> list);

/**
 * 删除
 * @author chenxuebin
 * @param id
 * @return
 */
boolean delete(Serializable id);

boolean batchDelete2(List<Serializable> ids);
	
}

