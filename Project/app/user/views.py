# 針對使用者業務邏輯處理的視圖和路由的定義
from flask import render_template
# 導入藍圖，用於構建路由
from . import user
# 導入db，用於操作資料庫
from .. import db
# 導入實體類，用於操作資料庫
from ..models import *


@user.route('/user')
def main_index():
    return "這是user程式中的網頁"
