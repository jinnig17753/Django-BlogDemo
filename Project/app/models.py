# 與當前項目相關的模型文件，即所有的實體類在此編寫
from . import db


class User(db.Model):
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), nullable=False)
    password = db.Column(db.String(200), nullable=False)
    is_author = db.Column(db.Boolean, default=0)

    def set_password(self, password):
        self.password = generate_password(password)

    def check_password(self, password):
        return check_password_hash(self.password, password)


class Article(db.Model):
    __tablename__ = 'article'
    id = db.Column(db.Integer, primary_key=True)
    author_id = db.Column(db.Integer, nullable=False)
    pubdate = db.Column(db.DateTime, nullable=False)
    title = db.Column(db.String(100), nullable=False)
    subtitle = db.Column(db.String(150))
    bg_image = db.Column(db.Text)
    content = db.Column(db.Text, nullable=False)
    is_hide = db.Column(db.Boolean, default=0)


class Home(db.Model):
    __tablename__ = "home"
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100))
    subtitle = db.Column(db.String(150))
    pubdate = db.Column(db.DateTime, nullable=False)
    bg_image = db.Column(db.Text)


class About(db.Model):
    __tablename__ = "about"
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100))
    subtitle = db.Column(db.String(150))
    pubdate = db.Column(db.DateTime, nullable=False)
    bg_image = db.Column(db.Text)
    content = db.Column(db.Text, nullable=False)


class Contact(db.Model):
    __tablename__ = "contact"
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100))
    subtitle = db.Column(db.String(150))
    pubdate = db.Column(db.DateTime, nullable=False)
    bg_image = db.Column(db.Text)
    content = db.Column(db.Text, nullable=False)


class Comment(db.Model):
    __tablename__ = "comment"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(150), nullable=False)
    subject = db.Column(db.String(200), nullable=False)
    pubdate = db.Column(db.DateTime, nullable=False)
    message = db.Column(db.Text)


# class Setting(db.Model):
#     __tablename__ = "setting"
#     id = db.Column(db.Integer, primary=True)
#     blog_title
