# Mythos21 Text Enrichment


One of the core features of Mythos21 is the 'enrichment' API. Given a body of text, it will extract scripture references and named entities. 

## Deploying on AWS Lambda

The normal way to deploy this is to

* run ```aws_lambda_.sh``` to create the mythos21_enrich_layer.zip zipfile
* upload this zipfile as a Lambda layer
* Create a lambda function with that layer and these python files: closest_bible_book.py, enrich_text.py, lambda_function.py.
* Set the function behind an API gateway



## Deploying locally

To deploy this API locally

* Run ```./local-build.sh``` to build the image for running locally
* Set the ENRICH_PORT and X_API_KEY environment variables.
* Run ```./local-run.sh``` to spinup a local container.
* Test with the examples below:



```bash
curl http://127.0.0.1:$ENRICH_PORT
# {"message":"Hello from enrich_text"}

curl -X POST http://127.0.0.1:$ENRICH_PORT/enrich --header "X-Api_Key:$X_API_KEY" --header 'Content-Type: application/json' -d '{"text":"Today I learned about Abraham from reading Genesis 22:5-10"}'
# {"entities":[{"key":"abraham","name":"Abraham","pos":"PER"}],"html":"Today I learned about <a href='javascript:void' onclick='clickNamedEnt(\"abraham\")'> Abraham </a> from reading <a href='javascript:void' onclick='clickPassage(\"bible\", \"Genesis\", \"22\", 5, \"22\", 10, \"Genesis 22:5-10\")'> Genesis 22:5-10 </a>","named_bible_refs":[["Genesis",22,5,22,10,"Genesis 22:5-10"]],"req_id":null}

```

