# 主業務中的視圖和路由的定義
from flask import render_template, request, session, redirect
import datetime
import os
from werkzeug.security import generate_password_hash
from werkzeug.security import check_password_hash

# 導入藍圖，用於構建路由
from . import main
# 導入db，用於操作資料庫
from .. import db
# 導入實體類，用於操作資料庫
from ..models import *


# 主頁的訪問路徑
@main.route('/')
@main.route('/<int:page>')
@main.route('/index')
def main_index(page=1):
    # db.create_all()
    # 查詢所有Article的資料
    # page = int(request.args.get('page', 1))  # 當前頁數
    # per_page = int(request.args.get('per_page', 3))  # 設置每頁數量
    paginate = Article.query.order_by(Article.id.desc()).paginate(
        page, per_page=3, error_out=False)
    article = paginate.items  # 獲取當前頁數據

    # 首頁管理資料
    home = Home.query.order_by(Home.id.desc()).first()
    # 獲取登入資料
    if 'uid' in session and 'username' in session:
        user = User.query.filter_by(id=session.get('uid')).first()
    return render_template('index.html', params=locals())


@main.route('/about')
def main_about():
    if 'uid' in session and 'username' in session:
        user = User.query.filter_by(id=session.get('uid')).first()
    about = About.query.order_by(About.id.desc()).first()
    return render_template('about.html', params=locals())


@main.route('/post', methods=['GET', 'POST'])
def main_post():
    if request.method == 'GET':
        # 查詢要看的Blog資料
        id = request.args.get('id')
        article = Article.query.filter_by(id=id).first()
        # 查詢上一篇及下一篇
        # 上一篇：查詢topic_id比當前topic_id值小的最後一條資料
        prevTopic = Article.query.filter(Article.id < id).order_by(
            Article.id.desc()).first()
        # print("上一篇：" + prevTopic.title)
        # 下一篇：查詢topic_id比當前topic_id值大的第一條資料
        nextArticle = Article.query.filter(Article.id > id).first()
        # 查詢登入使用者
        if 'uid' in session and 'username' in session:
            user = User.query.filter_by(id=session.get('uid')).first()
        return render_template('post.html', params=locals())


@main.route('/contact', methods=['GET', 'POST'])
def main_contact():
    if request.method == 'GET':
        if 'uid' in session and 'username' in session:
            user = User.query.filter_by(id=session.get('uid')).first()
        contact = Contact.query.order_by(Contact.id.desc()).first()
        return render_template('contact.html', params=locals())
    else:
        # 獲取文字框的值並賦值給comment實體物件
        comment = Comment()
        comment.name = request.form.get('name')
        comment.email = request.form.get('email')
        comment.subject = request.form.get('subject')
        comment.pubdate = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        comment.message = request.form.get('message')
        db.session.add(comment)
        return redirect('/')


# 登入頁面的訪問路徑
@main.route('/login', methods=['GET', 'POST'])
def login_views():
    if request.method == 'GET':
        return render_template('login.html')
    else:
        # 接收前端傳遞過來的資料
        username = request.form.get('username')
        password = request.form.get('password')
        # hash = generate_password_hash(password)
        # 使用接收的使用者名稱和密碼到資料庫中查詢
        user = User.query.filter_by(username=username).first()
        # 如果使用者存在，將資料保存進session並重新定向回首頁，否則重新定向回登入頁面
        is_authenticated = check_password_hash(user.password, password)
        if user and is_authenticated:
            session['uid'] = user.id
            session['username'] = user.username
            return redirect('/')
        else:
            err = True
            return render_template('login.html', err=err)
        return redirect('/login')


# 登出的訪問路徑
@main.route('/logout')
def logout_views():
    if 'uid' in session and 'username' in session:
        del session['uid']
        del session['username']
    return redirect('/')


@main.route('/dashboard')
def db_dashboard():
    if not 'uid' in session and not 'username' in session:
        return redirect('/')
    else:
        page = int(request.args.get('page', 1))  # 當前頁數
        per_page = int(request.args.get('per_page', 10))  # 設置每頁數量
        paginate = Article.query.order_by(Article.is_hide,Article.id.desc()).paginate(
            page, per_page=10, error_out=False)
        article = paginate.items  # 獲取當前頁數據
        return render_template('dashboard.html', params=locals())


