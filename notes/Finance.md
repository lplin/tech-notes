# Web APIs
- [96 STOCKS APIS: BLOOMBERG, NASDAQ AND E*TRADE](http://www.programmableweb.com/news/96-stocks-apis-bloomberg-nasdaq-and-etrade/2013/05/22)
- [Free JSON formatted stock quote API (live or historical) ](http://stackoverflow.com/questions/27794418/free-json-formatted-stock-quote-api-live-or-historical)
- [A Truly Simple Stock API](http://www.blogbyben.com/2009/01/truly-simple-stock-api.html): 
- [Yahoo Finance Stock Quote API](http://vikku.info/codetrash/Yahoo_Finance_Stock_Quote_API)

	import groovy.json.JsonSlurper
	//println "http://finance.yahoo.com/d/quotes.csv?s=FB&f=price".toURL() // 104.880,104.171,N/A,"-2.376 - -2.265%",0.984]
	//println "http://finance.yahoo.com/d/quotes.csv?s=RHT+MSFT&f=sb2b3jk".toURL().readLines() // ["RHT",N/A,N/A,57.87,81.49, "MSFT",N/A,N/A,39.72,54.37]
	//println "http://www.google.com/finance/info?q=NSE:FB,ATULAUTO".toURL().readLines() // [, // [, {, "id": "296878244325128", ,"t" : "FB", ,"e" : "NASDAQ", ,"l" : "102.16", ,"l_fix" : "102.16", ,"l_cur" : "102.16", ,"s": "0", ,"ltt":"2:38PM EDT", ,"lt" : "Oct 30, 2:38PM EDT", ,"lt_dts" : "2015-10-30T14:38:01Z", ,"c" : "-2.72", ,"c_fix" : "-2.72", ,"cp" : "-2.59", ,"cp_fix" : "-2.59", ,"ccol" : "chr", ,"pcls_fix" : "104.88", }, ]]
	//"http://www.google.com/finance/info?q=NSE:FB".toURL().metaClass.metaClass.methods*.name.unique().sort()
	println "http://www.google.com/finance/info?q=NSE:FB".toURL().text

	//t0 = "http://www.google.com/finance/info?q=NSE:FB".toURL().text
	//t1 = t0[6..t0.size()-4]
	//println t1
	def keyMap = [id: 'Internal Google Security ID',
	    t: 'Ticker',
	    e: 'Exchange Name',
	    l: 'Last Price',
	    l_cur: 'l_cur',
	    ltt: 'Last Trade Time',
	    ltt: 'Last Trade Date/Time',
	    c: 'Change (in ccy) - formatted with +/-',
	    cp: 'Change (%)',
	    ccol: 'ccol',
	    el: 'Last Price in Extended Hours Trading',
	    el_cur: 'el_cur',
	    elt: 'Last Trade Date/Time in Extended Hours Trading',
	    ec: 'Extended Hours Change (in ccy) - formatted with +/-',
	    ec: 'Extended Hours Change (%)',
	    eccol: 'eccol'
	]
	fin = new JsonSlurper().parseText("http://www.google.com/finance/info?q=NSE:FB".toURL().text[6..t0.size()-4])
	fin1 = [:]
	fin.each { k, v -> fin1[keyMap[k]] = v }
	fin1.each { 
	  println "$it.key: $it.value"
	}

	f2 = new JsonSlurper().parseText("http://live-nse.herokuapp.com/?symbol=HILTON".toURL().text)


