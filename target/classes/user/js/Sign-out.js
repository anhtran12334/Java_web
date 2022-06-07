function checkEmail(x){
    var ktra = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(!ktra.test(x)){
        return false
    }
    return true;
}
function checkPhone(x){
    var ktra = /(84|0[3|5|7|8|9])+([0-9]{8})\b/g;
    if(!ktra.test(x)){
        return false
    }
    return true;
}

function checkUserName(x){
    let ktra = /^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$/ ;
    if(!ktra.test(x)){
        return false
    }
    return true;
}
document.querySelector('#gui').onclick = function(e){
    e.preventDefault();
    //Truy cap vao  msg
    let msgOj = document.querySelector('.msg');
    // tru cap vao tyhanh pghan HTML tuong ung
    let fullnameOj = document.querySelector('#fname');
    let usernameOj = document.querySelector('#uname');
    let emailOj = document.querySelector('#email');
    let phoneOj = document.querySelector('#phone');
    let passwordOj = document.querySelector('#password');
    let confirmPasswordOj = document.querySelector('#confirmpassword');

    //lay gia tri nguoi dungg
    let fullname = fullnameOj.value;
    let username = busernameOj.value;
    let email = emailOj.value;
    let phone = phoneOj.value;
    let password = passwordOj.value;
    let confirmPassword = confirmPasswordOj.value;
    //reset thong bao
    let requiredOj = document.querySelectorAll('.required');
    if(requiredOj.length > 0){
        requiredOj.forEach(function(item){
            item.innerText ='';
        });
        
    }
    //Validate form data
    let errors = {};
    if(!checkEmail(email)){
        errors['email'] = 'Email Nhập vào không đúng quy chuẩn';
        emailOj.parentElement.querySelector('.required').innerText = errors['email'];
    }
    if(!checkPhone(phone)){
        errors['phone'] = "Số điện thoại không đúng quy chuẩn";
        phoneOj.parentElement.querySelector('.required').innerText = errors['phone'];
    }
    if(!checkUserName(username)){
        errors['username'] = "UserName không đúng quy chuẩn";
        phoneOj.parentElement.querySelector('.required').innerText = errors['username'];
    }
    if(fullname.trim() == ''){
        errors['fulname'] = "Họ Tên chưa được nhập vào";
        fullnameOj.parentElement.querySelector('.required').innerText = errors['fulname'];
    }
    if(username.trim() == ''){
        errors['username'] = "UserName chưa được nhập vào";
        usernameOj.parentElement.querySelector('.required').innerText = errors['username'];
    }
    if(email.trim() == ''){
        errors['email'] = "Email chưa được nhập vào";
        emailOj.parentElement.querySelector('.required').innerText = errors['email'];
    }
    if(phone.trim() == ''){
        errors['phone'] = "Số điện thoại chưa được nhập vào";
        phoneOj.parentElement.querySelector('.required').innerText = errors['phone'];
    }
    if(password.trim() == ''){
        errors['password'] = "Mật khẩu chưa được nhập vào";
        passwordOj.parentElement.querySelector('.required').innerText = errors['password'];
    }
    if(confirmPassword.trim() == ''){
        errors['confirmPassword'] = "Mật khẩu xác nhận chưa được nhập vào";
        confirmPasswordOj.parentElement.querySelector('.required').innerText = errors['confirmPassword'];
    }
    if(confirmPassword.trim() != password.trim()){
        errors['confirmPassword'] = "Mật khẩu xác nhận không chính xác";
        confirmPasswordOj.parentElement.querySelector('.required').innerText = errors['confirmPassword'];
    }
    // if(error.key(errors).length == 0){
    //     // khong co loi

    // }else{
    //     msgOj.innerHTML = '<div class="alert alert-danger text-center">Vui long kiem tra du lieu</div>'
    // }
}
document.querySelector('input[name="fname"]').onblur = function() {
    let fullnameOj = document.querySelector('input[name="fname"]');
    let fullname = fullnameOj.value;
    let requiredOj = fullnameOj.parentElement.querySelector('.required');
    if(requiredOj.length > 0){
        // requiredOj.forEach(function(item){
        //     item.innerText ='';
        // });
        item.innerText='';
    }
    let errors = {};
    if(fullname.trim() == ''){
        errors['fulname'] = "Họ Tên chưa được nhập vào";
        fullnameOj.parentElement.querySelector('.required').innerText = errors['fulname'];
    }
}
document.querySelector('input[name="uname"]').onblur = function() {
    let birthdateOj = document.querySelector('input[name="date"]');
    let birthdate = birthdateOj.value;
    let requiredOj = birthdateOj.parentElement.querySelector('.required');
    if(requiredOj.length > 0){
        // requiredOj.forEach(function(item){
        //     item.innerText ='';
        // });
        item.innerText=''
    }
    let errors = {};
    if(birthdate.trim() == ''){
        errors['birthdate'] = "Ngày sinh chưa được nhập vào";
        birthdateOj.parentElement.querySelector('.required').innerText = errors['birthdate'];
    }
}
document.querySelector('input[name="email"]').onblur = function() {
    let emailOj = document.querySelector('input[name="email"]');
    let email = emailOj.value
    let requiredOj =  emailOj.parentElement.querySelector('.required');
    if(requiredOj.length > 0){
        // requiredOj.forEach(function(item){
        //     item.innerText ='';
        // });
        item.innerText=''
    }
    let errors = {};
    if(!checkEmail(email)){
        errors['email'] = 'Email Nhập vào không đúng quy chuẩn';
        emailOj.parentElement.querySelector('.required').innerText = errors['email'];
    }
    if(email.trim() == ''){
        errors['email'] = "Email chưa được nhập vào";
        emailOj.parentElement.querySelector('.required').innerText = errors['email'];
    }
}
document.querySelector('input[name="phone"]').onblur = function(){
    let phoneOj = document.querySelector('input[name="phone"]');
    let phone = phoneOj.value;
    let requiredOj = phoneOj.parentElement.querySelector('.required');
    if(requiredOj.length > 0){
        // requiredOj.forEach(function(item){
        //     item.innerText ='';
        // });
        item.innerText=''
    }
    let errors = {};
    if(!checkPhone(phone)){
        errors['phone'] = "Số điện thoại không đúng quy chuẩn";
        phoneOj.parentElement.querySelector('.required').innerText = errors['phone'];
    }
    if(phone.trim() == ''){
        errors['phone'] = "Số điện thoại chưa được nhập vào";
        phoneOj.parentElement.querySelector('.required').innerText = errors['phone'];
    }
}
document.querySelector('input[name="password"]').onblur = function() {
    let passwordOj = document.querySelector('input[name="password"]');
    let password = passwordOj.value;
    let requiredOj = passwordOj.parentElement.querySelector('.required');
    if(requiredOj.length > 0){
        // requiredOj.forEach(function(item){
        //     item.innerText ='';
        // });
        item.innerText=''
    }
    let errors = {};
    if(password.trim() == ''){
        errors['password'] = "Mật khẩu chưa được nhập vào";
        passwordOj.parentElement.querySelector('.required').innerText = errors['password'];
    }
}
document.querySelector('input[name="confirmpassword"]').onblur = function() {
    let passwordOj = document.querySelector('input[name="password"]');
    let password = passwordOj.value;
    let confirmPasswordOj = document.querySelector('input[name="confirmpassword"]');
    let confirmPassword = confirmPasswordOj.value;
    let requiredOj = confirmPasswordOj.parentElement.querySelector('.required');
    if(requiredOj.length > 0){
        // requiredOj.forEach(function(item){
        //     item.innerText ='';
        // });
        item.innerText=''
    }
    let errors = {};
    if(confirmPassword.trim() == ''){
        errors['confirmPassword'] = "Mật khẩu xác nhận chưa được nhập vào";
        confirmPasswordOj.parentElement.querySelector('.required').innerText = errors['confirmPassword'];
    }
    if(confirmPassword.trim() != password.trim()){
        errors['confirmPassword'] = "Mật khẩu xác nhận không chính xác";
        confirmPasswordOj.parentElement.querySelector('.required').innerText = errors['confirmPassword'];
    }
}
