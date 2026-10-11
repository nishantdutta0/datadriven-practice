SELECT
  msg_id,
  LENGTH(content) - LENGTH(REPLACE(content,' ','')) + 1 AS word_count
FROM chat_msgs;
