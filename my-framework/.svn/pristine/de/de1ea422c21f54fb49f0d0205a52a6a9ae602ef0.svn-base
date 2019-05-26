package com.nasoft.util.redis;

import java.io.Serializable;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.BoundListOperations;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;


public class SpringRedisService implements RedisService {
	public static Gson gson = new Gson();
    protected RedisTemplate<String, Serializable> redisTemplate = null;
	

	@Override
	public void set(String key, Serializable value, long expiredTime) {
		BoundValueOperations valueOper = redisTemplate.boundValueOps(key);

		if (expiredTime <= 0) {
			valueOper.set(value);
		} else {
			valueOper.set(value, expiredTime, TimeUnit.MILLISECONDS);
		}
	}
	

	@Override
	public void setJson(String key, Object value, long expiredTime) {
		
		String gvalue = gson.toJson(value);
		set(key, gvalue, expiredTime);
	}  
	

	@Override
	public Serializable get(String key) {
		BoundValueOperations<String, Serializable> valueOper = redisTemplate.boundValueOps(key);
		return valueOper.get();
	}


	@Override
	public Object getJson(String key, Class clazz) {
		String gvalue = (String)get(key);
		if(gvalue == null)
			return null;
		
		
		Object value = (Object)gson.fromJson(gvalue, clazz);
		return value;
	}

	
	public void del(String key) {
		if (redisTemplate.hasKey(key)) {
			redisTemplate.delete(key);
		}
	}

	public RedisTemplate<String, Serializable> getRedisTemplate() {
		return redisTemplate;
	}

	public void setRedisTemplate(RedisTemplate<String, Serializable> redisTemplate) {
		this.redisTemplate = redisTemplate;
	}

	@Override
	public void push(String channel, Serializable message) {
		redisTemplate.convertAndSend(channel, message);
	}

	public void lpush(String channel, Serializable message) {
		redisTemplate.opsForList().leftPush(channel, message);
		
	}
	
	@Override
	public void lpush(String channel, Serializable message, long expiredTime ) {
		BoundListOperations listOps=redisTemplate.boundListOps(channel);
		
		if (expiredTime <= 0) {
			lpush(channel,message);
		} else {
			listOps.expire(expiredTime, TimeUnit.MILLISECONDS);
			listOps.leftPush(message);
		}		
	}

	@Override
	public Serializable index(String key,long index) {
		return redisTemplate.opsForList().index(key, index);		
	}
	
	public List<Serializable> range(String key, int start, int end) {  
        return redisTemplate.opsForList().range(key, start, end);  
    }
	
	@Override
	public List<Serializable> range(String key) {  
        return redisTemplate.opsForList().range(key, 0, -1);  
    }
	
	
	public void remove(String key, long i, Serializable value) {  
		redisTemplate.opsForList().remove(key, i, value);  
    }



	@Override
	public boolean lock(final String key, final long time) {
		
		return redisTemplate.execute(new RedisCallback<Boolean>() {
            @Override
            public Boolean doInRedis(RedisConnection connection)
                    throws DataAccessException {
				Boolean nx = connection.setNX(key.getBytes(), "locked".getBytes());
				if(nx) {
					connection.expire(key.getBytes(), time);
				}
				
				return nx;
				
			}}, true);
	}


	@Override
	public void unlock(String key) {
		del(key);
	}



}
