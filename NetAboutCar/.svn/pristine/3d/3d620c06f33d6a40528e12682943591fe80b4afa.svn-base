package com.nasoft.aboutcar.mnguserinfo.service;
import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.mnguserinfo.domain.MngUserInfo;

public interface MngUserInfoService {
	
	public List<MngUserInfo> findUser(String sqlId,Map<String ,Object> map);

	public MngUserInfo searchById(String sqlId, String uid);
	
	public int insertUserInfo(String sqlId, MngUserInfo user);

	public int updateUserInfo(String sqlId, MngUserInfo user);
	
	public int deleteUserInfo(String sqlId, Map<String ,Object> map);
	
	/**
	 * 用户登录验证
	 * @param sqlId
	 * @param userName
	 * @return
	 */
	public MngUserInfo LoginVerification(String sqlId,String userName);
	/**
	 * 通过身份证号查询用户
	 * @param string
	 * @param certno
	 * @return
	 */
	public MngUserInfo findUserByCertno(String string, String certno) throws Exception ;
	/**
	 * 通过姓名查询管理员
	 * @param sqlId
	 * @param username
	 * @return
	 */
	public List<Map> findUserByUsername(String sqlId, String username)throws Exception ;
	/**
	 * 通过用户id查询审批权限信息
	 * @param sqlId
	 * @param map
	 * @return
	 * @throws Exception 
	 */
	public List<Map> searchApprovalLimitById(String sqlId, Map<String, Object> map) throws Exception;
	
}