@main.route('/db-index', methods=['GET', 'POST'])
def db_index():
    if request.method == 'GET':
        if not 'uid' in session and not 'username' in session:
            return redirect('/')
        else:
            user = User.query.filter_by(id=session['uid']).first()
            if user.is_author != 1:
                return redirect('/')
            home = Home.query.order_by(Home.id.desc()).first()
            return render_template('db-index.html', params=locals())
    else:
        home = Home()
        home.title = request.form.get('title')
        home.subtitle = request.form.get('subtitle')
        home.pubdate = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        home.content = request.form.get('content')
        if request.files:
            print("有")
            # 取出檔案
            f = request.files['bg-img-upload']
            if f.filename:
                # 處理檔案名稱，將名稱賦值給article.bg_image
                # 獲取當前時間，作為檔案名稱
                ftime = datetime.datetime.now().strftime("%Y%m%d%H%M%S%f")
                # 獲取檔案的副檔名
                # print(f.filename)
                ext = f.filename.split('.')[1]
                filename = ftime + "." + ext
                home.bg_image = "upload/" + filename
                # 將檔案保存至伺服器
                basedir = os.path.dirname(os.path.dirname(__file__))
                upload_path = os.path.join(basedir, "static/upload", filename)
                f.save(upload_path)

        db.session.add(home)
        return redirect('/dashboard')


@main.route('/db-about', methods=['GET', 'POST'])
def db_about():
    if request.method == 'GET':
        if not 'uid' in session and not 'username' in session:
            return redirect('/')
        else:
            user = User.query.filter_by(id=session['uid']).first()
            if user.is_author != 1:
                return redirect('/')
            about = About.query.order_by(About.id.desc()).first()
            return render_template('db-about.html', params=locals())
    else:
        about = About()
        about.title = request.form.get('title')
        about.subtitle = request.form.get('subtitle')
        about.pubdate = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        about.content = request.form.get('content')
        if request.files:
            print("有")
            # 取出檔案
            f = request.files['bg-img-upload']
            if f.filename:
                # 處理檔案名稱，將名稱賦值給article.bg_image
                # 獲取當前時間，作為檔案名稱
                ftime = datetime.datetime.now().strftime("%Y%m%d%H%M%S%f")
                # 獲取檔案的副檔名
                # print(f.filename)
                ext = f.filename.split('.')[1]
                filename = ftime + "." + ext
                about.bg_image = "upload/" + filename
                # 將檔案保存至伺服器
                basedir = os.path.dirname(os.path.dirname(__file__))
                upload_path = os.path.join(basedir, "static/upload", filename)
                f.save(upload_path)

        db.session.add(about)
        return redirect('/dashboard')


@main.route('/db-contact', methods=['GET', 'POST'])
def db_contact():
    if request.method == 'GET':
        if not 'uid' in session and not 'username' in session:
            return redirect('/')
        else:
            user = User.query.filter_by(id=session['uid']).first()
            if user.is_author != 1:
                return redirect('/')
            contact = Contact.query.order_by(Contact.id.desc()).first()
            return render_template('db-contact.html', params=locals())
    else:
        contact = Contact()
        contact.title = request.form.get('title')
        contact.subtitle = request.form.get('subtitle')
        contact.pubdate = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        contact.content = request.form.get('content')
        if request.files:
            print("有")
            # 取出檔案
            f = request.files['bg-img-upload']
            if f.filename:
                # 處理檔案名稱，將名稱賦值給article.bg_image
                # 獲取當前時間，作為檔案名稱
                ftime = datetime.datetime.now().strftime("%Y%m%d%H%M%S%f")
                # 獲取檔案的副檔名
                # print(f.filename)
                ext = f.filename.split('.')[1]
                filename = ftime + "." + ext
                contact.bg_image = "upload/" + filename
                # 將檔案保存至伺服器
                basedir = os.path.dirname(os.path.dirname(__file__))
                upload_path = os.path.join(basedir, "static/upload", filename)
                f.save(upload_path)

        db.session.add(contact)
        return redirect('/dashboard')


@main.route('/db-comment')
def db_comment():
    if not 'uid' in session and not 'username' in session:
        return redirect('/')
    else:
        page = int(request.args.get('page', 1))  # 當前頁數
        per_page = int(request.args.get('per_page', 10))  # 設置每頁數量
        paginate = Comment.query.order_by(Comment.id.desc()).paginate(
            page, per_page=10, error_out=False)
        comment = paginate.items  # 獲取當前頁數據
        return render_template('db-comment.html', params=locals())


@main.route('/db-post', methods=['GET', 'POST'])
def db_post():
    if request.method == 'GET':
        # 授權驗證：驗證使用者是否有發表Blog的權限，即必須是登入使用者並且is_author為1
        if not 'uid' in session and not 'username' in session:
            return redirect('/')
        else:
            user = User.query.filter_by(id=session['uid']).first()
            if user.is_author != 1:
                return redirect('/')
            article = Article.query.all()
            return render_template('db-post.html', params=locals())
    else:
        # 處理post請求，即發表Blog的處理
        article = Article()
        # 為id賦值
        article.author_id = session.get('uid')
        # 為title賦值
        article.title = request.form.get('title')
        # 為subtitle賦值
        article.subtitle = request.form.get('subtitle')
        # 為content賦值
        article.content = request.form.get('content')
        # 為pub_date賦值
        article.pubdate = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        # 選擇性的為 images 賦值
        if request.files:
            print("有")
            # 取出檔案
            f = request.files['bg-img-upload']
            if f.filename:
                # 處理檔案名稱，將名稱賦值給article.bg_image
                # 獲取當前時間，作為檔案名稱
                ftime = datetime.datetime.now().strftime("%Y%m%d%H%M%S%f")
                # 獲取檔案的副檔名
                ext = f.filename.split('.')[1]
                filename = ftime + "." + ext
                article.bg_image = "upload/" + filename
                # 將檔案保存至伺服器
                basedir = os.path.dirname(os.path.dirname(__file__))
                upload_path = os.path.join(basedir, "static/upload", filename)
                f.save(upload_path)

        db.session.add(article)
        return redirect('/')


