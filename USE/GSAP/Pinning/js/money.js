// COMMA
function insertComma(num) {
	num = num.replace(/,/g, "");
	var num_str = num.toString();
	var result = '';
	for(var i = 0; i < num_str.length; i++) {
		var tmp = num_str.length - (i+1);
		if(i%3 == 0 && i != 0) result = ',' + result;
		result = num_str.charAt(tmp) + result;
	}
	return result;
}

// ADD MONEY
function addMoney1(money)
{
    var money = parseInt(money);
    var f = document.frm1;
    var num = f.requestMoney.value.toString();
    if( num == 0 )
    {
        if( money == 0 )
        {
        }
        else
        {
            num = money;
        }
    }
    else
    {
        num = parseInt(num.replace(/,/gi, ""));
        num = num + money;
    }
    f.requestMoney.value = insertComma(num.toString());
}

function addMoney2(money)
{
    var money = parseInt(money);
    var f = document.frm2;
    var num = f.requestMoney.value.toString();
    if( num == 0 )
    {
        if( money == 0 )
        {
        }
        else
        {
            num = money;
        }
    }
    else
    {
        num = parseInt(num.replace(/,/gi, ""));
        num = num + money;
    }
    f.requestMoney.value = insertComma(num.toString());
}

// RESET MONEY
function resetMoney1()
{
	var f = document.frm1;
	f.requestMoney.value = "0";
}

function resetMoney2()
{
	var f = document.frm2;
	f.requestMoney.value = "0";
}