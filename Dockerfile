FROM continuumio/miniconda3

RUN conda create -n chemodel python==3.7 

SHELL ["conda", "run", "-n", "chemodel", "/bin/bash", "-c"]

RUN conda install django=3.* -c conda-forge --override-channels
RUN conda install pytorch==1.7.1 torchvision==0.8.2 torchaudio==0.7.2 cpuonly -c pytorch -c conda-forge --override-channels -c tboyer
RUN conda install -c rdkit -c conda-forge rdkit --override-channels
RUN conda install -c rdkit -c conda-forge mordred --override-channels
RUN conda install django-heroku -c conda-forge --override-channels

# pip 
RUN pip3 install --upgrade pip
RUN pip3 install gunicorn

# Add our codeg
ADD ./chemodel /chemodel/

WORKDIR /chemodel
CMD gunicorn --bind 0.0.0.0:$PORT chemodel.wsgi
