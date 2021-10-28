function submit() {
    var username=document.username.value;
    var phonenum=document.getElementsByName("phonenum").value;
    var introduction=document.getElementsByName("introduction").value;
    var password0=document.getElementsByName("password0").value;
    var password=document.getElementsByName("password").value;
    if (username.length>0 && username.length<=20){
        if (phonenum.length==11){
            if (introduction.length>0 && introduction.length<=200) {
                if (password0.length>5 && password0.length<18) {
                    if (password0===password){
                        return true;
                    } else {
                        alert("两次密码输入不一致");
                        return false;
                    }
                }else {
                    alert("密码长度范围：6-18字符");
                    return false;
                }
            }else {
                alert("个人简介输入范围：1-200字符");
                return false;
            }
        } else {
            alert("请输入11位长度的电话号码");
            return false;
        }
    } else {
        alert("用户名输入范围：1-20字符");
        return false;
    }
}