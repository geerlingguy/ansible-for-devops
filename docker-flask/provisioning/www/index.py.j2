# Infrastructure test page.
from flask import Flask
from flask import Markup
from flask import render_template
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text

app = Flask(__name__)

# Configure MySQL connection.
db_uri = 'mysql://flask:flask@{{ host_ip_address }}/flask'
app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
db = SQLAlchemy(app)

@app.route("/")
def test():
    mysql_result = False
    try:
        query = text('SELECT 1')
        result = db.engine.execute(query)
        if [row[0] for row in result][0] == 1:
            mysql_result = True
    except:
        pass

    if mysql_result:
        result = Markup('<span style="color: green;">PASS</span>')
    else:
        result = Markup('<span style="color: red;">FAIL</span>')

    # Return the page with the result.
    return render_template('index.html', result=result)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
