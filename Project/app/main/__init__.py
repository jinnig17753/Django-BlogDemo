# main 目錄：包含主要的業務邏輯的路由和視圖
# __init__.py ： 對主業務邏輯程式的初始化操作
from flask import Blueprint

main = Blueprint("main", __name__)
from . import views
