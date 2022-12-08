###
# Main application interface
###

# imports
from src import create_app, db
from flask import request, jsonify, make_response
import json

# create the app object
app = create_app()

@app.route("/")
def hello_world():
    return f'<h1>Hello From NUFind app</h1>'

@app.route("/form")
def get_form():
    return """
    <h2>HTML Forms</h2>

    <form action="/form" method="POST">
    <label for="first">First name:</label><br>
    <input type="text" id="first" name="first" value="John"><br>
    <label for="last">Last name:</label><br>
    <input type="text" id="last" name="last" value="Doe"><br><br>
    <input type="submit" value="Submit">
    </form> 
    """

@app.route("/form", methods = ['POST'])
def post_form():
   first_name = request.form['first']
   last_name = request.form['last']
   return f'<h1>Hello {first_name} {last_name}.</h1>'

@app.route("/event", methods = ['POST'])
def add_event():
    current_app.logger.info(request.form)
    return "hello"

@app.route("/clubs")
def get_clubs():
    cursor = db.get_db().cursor()
    query = 'select clubId as value, club_name as label from Club'
    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

if __name__ == '__main__':
    # we want to run in debug mode (for hot reloading) 
    # this app will be bound to port 4000. 
    # Take a look at the docker-compose.yml to see 
    # what port this might be mapped to... 
    app.run(debug = True, host = '0.0.0.0', port = 4000)