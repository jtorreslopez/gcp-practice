from flask import Flask, flash, render_template, request, redirect
from flask_mysqldb import MySQL
import os 

app = Flask(__name__)


app.config['MYSQL_HOST'] = 'db'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'mysqlpassword'
app.config['MYSQL_DB'] = 'mydb'

mysql = MySQL(app)


@app.route('/')
def results():
        mycursor = mysql.connection.cursor()
        mycursor.execute("SELECT * FROM PROCESADOR")
        data = mycursor.fetchall()
        hostname = os.uname()[1]
        return render_template('v_results.html', data=data, hostname=hostname)
 
 
if __name__ == '__main__':
    app.run(host='0.0.0.0')
