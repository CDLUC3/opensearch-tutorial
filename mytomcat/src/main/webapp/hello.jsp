<h1>JSP Hello</h1>
<p>This will log a message with several key/value pairs</p>
<% 
org.apache.logging.log4j.ThreadContext.put("foo", "bar");
org.apache.logging.log4j.ThreadContext.put("ding", "dong");
org.apache.logging.log4j.LogManager.getLogger().info("Log Message");
org.apache.logging.log4j.LogManager.getLogger().error("Log Error");
%> 
<p>...</p>