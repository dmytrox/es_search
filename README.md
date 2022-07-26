# Index & Autocomplete

To start app tun this command in yout terminal
```
docker-compose up -d 
```
or 
```
make up
```

### Create Index for Elasticsearch Autocomplete 

```
curl -X PUT http://localhost:9200/autocomplete
```

### Load data to the Index

```
curl -H "Content-Type: application/x-ndjson" -X POST http://localhost:9200/_bulk --data-binary "words.json.es"
```
### Search with mistakes

```
curl http://localhost:9200/autocomplete/_search -d '{"query": {"fuzzy":{"word": "abambonedly"}}}' -H "Content-type: application/json"
```

Response: 
```
{
   "_shards" : {
      "failed" : 0,
      "skipped" : 0,
      "successful" : 1,
      "total" : 1
   },
   "hits" : {
      "hits" : [
         {
            "_id" : "TjwaPIIBrQ-Cy8zTCZ1s",
            "_index" : "autocomplete",
            "_score" : 9.250836,
            "_source" : {
               "word" : "abandonedly"
            }
         }
      ],
      "max_score" : 9.250836,
      "total" : {
         "relation" : "eq",
         "value" : 1
      }
   },
   "timed_out" : false,
   "took" : 14
}
```
### Fuzzy search

```
curl http://localhost:9200/autocomplete/_search?_source -d '{"query": { "fuzzy": { "word": { "value": "abada", "fuzziness": 2, "prefix_length": 3, "max_expansions": 7 } } } }' -H "Content-type: application/json"
```

```
{
   "_shards" : {
      "failed" : 0,
      "skipped" : 0,
      "successful" : 1,
      "total" : 1
   },
   "hits" : {
      "hits" : [
         {
            "_id" : "QTwaPIIBrQ-Cy8zTCZ1s",
            "_index" : "autocomplete",
            "_score" : 11.306578,
            "_source" : {
               "word" : "abada"
            }
         },
         {
            "_id" : "MzwaPIIBrQ-Cy8zTCZ1s",
            "_index" : "autocomplete",
            "_score" : 9.045263,
            "_source" : {
               "word" : "abaca"
            }
         },
         {
            "_id" : "NDwaPIIBrQ-Cy8zTCZ1s",
            "_index" : "autocomplete",
            "_score" : 6.783947,
            "_source" : {
               "word" : "abaci"
            }
         },
         {
            "_id" : "OTwaPIIBrQ-Cy8zTCZ1s",
            "_index" : "autocomplete",
            "_score" : 6.783947,
            "_source" : {
               "word" : "aback"
            }
         },
         {
            "_id" : "QzwaPIIBrQ-Cy8zTCZ1s",
            "_index" : "autocomplete",
            "_score" : 6.783947,
            "_source" : {
               "word" : "abaft"
            }
         },
         {
            "_id" : "SjwaPIIBrQ-Cy8zTCZ1s",
            "_index" : "autocomplete",
            "_score" : 6.783947,
            "_source" : {
               "word" : "aband"
            }
         },
         {
            "_id" : "VTwaPIIBrQ-Cy8zTCZ1s",
            "_index" : "autocomplete",
            "_score" : 6.783947,
            "_source" : {
               "word" : "abanga"
            }
         }
      ],
      "max_score" : 11.306578,
      "total" : {
         "relation" : "eq",
         "value" : 7
      }
   },
   "timed_out" : false,
   "took" : 14
}
```
