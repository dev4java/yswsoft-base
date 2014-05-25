package com.yswsoft.lms.core.service.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cc.luole.sns.dal.config.DaoConfig;
import cc.luole.sns.dal.config.helper.DaoHelper;
import cc.luole.sns.dal.config.model.dao.ListItem;
import cc.luole.sns.dal.dao.Dao;
import cc.luole.sns.dal.dao.exception.DaoException;
import cc.luole.sns.dal.route.RoutingService;
import cc.luole.sns.dal.route.strategy.IStrategy;
import cc.luole.sns.tools.commons.Page;

import com.yswsoft.lms.core.service.BaseService;
/**
 * BaseServiceImpl，提供一些通用方法。实现通用BaseService接口，子类标明泛型并继承该类可简化部分代码。
 * @author chenxuebin
 * @date 2013-09-03 下午05:41:06
 */
public class BaseServiceImpl<T> implements BaseService<T> {
	private static final Logger log = LoggerFactory.getLogger(BaseServiceImpl.class);
	private Class<T> entityClass;
	
	protected HibernateTemplate hibernateTemplate;
	
	@Autowired
	protected Dao dao;
	
	private Random random = new Random();


    public Dao getDao() {
        return dao;
    }

    public void setDao(Dao dao) {
        this.dao = dao;
    }
	
