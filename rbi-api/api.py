from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/echo', methods=['GET'])
def echo_sentence():
    sentence = request.args.get('sentence', '')
    return jsonify({'response': sentence})

if __name__ == '__main__':
    app.run(debug=True)