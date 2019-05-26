package com.nasoft.util.redis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.CollectionUtils;


public class RedisQueueListenerContainer implements InitializingBean, DisposableBean, BeanNameAware {
	private static Logger logger = LoggerFactory.getLogger(Application.getInstance().getRuntimeLogger());
	
	private final Map<String, QueueListener> listeners = new ConcurrentHashMap<String, QueueListener>();
	private ExecutorService executor = Executors.newCachedThreadPool();
	private boolean running = false;
	private String beanName;
	private RedisTemplate redisTemplate;
	private final int redisPoolPeriod = 20;
	
	
	public void start() {
		running = true;
		logger.info("#################################### start redis queue read thread ##########################################");
		executor.execute(new Runnable() {

			@Override
			public void run() {
				final List<byte[]> rawKeyList = new ArrayList();
				for(String key:listeners.keySet()) {
					rawKeyList.add(redisTemplate.getStringSerializer().serialize(key));
				}
				final byte[][] rawKeys = rawKeyList.toArray(new byte[rawKeyList.size()][]);
				while(running) {
					redisTemplate.execute(new RedisCallback() {
	                    @Override
	                    public Object doInRedis(RedisConnection conn) throws DataAccessException {
	                        if (rawKeyList.isEmpty()) {
	                            return null;
	                        }
	                        
	                        
	                        List<byte[]> list = conn.bLPop(redisPoolPeriod, rawKeys);
	                        if (CollectionUtils.isEmpty(list)) {
	                            return null;
	                        }
	                        final String topic = (String)redisTemplate.getKeySerializer().deserialize(list.get(0));
	                        final Object message = redisTemplate.getValueSerializer().deserialize(list.get(1));
	                        executor.execute(new Runnable() {
	                            @Override
	                            public void run() {
	                            	try {
	                            		process(topic, message);
	                            	} catch (Exception e) {
	                            		logger.error("", e);
	                            	}
	                            }
	                        });
	                        return null;
	                    }
	                });
				}
			}
			
		});
	}
	
	private void process(final String topic, final Object message) throws Exception {
		
		
		executor.submit(new Runnable() {
            @Override
            public void run() {
            	QueueListener listener = listeners.get(topic);
        		listener.onMessage(topic, message);
            }
            
        }).get(10, TimeUnit.SECONDS); 
		
	}

	
	@Override
	public void setBeanName(String name) {
		this.beanName = name;
	}

	@Override
	public void destroy() throws Exception {
		running = false;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		if(!this.listeners.isEmpty()) {
			start();
		}
	}

	public void setMessageListeners(Map<String, QueueListener> listeners) {
		this.listeners.clear();
		this.listeners.putAll(listeners);
		
	}

	public RedisTemplate getRedisTemplate() {
		return redisTemplate;
	}

	public void setRedisTemplate(RedisTemplate redisTemplate) {
		this.redisTemplate = redisTemplate;
	}
	
	
}
