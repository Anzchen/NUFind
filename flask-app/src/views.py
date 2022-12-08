from flask import Blueprint

views = Blueprint('views', __name__)

# This is a base route
# we simply return a string.  
@views.route('/')
def home():
    return ('<h1>Hello from your web app!!</h1>')

# This is a sample route for the /test URI.  
# as above, it just returns a simple string. 
@views.route('/test')
def tester():
    return "<h1>this is a test!</h1>"

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
