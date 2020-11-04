window.onload = function () {
  // var input = document.getElementsByClassName("form-item-upload");
  var plusbtn = document.getElementsByClassName("uploader-icon")[0];
  var file = document.getElementsByName("bg-img-upload")[0];
  var bg_img = document.getElementById("demo");
  var img_loader = document.getElementById("img-loader");
  var pwd1 = document.getElementById("pwd1");
  var pwd2 = document.getElementById("pwd2");

  // 檔案上傳
  if (file) {
    file.onchange = function () {
      var filelist = file.files[0];
      // 判斷是否為圖片
      if (filelist.type.match("image.*")) {
        var reader = new FileReader();
        reader.onload = function (e) {
          bg_img.setAttribute("src", e.target.result);
          bg_img.setAttribute("class", "uploader-icon");
          if (bg_img.getAttribute("src") != "") {
            plusbtn.style.display = "none";
          }
        };
        reader.readAsDataURL(filelist);
        var max = filelist.size;
        // 讀取不中斷則觸發該事件;
        reader.onprogress = function (evt) {
          // elem.style.width = (evt.loaded / max) * 100 + "%";
          // document.getElementById("label").innerHTML = (evt.loaded / max) * 100 + "%";
        };
      }
    };
  }

  if (plusbtn) {
    plusbtn.onclick = function () {
      file.click();
    };
    // plusbtn.ondragover = function (evt) {
    //   // 取消拖曳時開啟檔案
    //   evt.stopPropagation();
    //   evt.preventDefault();
    // };
    // plusbtn.ondrop = function (evt) {
    //   // 取消拖曳時開啟檔案
    //   evt.stopPropagation();
    //   evt.preventDefault();
    // };
  }

  if (bg_img) {
    bg_img.onclick = function () {
      file.click();
    };
  }

  // checkbox
  if ($(".table-checkbox")) {
    $(".table-checkbox").change(function () {
      if (!this.checked) {
        $(".table-checkbox")[0].checked = false;
      }
      var checkitems = 0;
      for (var i = 1; i < $(".table-checkbox").length; i++) {
        if ($(".table-checkbox")[i].checked) {
          checkitems++;
        }
      }
      if (checkitems == $(".table-checkbox").length - 1) {
        $(".table-checkbox")[0].checked = true;
      }
    });
  }

  // 確認密碼
  if (pwd1 && pwd2) {
    $("#pwd2").blur(function () {
      checkpwd();
    });
    $("form").submit(function () {
      checkpwd();
    });
  }
};

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
        res.push(val);
        window.location.href = "/db-delete?cls=" + cls + "&id=" + val;
      } else {
        swal.fire("取消", "資料未被刪除", "error");
      }
    });
}

function del_list(cls) {
  var res = new Array();
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
        $("input[name='select']:checked").each(function (item) {
          res[item] = $(this).attr("value");
        });
        // var data = {
        //   id: JSON.stringify(res),
        // };
        // $.ajax({
        //   type: "post",
        //   async: false,
        //   url: "/db-delete",
        //   data: data,
        //   success: function (result) {
        //     alert(result);
        //   },
        // });
        window.location.href = "/db-deletelist?cls=" + cls + "&id=" + JSON.stringify(res);
      } else {
        swal.fire("取消", "資料未被刪除", "error");
      }
    });
}

// 隱藏
function hide(val) {
  window.location.href = "/db-hide?id=" + val;
}

function hide_list() {
  var res = new Array();
  $("input[name='select']:checked").each(function (item) {
    res[item] = $(this).attr("value");
  });
  window.location.href = "/db-hidelist?id=" + JSON.stringify(res);
}

function check_all(obj) {
  var checkboxs = document.getElementsByClassName("table-checkbox");
  for (var i = 0; i < checkboxs.length; i++) {
    checkboxs[i].checked = obj.checked;
  }
}

function check_oreversed() {
  var checkboxs = document.getElementsByClassName("table-checkbox");
  var checkitems = 0;
  for (var i = 1; i < checkboxs.length; i++) {
    if (checkboxs[i]) {
      checkboxs[i].checked = !checkboxs[i].checked;
      if (checkboxs[i].checked) {
        checkitems++;
      }
    }
    if (checkitems == checkboxs.length - 1) {
      checkboxs[0].checked = true;
    } else {
      checkboxs[0].checked = false;
    }
  }
}

function checkpwd() {
  if (pwd1.value != pwd2.value) {
    $(".tip").show();
    return false;
  } else {
    $(".tip").hide();
    return true;
  }
}
