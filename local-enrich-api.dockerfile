FROM mythos21_enrich_loc_proto:1.0

# Set an environment variable for the working directory and set it so Docker operates from there
ENV APP /app
RUN mkdir $APP
WORKDIR $APP

# Copy the python app and the common_words file
COPY common_words.txt .
COPY code/closest_bible_book.py .
COPY code/enrich_text.py .
COPY code/local-run.py .

# Expose the port uWSGI will listen on
EXPOSE 5000

# Run the python file using uwsgi
CMD [ "uwsgi", "--http-socket", ":5000", "--callable", "app", "--single-interpreter", "--processes", "1", "--wsgi-file", "local-run.py" ]
