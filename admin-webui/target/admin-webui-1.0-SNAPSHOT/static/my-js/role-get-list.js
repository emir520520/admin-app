//总的function,用来调用各个细分的function
function generatePage(){
    //获取分页数据
    var pageInfo=getPageInfo().data;

    //填充表格
    fillTable(pageInfo.list);

    //调用分页导航栏生成函数
    generateNavigationBar(pageInfo);
}

//获取pageInfo函数
function getPageInfo(){
    var res;

    $.ajax({
        url: "/role/get/page/info.json",
        type: "post",
        data: {
            "pageNum": window.pageNum,
            "pageSize": window.pageSize,
            "keyword": window.keyword
        },
        dataType: "json",
        async: false,
        success: function(response){
            res=response;
        },
        error: function(response){
            res=response;
         }
    });

    return res;
}

//生成表格函数
function fillTable(pageInfo){
    //清除tbody中原有数据
    $("#tbody").empty();

    //清空分页导航条
    $("#Pagination").empty();

    if(pageInfo==null || pageInfo.length==0){
        $("#tbody").append("<tr><td colspan='4'>No data found for you</td></tr>");
        return;
    }

    for(var i=0;i<pageInfo.length;i++){
        var roleId=pageInfo[i].id;
        var roleName=pageInfo[i].name;

        var numberTd="<td>"+roleId+"</td>";
        var checkboxTd="<td><input type='checkbox'></td>";
        var roleNameTd= "<td>"+roleName+"</td>";

        //Button td
        var checkBtn="<button type=\"button\" class=\"btn btn-success btn-xs\"><i class=\" glyphicon glyphicon-check\"></i></button>";
        var pencilBtn="<button id='"+roleId+"' type=\"button\" class=\"btn btn-primary btn-xs btn-pencil\"><i class=\" glyphicon glyphicon-pencil\"></i></button>";
        var removeBtn="<button type=\"button\" class=\"btn btn-danger btn-xs\"><i class=\" glyphicon glyphicon-remove\"></i></button>";

        var buttonTd="<td>"+checkBtn+" "+pencilBtn+" "+removeBtn+"</td>";

        //tr
        var tr="<tr>"+numberTd+checkboxTd+roleNameTd+buttonTd+"</tr>";

        $("#tbody").append(tr);
    }
}

//分页导航栏生成函数
function generateNavigationBar(pageInfo){
    //获得role记录的总数
    var totalRecord=pageInfo.total;

    //声明一个属性设置pagination函数所需的属性
    var properties={
        num_edge_entries: 3,        //边缘页数量
        num_display_entries: 5,     //主体页数量
        callback: pageSelectCallback,       //用户点击页码时，调用这个函数进行跳转
        items_per_page: pageInfo.pageSize,
        current_page: pageInfo.pageNum-1,   //Pagination内部使用pageIndex(从0开始），而pageNum从1开始
        prev_text: "Previous",
        next_text: "Next"
    };

    $("#Pagination").pagination(totalRecord, properties);
}

//用户点击页码时，调用这个函数进行跳转
function pageSelectCallback(pageIndex, jQuery){
    //计算pageNum
    window.pageNum=pageIndex+1;

    //调用分页函数
    generatePage();

    //由于每一个页码按钮都是超链接，它默认跳转到上面的地址，但是那是不正确的，因为没有加host和contextPath。
    //我们要取消超链接的默认行为
    return false;
}