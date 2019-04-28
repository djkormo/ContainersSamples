from jupyter/minimal-notebook
# cloning repos
RUN git clone https://github.com/macwilam/KursPython.git \
  &&  git clone https://github.com/djkormo/PythonForML.git  \
  &&  git clone https://github.com/hzitoun/cognitiveclass-applied-data-science-with-python.git \
  && cp -R KursPython ~/work \
  && rm -r KursPython/ \
  && cp -R PythonForML ~/work \
  && rm -r PythonForML/ \
  && cp -R cognitiveclass-applied-data-science-with-python ~/work \
  && rm -r cognitiveclass-applied-data-science-with-python/
 
#RUN git clone https://github.com/djkormo/PythonForML.git 
#RUN git clone https://github.com/hzitoun/cognitiveclass-applied-data-science-with-python.git


# copying repo to working dir
#RUN cp -R KursPython ~/work && rm -r KursPython/

# copying repo to working dir
#RUN cp -R PythonForML ~/work && rm -r PythonForML/

# copying repo to working dir
#RUN cp -R cognitiveclass-applied-data-science-with-python ~/work && rm -r cognitiveclass-applied-data-science-with-python/

# installing base packages 
COPY requirements.txt requirements.txt 

RUN pip install --upgrade pip && pip install -r requirements.txt && rm requirements.txt

