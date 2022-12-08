###
# Main application interface
###

# import the create app function 
# that lives in src/__init__.py
from src import create_app

# create the app object
app = create_app()

if __name__ == '__main__':
    # we want to run in debug mode (for hot reloading) 
    # this app will be bound to port 4000. 
    # Take a look at the docker-compose.yml to see 
    # what port this might be mapped to... 
    app.run(debug = True, host = '0.0.0.0', port = 4000)

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