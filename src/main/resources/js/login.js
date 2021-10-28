function submit() {
    var phonenum=document.forms["Froms"]["phonenum"].value;
    var password=document.forms["Froms"]["password"].value;
    alert(phonenum)
    if (phonenum.length==11){
        if (password.length>5 && password.length<19){
            return true;
        } else {
            alert("密码长度范围：6-18字符");
            return false;
        }
    } else {
        alert("请输入11位手机号码");
        return false;
    }
}