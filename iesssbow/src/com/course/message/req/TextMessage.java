package com.course.message.req;

/** 
 * 请求消息类型-文本消息 
 */  
public class TextMessage extends BaseMessage{
	
	 // 消息内容  
    private String Content;  
  
    public String getContent() {  
        return Content;  
    }  
  
    public void setContent(String content) {  
        Content = content;  
    }  

}
