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

@app.route("/add_event", methods = ['POST'])
def add_event():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    eventID = request.form['eventID']
    desc = request.form['event_desc']
    capcity = request.form['event_capacity']
    fee = request.form['event_fee']
    name = request.form['event_name']
    time = request.form['event_time']
    query = f'INSERT INTO Events (eventID, event_desc, event_capacity, event_fee, event_name, event_time) VALUES (\"{eventID}\", \"{desc}\", \"{capcity}\", \"{fee}\", \"{name}\", \"{time}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

@app.route("/elocation", methods = ['POST'])
def add_elocation():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    # event = cursor.execute(f'SELECT eventID FROM Events LIMIT 1')
    # event = 1003
    event = request.form['eventID']
    location = request.form['event_location']
    query = f'INSERT INTO EventLocation (eventID, locationID) VALUES (\"{event}\", \"{location}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

@app.route("/eclub", methods = ['POST'])
def add_eclub():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    event = request.form['eventID']
    club = request.form['event_club']
    query = f'INSERT INTO EventClub (eventID, clubID) VALUES (\"{event}\", \"{club}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

@app.route("/updateLocation", methods = ['POST'])
def update_location():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    location = request.form['event_location']
    query = f'update Locations, set loc_availability = FALSE where locationID = \"{location}\"'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

@app.route("/interests")
def get_interests():
    cursor = db.get_db().cursor()
    query = 'select InterestID as value, interests as label from AreasOfInterest'
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

@app.route("/events")
def get_events():
    cursor = db.get_db().cursor()
    query = 'select * from Events natural join EventClub'
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

@app.route("/filteredEvents")
def get_filteredEvents():
    cursor = db.get_db().cursor()
    date = request.form['event_date']
    food = request.form['event_food']
    type = request.form['event_location']
    query = 'select * from Events natural join EventClub'
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

@app.route("/clubEvents", methods = ['GET'])
def get_clubEvents():
    cursor = db.get_db().cursor()
    club = request.form['event_club']
    query = 'select * from Events natural join EventClub where clubID =  \"{club}\"'
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

@app.route("/food")
def get_food():
    cursor = db.get_db().cursor()
    query = 'select foodID as value, food_cuisine as label from Food'
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

@app.route("/location")
def get_location():
    cursor = db.get_db().cursor()
    query = 'select locationID as value, loc_buildingName as label from Locations where loc_availability = TRUE'
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

@app.route("/clubs")
def get_clubs():
    cursor = db.get_db().cursor()
    query = 'select clubID as value, club_name as label from Club'
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