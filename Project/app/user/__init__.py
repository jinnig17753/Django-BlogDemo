# user 目錄： 針對使用者業務邏輯處理的目錄
# 針對使用者業務處理的初始化行為

from flask import Blueprint
user = Blueprint("user", __name__)
from . import views
