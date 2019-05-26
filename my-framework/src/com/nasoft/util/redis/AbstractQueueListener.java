package com.nasoft.util.redis;

import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.core.RedisTemplate;

public abstract class AbstractQueueListener implements QueueListener {
	private RedisTemplate redisTemplate;

	public RedisTemplate getRedisTemplate() {
		return redisTemplate;
	}

	public void setRedisTemplate(RedisTemplate redisTemplate) {
		this.redisTemplate = redisTemplate;
	}
	
	@Override
	public void onMessage(String topic, Object message) {
//		byte[] body = message.getBody();
//        byte[] channel = message.getChannel(); 
//        
//        T data = (T)redisTemplate.getValueSerializer().deserialize(body);  
//        String topic = (String)redisTemplate.getStringSerializer().deserialize(channel); 
        processMessage(topic, message);
	}
	
	protected abstract void processMessage(String topic, Object data);
	
	
}
