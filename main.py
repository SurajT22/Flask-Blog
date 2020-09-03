import MySQLdb as mdb
from flask import Flask, render_template, request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from flask_mail import Mail
from datetime import datetime
import json  #for configur the jsone module
import os #for use upload the file
import math




DBNAME = "thesmartness"
DBHOST = "localhost"
DBPASS = ""
DBUSER = "root"

try:
    db= mdb.connect(DBHOST, DBUSER, DBPASS, DBNAME)
    print("Database Connected")
except mdb.Error as e:
     print("Database notconnected" +e)


with open('config.json','r') as c :
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__, template_folder='template')
app.secret_key = 'super secret key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT ='465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD =params['gmail-password'])
mail = Mail(app)

app.config['MYSQL_HOST']= 'localhost'
app.config['MYSQL_USER']= 'root'
app.config['MYSQL_PASS']= ''
app.config['MYSQL_DB']= 'flaskapp'
# mysql = MySQL(app)

# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://username:@localhost/thesmartness'
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/thesmartness'

if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
db = SQLAlchemy(app)



class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    email = db.Column(db.String(20), unique=True, nullable=False)
    phone = db.Column(db.String(13), nullable=False)
    message = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    Title = db.Column(db.String(80), nullable=False)
    content = db.Column(db.String(120),  nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    Date = db.Column(db.String(12), nullable=True)
    img_file  = db.Column(db.String(21), nullable=False)
    tagline= db.Column(db.String(21), nullable=False)



@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    last= math.ceil (len(posts)/int(params['no_of_post']))
    #[0:int(params['no_of_post'])]
    # posts=posts['no_of_post']
    page= request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page= int(page)
    posts = posts[(page-1)* int(params['no_of_post']):(page-1)* int(params['no_of_post'])+ int(params['no_of_post'])]

    #pagination logic
    #first
    if (page==1): #first page
        prev = "#"
        next = "/?page="+ str(page+1)
    elif (page==last): #last page
        prev = "/?page=" + str(page - 1)
        next = "#"
    else: #middle page
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html',params=params, posts=posts, prev=prev, next=next)





@app.route('/dashboard',methods=['GET','POST'])
def dashboard():

    if ('user' in session and session['user']== params['admin_user']) :
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

         # for user is vailed then it will be access the page or login
    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params['admin_user'] and userpass== params['admin_password']):    #set the session variables
            session['user'] = username
            posts =  Posts.query.all()
            return render_template('dashboard.html', params=params, post=posts)
            #Redirect to admin panel
    else:
        print("invalid login,retry")
        return render_template('login.html',params=params)

#logout admin pannel
@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')

#delete button
@app.route('/delete/<string:sno>', methods={'GET', 'POST'})
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post= Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route('/about')
def about():
    return render_template('about.html',params=params)

#Edit button command
@app.route('/edit/<string:sno>', methods={'GET', 'POST'})
def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            box_title = request.form.get('Title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            Date = datetime.now()

            if sno=='0':
                post= Posts(Title= box_title, slug=slug, content=content, tagline=tline, img_file=img_file, Date=Date)
                db.session.add(post)
                db.session.commit()
            else:
                post= Posts.query.filter_by(sno=sno).first()
                post.Title = box_title
                post.slug = slug
                post.content = content
                post.tagline = tline
                post.imag_file = img_file
                post.Date = Date
                db.session.commit()
                return redirect('/edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post)

@app.route('/uploader', methods={'GET', 'POST'})   #for use file upload
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method == 'POST'):
            f= request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded sucessfully"




@app.route('/contact', methods={'GET', 'POST'})
def contact():

    if (request.method == 'POST'):
        '''Add enter to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contacts(name=name, phone=phone, message=message, email=email, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('NEW MESSAGE FROM ' + name,
                          sender=email,
                          recipients = [params['gmail-user']],
                          body = message + "\n" + phone
                          )
    return render_template('contact.html',params=params)


# @app.route('/post')
# def post():
#     return render_template('post.html',params=params)

@app.route("/post/<string:post_slug>", methods = ["GET"])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()  #first() used for uniquly identify
    return render_template('post.html',params=params, post=post)


# app.run()# for running the website
app.run(debug=True)  # run time changes is possible

