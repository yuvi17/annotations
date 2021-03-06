# README

Running Steps

* clone the repo

* ` $ bundle install`

* ` $ rails s -p <PORT>`

* Make sure you have Mysql and Elasticsearch running on port 3306 and 9200 respectively

## Problem Overview

* We ingest into system a stream of annotations for a video ID, which describe the video at a given timestamp.

* These annotations are searchable by timestamps, class_name or label, video id etc. and return position of the object as well.


## Application has 3 API's

* `/ingest` -> POST: Insert one record

* `/search` -> GET: Search of Particular Snippet, params: 

```javascript
{
	video_id: 'abc',
	object_id: '1',
	start_time: '3000',
	end_time: '4000',
	class_name: 'test' 
}
```

* `/list` -> GET: List of video Ids ingested to the system.

