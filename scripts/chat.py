#!/usr/bin/env python

import json

from rasa_nlu.model import Interpreter

interpreter = Interpreter.load("models/current/nlu")
result = interpreter.parse("labas")
print(json.dumps(result, indent=2))