@main.route('/db-edit', methods=['GET', 'POST'])
def db_edit():
    if request.method == 'GET':
        # 授權驗證：驗證使用者是否有發表Blog的權限，即必須是登入使用者並且is_author為1
        if not 'uid' in session and not 'username' in session:
            return redirect('/')
        else:
            user = User.query.filter_by(id=session['uid']).first()
            if user.is_author != 1:
                return redirect('/')
            id = request.args.get('id')
            article = Article.query.filter_by(id=id).first()
            return render_template('db-edit.html', params=locals())
    else:
        # 處理post請求，即發表Blog的處理
        id = request.args.get('id')
        article = Article.query.filter_by(id=id).first()
        # 為id賦值
        article.author_id = session.get('uid')
        # 為title賦值
        article.title = request.form.get('title')
        # 為subtitle賦值
        article.subtitle = request.form.get('subtitle')
        # 為content賦值
        article.content = request.form.get('content')
        # 為pub_date賦值
        # article.pubdate = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        # 選擇性的為 images 賦值
        if request.files:
            print("有")
            # 取出檔案
            f = request.files['bg-img-upload']
            if f.filename:
                # 處理檔案名稱，將名稱賦值給article.bg_image
                # 獲取當前時間，作為檔案名稱
                ftime = datetime.datetime.now().strftime("%Y%m%d%H%M%S%f")
                # 獲取檔案的副檔名
                # print(f.filename)
                ext = f.filename.split('.')[1]
                filename = ftime + "." + ext
                article.bg_image = "upload/" + filename
                # 將檔案保存至伺服器
                basedir = os.path.dirname(os.path.dirname(__file__))
                upload_path = os.path.join(basedir, "static/upload", filename)
                f.save(upload_path)

        db.session.add(article)
        return redirect('/post?id=' + id)


@main.route('/db-settings', methods=['GET', 'POST'])
def db_settings():
    if request.method == 'GET':
        if not 'uid' in session and not 'username' in session:
            return redirect('/')
        else:
            user = User.query.filter_by(id=session['uid']).first()
            return render_template('db-settings.html', params=locals())
    else:
        pwd1 = request.values['pwd1']
        pwd2 = request.values['pwd2']
        user = User.query.filter_by(id=session['uid']).first()
        if (pwd1 == pwd2):
            user.password = generate_password_hash(pwd1)
        db.session.commit()
        return redirect('/db-settings')


@main.route("/db-delete")
def db_delete():
    if not 'uid' in session and not 'username' in session:
        return redirect('/')
    else:
        id = request.args.get('id')
        cls = request.args.get('cls')
        if cls == "dashboard":
            delitem = Article.query.filter_by(id=id).first()
            db.session.delete(delitem)
            db.session.commit()
            return redirect("/" + cls)
        elif cls == "comment":
            delitem = Comment.query.filter_by(id=id).first()
            db.session.delete(delitem)
            db.session.commit()
            return redirect("/db-" + cls)


@main.route("/db-deletelist")
def db_deletelist():
    if not 'uid' in session and not 'username' in session:
        return redirect('/')
    else:
        id = eval(request.args.get('id'))
        cls = request.args.get('cls')
        for i in id:
            if cls == "dashboard":
                delitem = Article.query.filter_by(id=i).first()
                db.session.delete(delitem)
                db.session.commit()
                return redirect("/" + cls)
            elif cls == "comment":
                delitem = Comment.query.filter_by(id=i).first()
                db.session.delete(delitem)
                db.session.commit()
                return redirect("/db-" + cls)


@main.route('/db-hide')
def db_hide():
    if not 'uid' in session and not 'username' in session:
        return redirect('/')
    else:
        id = request.args.get('id')
        article = Article.query.filter_by(id=id).first()
        # print(article.is_hide)
        if article.is_hide:
            article.is_hide = False
        else:
            article.is_hide = True
        db.session.commit()
        return redirect('/dashboard')


@main.route('/db-hidelist')
def db_hidelist():
    if not 'uid' in session and not 'username' in session:
        return redirect('/')
    else:
        id = eval(request.args.get('id'))
        for i in id:
            article = Article.query.filter_by(id=i).first()
            article.is_hide = not article.is_hide
        db.session.commit()
        return redirect('/dashboard')
