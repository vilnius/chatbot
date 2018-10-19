env/ready: env/bin/python requirements.txt
	env/bin/pip install -r requirements.txt
	touch env/ready

env/bin/python:
	python3.6 -m venv env

env/bin/pip-compile: env/bin/python
	env/bin/pip install pip-tools

requirements.txt: env/bin/pip-compile requirements.in
	env/bin/pip-compile --no-index requirements.in -o requirements.txt

.PHONY: train-intents
train-intents: env/ready
	env/bin/python -m rasa_nlu.train \
	  --config nlu_config.yml \
	  --data intents \
	  --path models \
	  --project current \
	  --fixed_model_name nlu \
	  --verbose


.PHONY: train-stories
train-stories: env/ready
	env/bin/python -m rasa_core.train \
	  --domain domain.yml \
	  --stories stories \
	  --out models/stories
