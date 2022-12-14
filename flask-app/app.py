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

# posts
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

@app.route("/add_bill", methods = ['POST'])
def add_bill():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    eventID = request.form['eventID']
    query = f'INSERT INTO Billing (billID, datePaid) VALUES (\"{eventID}\", null)'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

@app.route("/add_friend", methods = ['POST'])
def add_friend():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    nuid = request.form['nuid']
    friendsWith = request.form['friendsWith']
    query = f'INSERT INTO Friends (nuid, friendsWith) VALUES (\"{nuid}\", \"{friendsWith}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

@app.route("/elocation", methods = ['POST'])
def add_elocation():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
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

@app.route("/einterest", methods = ['POST'])
def add_einterest():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    event = request.form['eventID']
    interest = request.form['event_type']
    query = f'INSERT INTO EventInterests (eventID, interestID) VALUES (\"{event}\", \"{interest}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

@app.route("/ecatering", methods = ['POST'])
def add_ecatering():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    event = request.form['eventID']
    food = request.form['event_food']
    query = f'INSERT INTO Catering (foodID, eventID) VALUES (\"{food}\", \"{event}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

@app.route("/ecost", methods = ['POST'])
def add_ecost():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    event = request.form['eventID']
    amount = request.form['event_cost']
    query = f'INSERT INTO EventCost (billID, event_amount, eventID) VALUES (\"{event}\",\"{amount}\", \"{event}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

@app.route("/filteredEvents", methods = ['GET'])
def get_filteredEvents():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    # date = request.form['event_date']
    # food = request.form['event_food']
    # type = request.form['event_type']
    # club = request.form['event_club']
    # query = f'select event_time as date, food_cuisine as food, club_name as club, interests as type, event_name as name, event_desc as description from Events natural join EventClub natural join Catering natural join Club natural join Food natural join EventInterests natural join AreasOfInterest where '
    # if date != 'null':
    #     query += ('event_time = \"{date}\"')
    #     if food != '':
    #         query += (' and food_cuisine = \"{food}\"')
    #         if type != 'NULL':
    #             query += (' and interests = \"{type}\"')
    #             if club != 'null':
    #                 query += (' and club_name = \"{club}\"')
    # elif food != '':
    #     query += ('food_cuisine = \"{food}\"')
    #     if type != 'NULL':
    #         query += (' and interests = \"{type}\"')
    #         if club != 'null':
    #             query += (' and club_name = \"{club}\"')
    # elif type != 'NULL':
    #     query +=('interests = \"{type}\"')
    #     if club != 'null':
    #         query +=(' and club_name = \"{club}\"')
    # elif club != 'null':
    #     query += ('club_name = \"{club}\"')
    # else:
    #     query = f'select event_time as date, food_cuisine as food, club_name as club, interests as type, event_name as name, event_desc as description from Events natural join EventClub natural join Catering natural join Club natural join Food natural join EventInterests natural join AreasOfInterest'
    query = f'select event_time as date, food_cuisine as food, club_name as club, interests as type, event_name as name, event_desc as description from Events natural join EventClub natural join Catering natural join Club natural join Food natural join EventInterests natural join AreasOfInterest'
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

# updates
@app.route("/updateLocation", methods = ['POST'])
def update_location():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    location = request.form['event_location']
    query = f'update Locations set loc_availability = FALSE where locationID = \"{location}\"'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

@app.route("/updateBudget", methods = ['POST'])
def update_budget():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    clubID = request.form['clubID']
    query = f'update Club set budget = 0 where clubID = \"{clubID}\"'
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

# getters
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

@app.route("/eventClub")
def get_eventClub():
    cursor = db.get_db().cursor()
    query = 'select eventID as value, clubID as label from EventClub'
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

@app.route("/eventBill")
def get_eventBill():
    cursor = db.get_db().cursor()
    query = 'select * from EventCost'
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

@app.route("/eventCatering")
def get_eventCatering():
    cursor = db.get_db().cursor()
    query = 'select eventID as value, foodID as label from Catering'
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

@app.route("/eventLocation")
def get_eventLocation():
    cursor = db.get_db().cursor()
    query = 'select eventID as value, locationID as label from EventLocation'
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

@app.route("/shortenedEvents")
def get_shortenedEvents():
    cursor = db.get_db().cursor()
    query = f'select event_time as date, food_cuisine as food, clubID as club, interests as type, event_name as name, event_desc as description from Events natural join EventClub natural join Catering natural join Club natural join Food natural join EventInterests natural join AreasOfInterest'
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
    query = 'select * from Club join Advisor on Advisor.clubID = Club.clubID'
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

@app.route("/allClubs")
def get_allClubs():
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

@app.route("/friends")
def get_friends():
    cursor = db.get_db().cursor()
    query = 'select * from Friends natural join Students'
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

@app.route("/billing")
def get_bills():
    cursor = db.get_db().cursor()
    query = 'select billID as value, datePaid as label from Billing'
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


@app.route("/eventInterests")
def get_eventInterests():
    cursor = db.get_db().cursor()
    query = 'select eventID as value, interestID as label from EventInterests'
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

@app.route("/requestedFunds")
def get_requestedFunds():
    cursor = db.get_db().cursor()
    query = 'select sum(budget) as value from Club'
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