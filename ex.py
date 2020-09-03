from flask import Flask, render_template

app = Flask(__name__,template_folder='template')

@app.route('/')
def home():
    return render_template('index.html')


@app.route('/suraj')
def suraj():

    name="suraj"
    return render_template('about.html', name2=name)

@app.route('/bootstrap')
def sam():
    return render_template('bootstrap1.html')


# app.run()# for running the website
app.run(debug=True)#run time changes is possible