	public BaseServiceImpl() {
		try {
			entityClass =(Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
			hibernateTemplate = new HibernateTemplate(DaoHelper.getSessionFactory());
		} catch (Exception e) {
			log.warn(e.getLocalizedMessage());
		}
		
	}

//	/**
//	 * 批量查找用户,返回map
//	 * @param ids
//	 * @return
//	 */
//	protected Map<Serializable, Usr> mutiLoadUsr(List<Long> ids) {
//		Map<Serializable, Usr> map = new HashMap<Serializable, Usr>();
//		List<Usr> list = this.userService.loadMulti(ids);
//		for (Usr usr : list) {
//			map.put(usr.getId(), usr);
//		}
//		return map;
//	}
	
	protected void afterLoad(T entity) {	}
	
	@Override
	public T load(Serializable id) {
		try {
			T t = (T)this.dao.get(entityClass, id);
			return t;
		} catch (Exception e) {
			log.error("load error", e);
		}
		return null;
	}
	
	@Override
	public T loadAfterLoad(Serializable id) {
		try {
			T t = (T)this.dao.get(entityClass, id);
			this.afterLoad(t);
			return t;
		} catch (Exception e) {
			log.error("load error", e);
		}
		return null;
	}
	
	@Override
	public T load(String listName,Object[] object){
		T t=null;
		try {
			Serializable id = (Serializable) dao.getMapping(listName, object);
			if(id==null){
                return t;
            }
			t = this.load(id);
		} catch (DaoException e) {
			log.error("load by Object[] error", e);
		}
		return t;
	}
	
	@Override
	public Integer count(String listName,Object[] object){
		try {
			Integer id = (Integer) dao.count(listName, object);
			return null == id?0:id;
		} catch (DaoException e) {
			log.error("load by Object[] error", e);
		}
		return 0;
	}
	
	@Override
	public T loadAddition(String listName,Object[] object){
		T t=null;
		try {
			Long id = (Long) dao.getMapping(listName, object);
			if(id==null||id==0){
                return t;
            }
			t = this.loadAfterLoad(id);
		} catch (DaoException e) {
			log.error("load by Object[] error", e);
		}
		return t;
	}

	
	protected void afterLoads(List<T> list) {	}
	@Override
	public List<T> loads(List<Serializable> ids) {
		List<T> list = new ArrayList<T>();
		try {
			if(CollectionUtils.isNotEmpty(ids)){
				list = this.dao.getList(entityClass, ids);
			}
		} catch (Exception e) {
			log.error("loads error", e);
		}
		return list;
	}
	
	public List<T> loadsAddition(List<Serializable> ids) {
		List<T> list = new ArrayList<T>();
		try {
			if(CollectionUtils.isNotEmpty(ids)){
				list = this.dao.getList(entityClass, ids);
				this.afterLoads(list);
			}
		} catch (Exception e) {
			log.error("loads error", e);
		}
		return list;
	}

	@Override
	public List<T> batchInsert(List<T> entityList) {
		List<T> list= new ArrayList<T>();
		try {
			list = this.dao.batchSave(entityList);
		} catch (Exception e) {
			log.error("insert error", e);
		}
		return list;
	}
	
	@Override
	public Serializable insert(T entity) {
		try {
			Serializable id = this.dao.save(entity);
			return id;
		} catch (Exception e) {
			log.error("insert error", e);
		}
		return -1;
	}

	
	@Override
	public boolean update(T entity) {
		try {
			return dao.update(entity);
		} catch (Exception e) {
			log.error("update error", e);
		}
		return false;
	}

    /**
     * author lizhi
     * 批量更新
     * @param list
     * @return
     */
    public boolean batchUpdate(List<T> list){
        try{
            return dao.batchUpdate(list);
        }catch (Exception e){
            log.error("batch update error",e);
        }
        return false;
    }

	@Override
	public boolean delete(Serializable id) {
		try {
			return this.dao.delete(entityClass, id);
		} catch (Exception e) {
			log.error("delete error", e);
		}
		return false;
	}

	
	public boolean batchDelete2(List<Serializable> ids){
		 try{
	            return dao.deleteList(entityClass,ids);
	        }catch (Exception e){
	            log.error("batch delete error",e);
	        }
	        return false;
	}
	
    /**
     * @param list
     * @return
     */
	@Deprecated
    public boolean batchDelete(List<T> list){
        try{
            return dao.deleteList(entityClass,list);
        }catch (Exception e){
            log.error("batch delete error",e);
        }
        return false;
    }
	
	/**
	 * 分页查询
	 * @param listName
	 * @param params
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	protected Page pageQuery(String listName, Object[] params, int pageNo, int pageSize){
		Page page = null;
		try {
			long count = this.dao.count(listName, params);
			if(count == 0){
				page = new Page();
			}else{
				int start = (pageNo - 1) * pageSize;
				List<Serializable> ids = this.dao.getIdList(listName, params, start, pageSize);
				List<T> data = this.loads(ids);
				page = new Page(start, count, pageSize, data);
			}
		} catch (DaoException e) {
			log.error(e.getMessage(), e);
		}
		return page;
	}
	
	/**
	 * 查询ID，带分页
	 * @param listName
	 * @param params
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	protected List<Serializable> queryIds(String listName, Object[] params, int pageNo, int pageSize) {
		List<Serializable> ids = new ArrayList<Serializable>();
		try {
			int start = (pageNo - 1) * pageSize;
			ids = this.dao.getIdList(listName, params, start, pageSize);
			return ids;
		} catch (Exception e) {
			log.error("queryIds error", e);
		}
		return ids;
	}
	
	/**
	 * 查询ID列表
	 * @param listName
	 * @param params
	 * @return
	 */
	protected List<Serializable> queryIds(String listName, Object[] params) {
		List<Serializable> ids = new ArrayList<Serializable>();
		try {
			ids = this.dao.getIdList(listName, params);
			return ids;
		} catch (Exception e) {
			log.error("queryIds error", e);
		}
		return ids;
	}
	
	
	/**
	 * 封装一下查询
	 * @param listName
	 * @param params
	 * @return
	 */
	protected List<T> query(String listName, Object[] params) {
		List<T> data = new ArrayList<T>();
		try {
			List<Serializable> ids = this.dao.getIdList(listName, params);
			if(CollectionUtils.isNotEmpty(ids)){
				data = this.loads(ids);
			}
		} catch (Exception e) {
			log.error("query error", e);
		}
		return data;
	}
	
	/**
	 * 封装一下查询
	 * @param listName
	 * @param params
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	protected List<T> query(String listName, Object[] params, int pageNo, int pageSize) {
		List<T> data = new ArrayList<T>();
		try {
			int start = (pageNo - 1) * pageSize;
			List<Serializable> ids = this.dao.getIdList(listName, params, start, pageSize);
			if(CollectionUtils.isNotEmpty(ids)){
				data = this.loads(ids);
			}
		} catch (Exception e) {
			log.error("query error", e);
		}
		return data;
	}
	
	/**
	 * 封装一下查询，附带加载其他相关对象
	 * @param listName
	 * @param params
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	protected List<T> queryAddition(String listName, Object[] params, int pageNo, int pageSize) {
		List<T> data = new ArrayList<T>();
		try {
			int start = (pageNo - 1) * pageSize;
			List<Serializable> ids = this.dao.getIdList(listName, params, start, pageSize);
			if(CollectionUtils.isNotEmpty(ids)){
				data = this.loadsAddition(ids);
			}
		} catch (Exception e) {
			log.error("query error", e);
		}
		return data;
	}
	
	
	
	/**
	 * 执行自定义sql【sql可以自己传入，用于动态拼装。只是利用listName来取得路由策略，配置文件中的sql可以随意写一句，如 select version();】
	 * @param listName
	 * @param sql
	 * @param params
	 * @return
	 */
	protected List excuteListSql(String listName, final String sql, final Object[] params) {
		List list = new ArrayList();
		try {
			//设置分表路由策略
			RoutingService.getInstance().setRoutingStrategyForList(listName, null, IStrategy.STRATEGY_R);
		
			list = (List) hibernateTemplate.execute(new HibernateCallback() {
				public Object doInHibernate(Session session)throws HibernateException, SQLException {
					Query query = session.createSQLQuery(sql);
					if(params != null && params.length > 0){
						for(int i = 0; i < params.length; i++){
							query.setParameter(i, params[i]);
						}
					}
						return query.list();
					}
			    });
		} catch (Exception e) {
			log.error("excuteSql error", e);
		}
		return list;
	}
	
	/**
	 * 执行自定义sql【sql可以自己传入，用于动态拼装。只是利用listName来取得路由策略，配置文件中的sql可以随意写一句，如 select version();】
	 * @param listName
	 * @param sql		这里需要select id form *****
	 * @param params
	 * @return
	 */
	protected List<T> excuteListSqlById(String listName, String sql, Object[] params, int pageNo, int pageSize) {
		List<T> list = null;
		Transaction tx = null;
		try {
			List<Serializable> idList = new ArrayList<Serializable>();
			//设置分表路由策略
			RoutingService.getInstance().setRoutingStrategyForList(listName, null, IStrategy.STRATEGY_R);
			if(StringUtils.isEmpty(sql)){
				ListItem item = DaoConfig.getInstance().getListItem(listName);
				sql = item.getSqlitem();
			}
			
			Session session = DaoHelper.getSessionFactory().getCurrentSession();
			tx = session.beginTransaction();
			System.out.println("--------------"+sql);
			Query query = session.createSQLQuery(sql);
			if(params != null && params.length > 0){
				for(int i = 0; i < params.length; i++){
					query.setParameter(i, params[i]);
				}
			}
			int first = (pageNo - 1) * pageSize;  
			query.setFirstResult(first);
			query.setMaxResults(pageSize);
			idList = query.list();
			tx.commit();
			list = this.loads(idList);
		} catch (Exception e) {
			if(tx != null){
				tx.rollback();
			}
			list = new ArrayList<T>();
			log.error("excuteSql error", e);
		}
		return list;
	}
	
	
	/**
	 * 执行自定义sql【sql可以自己传入，用于动态拼装。只是利用listName来取得路由策略，配置文件中的sql可以随意写一句，如 select version();】
	 * @param listName
	 * @param sql		这里需要select id form *****,并且不支持复杂的sql查询
	 * @param params
	 * @return
	 */
	protected Page pageExcuteListSqlById(String listName, String sql, Object[] params, int pageNo, int pageSize) {
		Transaction tx = null;
		try {
			List<Serializable> idList = new ArrayList<Serializable>();
			//设置分表路由策略
			RoutingService.getInstance().setRoutingStrategyForList(listName, null, IStrategy.STRATEGY_R);
			if(StringUtils.isEmpty(sql)){
				ListItem item = DaoConfig.getInstance().getListItem(listName);
				sql = item.getSqlitem();
			}
			
			Session session = DaoHelper.getSessionFactory().getCurrentSession();
			tx = session.beginTransaction();
			
			//先查一下总数据
			String countSql = "select count(*) from (" + sql + ") as t" + System.currentTimeMillis();
			Query countQuery = session.createSQLQuery(countSql);
			if(params != null && params.length > 0){
				for(int i = 0; i < params.length; i++){
					countQuery.setParameter(i, params[i]);
				}
			}
			List countResult = countQuery.list();
			if(countResult == null || countResult.isEmpty()){
				return new Page();
			}
			long count = Long.decode(countResult.get(0).toString());
			if(count < 1){
				return new Page();
			}
			
			Query query= session.createSQLQuery(sql);
			if(params != null && params.length > 0){
				for(int i = 0; i < params.length; i++){
					query.setParameter(i, params[i]);//query.getQueryString().setParameter(i, params[i]);
				}
			}
			int first = (pageNo - 1) * pageSize;  
			query.setFirstResult(first);
			query.setMaxResults(pageSize);
			idList = query.list();
			tx.commit();
			List<T> list = this.loads(idList);
			//构造一个新的page
			return new Page(first, count, pageSize, list);
		} catch (Exception e) {
			if(tx != null){
				tx.rollback();
			}
			log.error("excuteSql error", e);
		}
		return new Page();
	}
	
	/**
	 * 执行自定义sql【sql可以自己传入，用于动态拼装。只是利用listName来取得路由策略，配置文件中的sql可以随意写一句，如 select version();】
	 * @param listName
	 * @param sql
	 * @param params
	 * @return
	 */
	protected List excuteListSql(String listName, String sql, Object[] params, int pageNo, int pageSize) {
		List list = null;
		Transaction tx = null;
		try {
			//设置分表路由策略
			RoutingService.getInstance().setRoutingStrategyForList(listName, null, IStrategy.STRATEGY_R);
			if(StringUtils.isEmpty(sql)){
				ListItem item = DaoConfig.getInstance().getListItem(listName);
				sql = item.getSqlitem();
			}
			
			Session session = DaoHelper.getSessionFactory().getCurrentSession();
			tx = session.beginTransaction();
			Query query = session.createSQLQuery(sql);
			if(params != null && params.length > 0){
				for(int i = 0; i < params.length; i++){
					query.setParameter(i, params[i]);
				}
			}
			int first = (pageNo - 1) * pageSize;  
			query.setFirstResult(first);
			query.setMaxResults(pageSize);
			list = query.list();
			tx.commit();
		} catch (Exception e) {
			if(tx != null){
				tx.rollback();
			}
			list = new ArrayList();
			log.error("excuteSql error", e);
		}
		return list;
	}
	

	/**
	 * 执行自定义sql[sql在配置文件里]
	 * @param listName
	 * @param params
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	protected List excuteListSql(String listName, Object[] params) {
		return this.excuteListSql(listName, null, params);
	}
	
	/**
	 * 取一个不重复随机序列
	 * @param size			LIST的size
	 * @param count			需要取的个数
	 * @return
	 */
	protected List<Integer> randomIndex(int size, long count) {
		List<Integer> list = new ArrayList<Integer>();
		if(size <= count){
			// size < count的情况下，所有序列都取完整
			log.warn("size <= count !!! size:{}, count:{}", size, count);
			for(int i = 0; i < size; i++){
				list.add(i);
			}
		}else{
			int i = 0;
			while(true){
				int num = this.random.nextInt(size);
				if(!list.contains(num)){
					list.add(num);
					i++;
				}
				if(i == count){
					break;
				}
			}
		}
		return list;
	}
	
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected List list(String listName, Object[] params, int pageNo, int pageSize){
		List list = new ArrayList();
		try {
			int start = (pageNo - 1) * pageSize;
			List<Serializable> ids = this.dao.getIdList(listName, params, start, pageSize);
			if(!CollectionUtils.isEmpty(ids))
			list=this.loads(ids);
		} catch (DaoException e) {
			log.error(e.getMessage(), e);
		}
		return list;
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected List list(String listName, Object[] params){
		List list = new ArrayList();
		try {
			List<Serializable> ids = this.dao.getIdList(listName, params);
			if(!CollectionUtils.isEmpty(ids))
			{
			 list=this.loads(ids);
			}
		} catch (DaoException e) {
			log.error(e.getMessage(), e);
		}
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<Serializable> listIds(String listName, Object[] params){
		List<Serializable> ids = new ArrayList<Serializable>();
		try {
			ids = this.dao.getIdList(listName, params);
			return ids;
		} catch (DaoException e) {
			log.error(e.getMessage(), e);
		}
		return ids;
	}
	
	@SuppressWarnings("unchecked")
	protected List<Serializable> listIds(String listName, Object[] params, int pageNo, int pageSize){
		List<Serializable> ids = new ArrayList<Serializable>();
		try {
			int start = (pageNo - 1) * pageSize;
			ids = this.dao.getIdList(listName, params, start, pageSize);
			return ids;
		} catch (DaoException e) {
			log.error(e.getMessage(), e);
		}
		return ids;
	}
	
	//新增方法,主要用于清空表的数据
	public boolean delData4Table(String listName,Object[] object)
	{
		List<Serializable> ids =  this.listIds(listName, object);
		if(ids.size()>0){
			return this.batchDelete2(ids);
		}
		return true;
	}
	
	public static void main(String[] args){
		BaseServiceImpl<Object> impl = new BaseServiceImpl<Object>();
		List<Integer> list = impl.randomIndex(500, 10);
		for (Integer integer : list) {
			log.info("" + integer);
		}
	}
}

