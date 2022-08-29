//总的function,用来调用各个细分的function
function generatePage(){
    //获取分页数据
    var pageInfo=getPageInfo();

    //填充表格
    fillTable();


}

function getPageInfo(){
    $.ajax({
        url: "/role/get/page/info.json",
        type: "post",
        data: {
            "pageNum": window.pageNum,
            "pageSize": window.pageSize,
            "keyword": window.keyword
        },
        dataType: "json",
        success: function(response){

        },
        error: function(response){

         }
    });
}

function fillTable(){

}