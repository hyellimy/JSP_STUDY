package kr.or.kosta.log4j.demo;

import org.apache.log4j.Logger;

public class SomeService {
	
	Logger logger = Logger.getLogger(SomeService.class)	;
	
	public void someMethod(){
//		System.out.println("로그기록");
		logger.trace("trace 로그메시지");
		logger.debug("debug 로그메시지");
		logger.info("info 로그메시지");
		logger.warn("warn 로그메시지");
		logger.error("error 로그메시지");
		logger.fatal("fatal 로그메시지");
	}
}
