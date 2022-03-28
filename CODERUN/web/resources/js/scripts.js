/*!
* Start Bootstrap - Agency v7.0.10 (https://startbootstrap.com/theme/agency)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-agency/blob/master/LICENSE)
*/
//
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Navbar shrink function
    var navbarShrink = function () {
        const navbarCollapsible = document.body.querySelector('#mainNav');
        if (!navbarCollapsible) {
            return;
        }
        if (window.scrollY === 0) {
            navbarCollapsible.classList.remove('navbar-shrink')
        } else {
            navbarCollapsible.classList.add('navbar-shrink')
        }

    };

    // Shrink the navbar 
    navbarShrink();

    // Shrink the navbar when page is scrolled
    document.addEventListener('scroll', navbarShrink);

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            offset: 74,
        });
    };

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });

});

var arrInput = new Array(0);
var arrInputValue = new Array(0);
    
function addInput() {
    arrInput.push(arrInput.length);
    arrInputValue.push("");
    display();
}
    
function display() {
    document.getElementById('parah').innerHTML="";
    for (intI=0;intI<arrInput.length;intI++) {
        document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
    }
}
    
function saveValue(intId, strValue) {
    arrInputValue[intId]=strValue;
}  
    
function createInput(id, value) {
    let str = `<div class="mb-3">
        <label for="test ${id}" class="form-label">커리큘럼명</label>
        <input type='text' class='form-control' id='test ${id}' name='test ${id}' onChange='javascript:saveValue(${id}, this.value)' value='${value}' placeholder="커리큘럼명">
        </div>
        <div class="mb-3">
        <label for="test ${id}" class="form-label">영상 링크</label>
        <input type='text' class='form-control' id='test ${id}' name='test ${id}' onChange='javascript:saveValue(${id}, this.value)' value='${value}' placeholder="영상 링크">
        </div>`;
	
    return str;
}
    
function deleteInput() {
    if (arrInput.length > 0) { 
        arrInput.pop(); 
        arrInputValue.pop();
    }
    display(); 
}

//영은 작성
//1. 프로필 사진 구현
document.getElementById('imgfile').addEventListener('change', function () {
    if (this.files && this.files[0]) {
      let reader = new FileReader();
      // 파일 내용을 읽어들여 dataURL 형식의 문자열로 설정
      reader.readAsDataURL(this.files[0]);
      reader.onload = function () {
        console.log(reader.result);
        document.getElementById('imgArea').src
          = reader.result;
      }
    }
  });

function checkExistData(value, dataName) {
	if (value == "") {
		alert(dataName + " 입력해주세요!");
		return false;
	}
	return true;
}

function checkAll() {
	if (!checkPassword(document.getElementById('memberPwd').value, document.getElementById('memberPwd2').value)) {
		return false;
	} else {
		return true;
	}
}

function checkPassword(memberPwd, memberPwd2) {
	if (!checkExistData(memberPwd, "비밀번호를"))
		return false;
	if (!checkExistData(memberPwd2, "비밀번호 확인을"))
		return false;
	
	var pwd1 = document.getElementById('memberPwd');
	var pwd2 = document.getElementById('memberPwd2');
	
	var memberPwdRegExp = /^[a-zA-z0-9]{8,16}$/;
	if (!memberPwdRegExp.test(pwd1.value)) {
		alert("비밀번호는 영문 대소문자와 숫자 8~16자리로 입력해야합니다!");
		pwd1.value = "";
		pwd1.focus();
		return false;
	}
	
	if (memberPwd != memberPwd2) {
		alert("비밀번호 확인이 올바르지 않습니다.");
		pwd1.value = "";
		pwd2.value = "";
		pwd2.focus();
		return false;
	}
	
	return true;
}

function isSame() {
	if (document.getElementById('memberPwd').value.length < 6 || document.getElementById('memberPwd2').value.length > 16) {
		window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
		document.getElementById('memberPwd').value = document.getElementById('memberPwd2').value = '';
		document.getElementById('same').innerHTML = '';
	}
	if (document.getElementById('memberPwd').value != '' && document.getElementById('memberPwd2').value != '') {
		if (document.getElementById('memberPwd').value == document.getElementById('memberPwd2').value) {
			document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
			document.getElementById('same').style.color = 'blue';
		} else {
			document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
			document.getElementById('same').style.color = 'red';
		}
	}
}