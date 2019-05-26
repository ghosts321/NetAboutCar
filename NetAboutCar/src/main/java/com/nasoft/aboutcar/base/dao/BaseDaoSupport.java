package com.nasoft.aboutcar.base.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.nasoft.aboutcar.runtime.mybatis.Page;
import com.nasoft.aboutcar.runtime.mybatis.Pageable;
@Repository("baseDaoSupport")
public class BaseDaoSupport implements BaseDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 保存对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object save(String str, Object obj) throws Exception {
		return sqlSessionTemplate.insert(str, obj);
	}

	public <P> int save2(String str, P obj) throws Exception {
		return sqlSessionTemplate.insert(str, obj);
	}
	
	/**
	 * 批量更新
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object batchSave(String str, List objs )throws Exception{
		return sqlSessionTemplate.insert(str, objs);
	}
	
	/**
	 * 修改对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object update(String str, Object obj) throws Exception {
		return sqlSessionTemplate.update(str, obj);
	}
	public <P> int update2(String str, P obj) throws Exception {
		return sqlSessionTemplate.update(str, obj);
	}

	/**
	 * 批量更新
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public void batchUpdate(String str, List objs )throws Exception{
		SqlSessionFactory sqlSessionFactory = sqlSessionTemplate.getSqlSessionFactory();
		//批量执行器
		SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH,false);
		try{
			if(objs!=null){
				for(int i=0,size=objs.size();i<size;i++){
					sqlSession.update(str, objs.get(i));
				}
				sqlSession.flushStatements();
				sqlSession.commit();
				sqlSession.clearCache();
			}
		}finally{
			sqlSession.close();
		}
	}
	
	/**
	 * 批量更新
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object batchDelete(String str, List objs )throws Exception{
		return sqlSessionTemplate.delete(str, objs);
	}
	
	/**
	 * 删除对象 
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object delete(String str, Object obj) throws Exception {
		return sqlSessionTemplate.delete(str, obj);
	}
	 

	public <P> int delete2(String str, P obj) throws Exception {
		return sqlSessionTemplate.delete(str, obj);
	}
	/**
	 * 查找对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public Object findForObject(String str, Object obj) throws Exception {
		return sqlSessionTemplate.selectOne(str, obj);
	}

	public <T,P> T findForObject2(String str, P obj) throws Exception {
		return (T)sqlSessionTemplate.selectOne(str, obj);
	}

	
	/**
	 * 查找对象
	 * @param str
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public List<?> findForList(String str, Object obj) throws Exception {
		return sqlSessionTemplate.selectList(str, obj);
	}

	public Page<?> findForList(String str, Object obj,Pageable pageable) throws Exception {
		List<?> list= sqlSessionTemplate.selectList(str, obj,new RowBounds(pageable.getOffset(),pageable.getLimit()));
		PageList<?> pageList=(PageList<?>) list;
		pageable.setLimit(pageList.getPaginator().getLimit());
		pageable.setOffset(pageList.getPaginator().getOffset());
		Page<?> page=new Page(list,pageable,pageList.getPaginator().getTotalCount());
		return page;
	}

	public <T,P> List<T> findForList2(String str,P obj) throws Exception {
		return sqlSessionTemplate.selectList(str, obj);
	}
	
	public <T,P> Page<T> findForList2(String str,P obj,Pageable pageable) throws Exception {
		List<T> list= sqlSessionTemplate.selectList(str, obj,new RowBounds(pageable.getOffset(),pageable.getLimit()));
		PageList<T> pageList=(PageList<T>) list;
		pageable.setLimit(pageList.getPaginator().getLimit());
		pageable.setOffset(pageList.getPaginator().getOffset());
		Page<T> page=new Page<T>(list,pageable,pageList.getPaginator().getTotalCount());
		return page;
	}
	
	public Map<String, Object> findForMap(String str, Object obj, String key, String value) throws Exception {
		return sqlSessionTemplate.selectMap(str, obj, key);
	}

}
