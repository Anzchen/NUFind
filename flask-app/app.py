###
# Main application interface
###

# imports
from src import create_app, db
from flask import request, jsonify, make_response, current_app
import json

# create the app object
app = create_app()

@app.route("/")
def hello_world():
    return f'<h1>Hello From NUFind app</h1>'

@app.route("/event", methods = ['POST'])
def add_event():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    eventID =  request.form['eventID']
    desc = request.form['event_desc']
    capcity = request.form['event_capacity']
    fee = request.form['event_fee']
    name = request.form['event_name']
    time = request.form['event_time']
    query = f'INSERT INTO Events (eventID, event_desc, event_capacity, event_fee, event_name, event_time) VALUES (\"{eventID}\", \"{desc}\", \"{capcity}\", \"{fee}\", \"{name}\", \"{time}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

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