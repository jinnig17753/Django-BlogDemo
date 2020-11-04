window.onload = function () {
  // 獲得元素添加監聽
  var input = document.getElementsByClassName("form-control");
  var sendMsgBtn = document.getElementById("contactForm");
  var sendLoginBtn = document.getElementById("loginForm");
  var helpBlock = document.getElementsByClassName("help-block");
  var b2Top = document.getElementById("fixed-buttons");

  // 提交按鈕驗證
  if (sendMsgBtn) {
    sendMsgBtn.onsubmit = function () {
      var c = 0;
      for (var i = 0; i < input.length; i++) {
        if (!input[i].value) {
          helpBlock[i].innerHTML =
            "<ul><ii>Please enter your " + input[i].placeholder + ".</li></ul>";
          c++;
        }
      }
      if (c != 0) {
        return false;
      } else {
        return true;
      }
    };
  }
  if (sendLoginBtn) {
    sendLoginBtn.onsubmit = function () {
      for (var i = 0; i < input.length; i++) {
        if (!input[i].value) {
          helpBlock[0].innerHTML =
            "<ul><ii>Username or password was incorrect. Please try again.</li></ul>";
          return false;
        }
      }
    };
  }

  // 滾動顯示 backtotop
  window.onscroll = function () {
    if (window.pageYOffset > 100) {
      b2Top.style.display = "block";
    } else {
      b2Top.style.display = "none";
    }
  };

  // 輸入框序列
  for (var i = 0; i < input.length; i++) {
    // 點擊即移除helpblock
    input[i].onclick = function (evt) {
      if (helpBlock.length == input.length) {
        this.nextElementSibling.innerHTML = "";
      } else {
        helpBlock[0].innerHTML = "";
      }
    };

    // 正在焦點即增加class
    input[i].onfocus = function (evt) {
      if (
        !this.parentNode.classList.contains(
          "floating-label-form-group-with-focus"
        )
      ) {
        this.parentNode.classList.add("floating-label-form-group-with-focus");
      }
    };
    // 失去焦點即移除class
    input[i].onblur = function (evt) {
      this.parentNode.classList.remove("floating-label-form-group-with-focus");
    };
    // 元素的值發生改變時即增加class
    input[i].oninput = function (evt) {
      if (
        !this.parentNode.classList.contains(
          "floating-label-form-group-with-value"
        )
      ) {
        this.parentNode.classList.add("floating-label-form-group-with-value");
      }
      // 判斷如果輸入框為空即移除class
      if (this.value === "") {
        this.parentNode.classList.remove(
          "floating-label-form-group-with-value"
        );
      }
    };
  }
};

// Nav Menu
function openNav() {
  var nav = document.getElementById("navbarResponsive");
  if (nav.className == "") {
    nav.classList = "show";
  } else if (nav.className == "show") {
    nav.classList = "";
  }
}

function del(cls, val) {
  swal
    .fire({
      title: "確定刪除？",
      html: "按下確定後資料會永久刪除",
      type: "warning",
      showCancelButton: true, //顯示取消按鈕
      confirmButtonText: "確定",
      cancelButtonText: "取消",
    })
    .then(function (result) {
      if (result.value) {
        window.location.href = "/db-delete/?cls=" + cls + "&id=" + val;
      } else {
        swal.fire("取消", "資料未被刪除", "error");
      }
    });
}
