# Install
1. sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
2. Ubuntu 14.04: echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
3. sudo apt-get update
4. sudo apt-get install -y mongodb-org

From: https://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

# Run
	$ tree /var/lib/mongodb
	/var/lib/mongodb
	├── journal
	│   ├── prealloc.0
	│   └── prealloc.1
	└── mongod.lock
	$ ll /var/log/mongodb
	$ less /etc/mongod.conf

	$ sudo service mongod start/stop/restart

# Getting started
[Getting Started with MongoDB (Java Edition)](https://docs.mongodb.org/getting-started/java/)
$ mongo
> help
> db.stats()
{
	"db" : "test",
	"collections" : 0,
	"objects" : 0,
	"avgObjSize" : 0,
	"dataSize" : 0,
	"storageSize" : 0,
	"numExtents" : 0,
	"indexes" : 0,
	"indexSize" : 0,
	"fileSize" : 0,
	"ok" : 1
}
> 

# Tutorial
[MongoDB Tutorial](http://www.tutorialspoint.com/mongodb/)
- Every post has the unique title, description and url.
- Every post can have one or more tags.
- Every post has the name of its publisher and total number of likes.
- Every Post have comments given by users along with their name, message, data-time and likes.
- On each post there can be zero or more comments.
==>

	{
	   _id: POST_ID
	   title: TITLE_OF_POST, 
	   description: POST_DESCRIPTION,
	   by: POST_BY,
	   url: URL_OF_POST,
	   tags: [TAG1, TAG2, TAG3],
	   likes: TOTAL_LIKES, 
	   comments: [	
	      {
	         user:'COMMENT_BY',
	         message: TEXT,
	         dateCreated: DATE_TIME,
	         like: LIKES 
	      },
	      {
	         user:'COMMENT_BY',
	         message: TEXT,
	         dateCreated: DATE_TIME,
	         like: LIKES
	      }
	   ]
	}
==> in RDBMS you need to join three tables and in mongodb data will be shown from one collection only.

	> use mydb
	switched to db mydb
	> show dbs
	local  0.078GB
	> db
	mydb
	> db.movie.insert({"name":"tutorials point"})
	WriteResult({ "nInserted" : 1 })
	> show dbs
	local  0.078GB
	mydb   0.078GB

==> To display database you need to insert atleast one document into it.
