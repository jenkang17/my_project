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

function getDataList(n) {

    let loading = `<tr><td colspan='6' class='p-5'><img src='/img/loading.gif' alt='loading' style="width:50px; height:50px"><p style='color:#AAA'>Loading...</p></td></tr>`;
    $("#list").append(loading);
    $(".more-box").css("display","block");

    $.ajax({
        type: "GET",
        url: "https://coronavirus.m.pipedream.net/",
        //data: {},
        success: function(data){
            //console.log(data);

            if (data != "" || data.length > 0)
            {
                $("#list").empty();

                let page_cnt = n;
                let list = data["rawData"];

                for( let i = 0; i < page_cnt; i++)
                {   
                    let Country_Region = list[i].Country_Region;
                    let Province_State = list[i].Province_State;
                    let Confirmed = list[i].Confirmed;
                    let Deaths = list[i].Deaths;
                    let Case_Fatality_Ratio = list[i].Case_Fatality_Ratio;
                    Case_Fatality_Ratio = Math.round(Case_Fatality_Ratio * 100) / 100;
                    let Last_Update = list[i].Last_Update;

                    if ( Province_State == "") {
                        Province_State = "-";
                    } 

                    let tr = `<tr>`;
                    tr += `<td>${Country_Region}</td>`;
                    tr += `<td>${Province_State}</td>`;
                    tr += `<td>${insertComma(Confirmed)}</td>`;
                    tr += `<td>${insertComma(Deaths)}</td>`;
                    tr += `<td>${Case_Fatality_Ratio}%</td>`;
                    tr += `<th>${Last_Update}</th>`;
                    tr += `</tr>`;

                    $("#list").append(tr);
                }
            }
            else
            {
                let tr = `<tr>`;
                tr += `<td colspan='6'>데이터가 없습니다.</td>`;
                tr += `</tr>`;
                $("#list").append(tr);
                return false;
            }
        },
        error: function() {
            alert('통신에러');
        }
    })

    timerID = setTimeout("getDataList(25)", 6000000);
}

function searchCountry(){
    let loading = `<tr><td colspan='6' class='p-5'><img src='/img/loading.gif' alt='loading' style="width:50px; height:50px"><p style='color:#AAA'>Loading...</p></td></tr>`;
    let keyword = $("#searchFrm input[name='keyword']").val().toUpperCase();

    $("#list").empty();
    $(".more-box").css("display","none");
    $("#list").append(loading);

    $.ajax({
        type: "GET",
        url: "https://coronavirus.m.pipedream.net/",
        success: function(data){
            $("#list").empty();
            let list = data["rawData"];

            if (keyword != "" || keyword.length > 0)
            {
                for (let i = 0; i < list.length; i++)
                {
                    let Country_Region = list[i]["Country_Region"];
                    let Country_Region_upper = Country_Region.toUpperCase();

                    if (Country_Region_upper.match(keyword) != null )
                    {
                        let Province_State = list[i].Province_State;
                        let Confirmed = list[i].Confirmed;
                        let Deaths = list[i].Deaths;
                        let Case_Fatality_Ratio = list[i].Case_Fatality_Ratio;
                        Case_Fatality_Ratio = Math.round(Case_Fatality_Ratio * 100) / 100;
                        let Last_Update = list[i].Last_Update;

                        if ( Province_State == "") {
                            Province_State = "-";
                        } 

                        let tr = `<tr>`;
                        tr += `<td>${Country_Region}</td>`;
                        tr += `<td>${Province_State}</td>`;
                        tr += `<td>${insertComma(Confirmed)}</td>`;
                        tr += `<td>${insertComma(Deaths)}</td>`;
                        tr += `<td>${Case_Fatality_Ratio}%</td>`;
                        tr += `<th>${Last_Update}</th>`;
                        tr += `</tr>`;

                        $("#list").append(tr);
                    }
                }
            }
            else
            {
                getDataList(25);
            }

        }
    })
}

$(document).ready(function(){
   // getDataList(25);

    $.ajax({
        type: "GET",
        url: "https://coronavirus.m.pipedream.net/",
        success: function(data){
            console.log(data);
            let list = data["rawData"];

            for(i = 0; i < list.length; i++) {
                //let Case_Fatality_Ratio1 = list[i];
               // console.log(Case_Fatality_Ratio1);

                let cfrResult;

                // 치사율 순으로 정렬 
                cfrResult =  list[i].sort(function(a,b){
                    return a.Case_Fatality_Ratio -b.Case_Fatality_Ratio;
                });

                console.log(cfrResult);
            }
        }
    })
})

$("#btnMore").click(function(){
    
    let list_cnt = $("#list tr").length;

    getDataList(list_cnt+25);

})