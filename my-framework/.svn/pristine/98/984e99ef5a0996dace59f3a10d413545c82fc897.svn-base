package com.nasoft.util.redis;

import java.io.Serializable;
import java.util.List;

public interface RedisService {
	
	void set(String key, Serializable value, long expiredTime);
	
	void setJson(String key, Object value, long expiredTime);
	
	Serializable get(String key);
	
	Object getJson(String key, Class clazz);
	
	
	void del(String key);
	
	void push(String channel, Serializable message);
	
	void lpush(String channel, Serializable message);
	
	List<Serializable> range(String key, int start, int end) ;

	void remove(String key, long i, Serializable value) ;
	
	boolean lock(String key, long time);
	
	void unlock(String key);

	void lpush(String channel, Serializable message, long expiredTime);

	Serializable index(String key, long index);

	List<Serializable> range(String key);
}
