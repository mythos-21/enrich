FROM lambci/lambda:build-python3.8
ADD common_words.txt /opt/
RUN pip install -t /opt/python/ python-Levenshtein==0.12.2 && \
    pip install -t /opt/python/ fuzzywuzzy==0.18.0  && \
    pip install -t /opt/python/ python-scriptures==3.0.0 && \
    pip install -t /opt/python/ spacy==2.3.2 && \
    pip install spacy==2.3.2 && \
    python3 -m spacy download en_core_web_sm && \
    cp -r /var/lang/lib/python3.8/site-packages/en_core_web_sm /opt/ && \
    cd /opt && \
    zip -r ../layer.zip *; 

