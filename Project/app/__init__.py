# 對整個程式做初始化操作
# 主要工作：
# 1. 構建Flask以及各種配置
# 2. 構建SQLAlchemy

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import pymysql
pymysql.install_as_MySQLdb()

db = SQLAlchemy()


def create_app():
    app = Flask(__name__)
    # 啟動模式為除錯模式
    app.config["DEBUG"] = True
    # 資料庫的連接字串
    app.config[
        "SQLALCHEMY_DATABASE_URI"] = "mysql://root:Fiujj985@localhost:3306/blog2"
    # 資料庫內容更新時自動更新
    app.config["SQLALCHEMY_COMMIT_ON_TEARDOWN"] = True
    # session 所需要的密鑰
    app.config["SECRET_KEY"] = "you guess"
    # 資料庫的初始化
    # db.create_all(app)
    db.init_app(app)

    # 將main藍圖與app關聯到一起
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)
    return app
    # 將user藍圖與app關聯到一起
    from .user import user as user_blueprint
    app.register_blueprint(user_blueprint)
    return app

