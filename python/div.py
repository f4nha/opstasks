import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/', methods=['GET'])
def division():
	a = None
	b = None
	if 'a' in request.args:
		a = int(request.args['a'])
	else:
		return 'Please provide value for a\n'

	if 'b' in request.args:
		b = int(request.args['b'])
	else:
		return 'Please provide value for b\n'

	return "{} / {} = {}\n".format(a, b, a/b)

app.run(host="0.0.0.0", port=5001)
