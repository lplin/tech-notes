# What larger tech companies with high traffic are using ElasticSearch? [...](http://www.quora.com/What-larger-tech-companies-with-high-traffic-are-using-ElasticSearch)

Though, by no means exhaustive, here's a list:
Wikipedia and its sister sites
Netflix
Facebook
Atlassian
Github
Loggly
Klout
StumbleUpon
Xing

[Who is Using Us](https://www.elastic.co/use-cases)

[Notable users of Elasticsearch](https://en.wikipedia.org/wiki/Elasticsearch): include Wikimedia,StumbleUpon,Mozilla,[14][15] Amadeus IT Group, Quora,[16] Foursquare,[17] Etsy,[18] SoundCloud,[19] GitHub,[20] FDA,[21] CERN,[22] Stack Exchange,[23] Center for Open Science,[24] Reverb,[25] Netflix.,[26] Pixabay,[27] Sophos and the Slurm Workload Manager.[citation needed]

Elasticsearch’s userbase includes major companies like Facebook, Netflix, Comcast, and Goldman Sachs. [Source](http://venturebeat.com/2014/06/05/elasticsearchs-70m-round-proves-theres-big-money-in-free-software/)


# Install

	curl -L -O https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.6.0.zip
	unzip elasticsearch-1.6.0.zip
	cd elasticsearch-1.6.0.zip

	./bin/plugin -i elasticsearch/marvel/latest  # Marvel and Sense plugin
	echo 'marvel.agent.enabled: false' >> ./config/elasticsearch.yml

Then, ready to go.


# Populate

Use Sense: <http://s1-dlapp07:9200/_plugin/marvel/sense/>

	PUT /megacorp/employee/1
	{
	    "first_name" : "John",
	    "last_name" :  "Smith",
	    "age" :        25,
	    "about" :      "I love to go rock climbing",
	    "interests": [ "sports", "music" ]
	}

	PUT /megacorp/employee/2
	{
	    "first_name" :  "Jane",
	    "last_name" :   "Smith",
	    "age" :         32,
	    "about" :       "I like to collect rock albums",
	    "interests":  [ "music" ]
	}

	PUT /megacorp/employee/3
	{
	    "first_name" :  "Douglas",
	    "last_name" :   "Fir",
	    "age" :         35,
	    "about":        "I like to build cabinets",
	    "interests":  [ "forestry" ]
	}

# Retrieve
* [Get employee #1](http://s1-dlapp07:9200/megacorp/employee/1):   
`GET /megacorp/employee/1`
* [Search for all employees](http://s1-dlapp07:9200/megacorp/employee/_search):  
`GET /megacorp/employee/_search`
- [Employees with “Smith” in their last name](http://s1-dlapp07:9200/megacorp/employee/_search?q=last_name:Smith):  
`GET /megacorp/employee/_search?q=last_name:Smith`
- In a complicated but powerful domain-specific language (Query DSL):

		GET /megacorp/employee/_search
		{
		    "query" : {
		        "match" : {
		            "last_name" : "Smith"
		        }
		    }
		}
- Only employees who are older than 30:   

		GET /megacorp/employee/_search
		{
		    "query" : {
		        "filtered" : {
		            "filter" : {
		                "range" : {
		                    "age" : { "gt" : 30 } 
		                }
		            },
		            "query" : {
		                "match" : {
		                    "last_name" : "smith" 
		                }
		            }
		        }
		    }
		}

- Group By "interests":

		GET /megacorp/employee/_search
		{
		  "aggs": {
		    "all_interests": {
		      "terms": { "field": "interests" }
		    }
		  }
		}
- The average age of employees who share a particular interest:

		GET /megacorp/employee/_search
		{
		    "aggs" : {
		        "all_interests" : {
		            "terms" : { "field" : "interests" },
		            "aggs" : {
		                "avg_age" : {
		                    "avg" : { "field" : "age" }
		                }
		            }
		        }
		    }
		}

# View Query

SELECT * FROM view_query_4146 WHERE idview_query=66 ; -- Only inactive=0
SELECT * FROM view_query_4975 WHERE idview_query=66 ; -- Empty
SELECT * FROM view_query_4975 WHERE idview_query=66 ; -- Empty
SELECT * FROM view_query_4495 WHERE idview_query=66 ; -- Only inactive=0


SELECT * FROM view_query_4146 WHERE idview_query=54 ;-- pass;
SELECT * FROM view_query_4975 WHERE idview_query=65 ; -- Only inactive=0
SELECT * FROM view_query_4146 WHERE idview_query=65 ; -- Only stage=open;
SELECT * FROM view_query_4495 WHERE idview_query=65 ; -- reconciliationSequence=0, stage=open, inProcess=false, unreconciled=false, inactive=false

SELECT * FROM lifecycle_stage_4975 WHERE logically_open=1; -- Only stage open


SELECT * FROM view_4146; -- 65 Open



SELECT * FROM user_group_acl_3874 uga WHERE node_id=52; -- Only 'Supervisor'

SELECT * FROM view_query_3874 WHERE idview_query=52; -- stage='passed'

SELECT uga.user_group_user_group_name, uga1.* FROM user_group_acl_3874 uga -- Only 'Supervisor'
INNER JOIN view_3874 v0 ON v0.id=uga.node_id AND v0.view_name='tab2'
INNER JOIN view_3874 v1 ON v1.view_name='pass_detail_report' -- 54
LEFT OUTER JOIN user_group_acl_3874 uga1 ON uga1.user_group_user_group_name=uga.user_group_user_group_name AND uga1.node_id=v1.id

SELECT * FROM view_3874 WHERE view_name LIKE '%_report%';

All firms:
	@GrabConfig(systemClassLoader=true)
	@Grab(group='mysql', module='mysql-connector-java', version='5.1.18')
	import groovy.sql.Sql

	/*
	def db = Sql.newInstance('jdbc:mysql://s1-dlapp07:3306/case_framemf', 'rdcapp', '321-rdc', 'com.mysql.jdbc.Driver')
	res = ['base', db.rows('select biz_unit_id from firm_config;').collect { it[0] }].flatten()
	println res
	*/

	def db = Sql.newInstance('jdbc:mysql://s1-dlapp07:3306/case_framemf', 'rdcapp', '321-rdc', 'com.mysql.jdbc.Driver')
	[[biz: 'base', firm: ''], db.rows('select biz_unit_id, default_firm_nbr from firm_config;').collect { [biz: it[0], firm: it[1]] } ].flatten().each {
	    bizUnitId = it['biz']
	    println "${bizUnitId}-${it['firm']}:" 
	    q = """
	-- SELECT attribute, value FROM view_query_${bizUnitId} WHERE idview_query=66 ; -- Only inactive=0
	SELECT v.view_name, GROUP_CONCAT(
	    CONCAT(vq.attribute, '=', vq.value) ORDER BY vq.attribute SEPARATOR ', ')
	FROM view_query_${bizUnitId} vq
	-- INNER JOIN view_${bizUnitId} v ON v.id=vq.idview_query AND v.view_name LIKE '%report'
	INNER JOIN view_${bizUnitId} v ON v.id=vq.idview_query AND v.view_name = 'on_hold_report'
	GROUP BY idview_query
	;
	;
	"""
	    db.eachRow(q.toString()) { row ->
	        println "\t ${row[0]}: ${row[1]}"
	    }
	}

base-:
3874-MC03000P:
3872-MC03000T:
3920-LP01000P:
3930-RS02000P:
3868-RD09000P:
3936-WU03000T:
3940-WU02000P:
3939-WU03000P:
3938-WU04000P:
4050-WM01001T:
4090-WM01001P:
3775-KC01001T:
4045-KC01001P:
4087-KC01002T:
4088-KC01002P:
4083-RJ01000T:
4146-RJ01000P:
4975-RS02004P:
4984-RS02004T:
4976-RS02005P:
4985-RS02005T:
5225-BW10000T:
5224-BW10000P:
	 on_hold_report: inactive=false, pended=true, stage=open, unreconciled=false
4349-LB01001T:
4097-LB01001P:
4495-BF10000P:
4494-BF10000T:
	 on_hold_report: inactive=false, pended=true, unreconciled=false

==> Open
3874-MC03000P:
3920-LP01000P:
4097-LB01001P:
4495-BF10000P:
4494-BF10000T:
	 65.open_report: inactive=false, inProcess=false, reconciliationSequence=0, stage=open, unreconciled=false

3872-MC03000T:
3930-RS02000P:
3868-RD09000P:
3936-WU03000T:
3940-WU02000P:
3939-WU03000P:
3938-WU04000P:
4050-WM01001T:
4090-WM01001P:
3775-KC01001T:
4045-KC01001P:
4087-KC01002T:
4088-KC01002P:
4083-RJ01000T:
4146-RJ01000P:
4349-LB01001T:
	 69.open_report: stage=open

base-:
4975-RS02004P:
4984-RS02004T:
4976-RS02005P:
4985-RS02005T:
5225-BW10000T:
5224-BW10000P:
0-RD00000T:
==> Empty

==> All firm including base
	 submitted_report: inactive=false, reconciliationSequence=0
	 pass_report: inactive=false, reconciliationSequence=0, stage=passed
	 fail_report: inactive=false, reconciliationSequence=0, stage=failed
	 require_notify_report: inactive=false, notified=false, reconciliationSequence=0, stage=passed
	 pass_detail_report: inactive=false, reconciliationSequence=0, stage=passed (3874-MC03000P doesn't have)
	 alert_category_report: inactive=0

