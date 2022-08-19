<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ include file="page-components/head.jsp"%>
<link rel="stylesheet" href="../static/css/pagination.css" />
<script type="text/javascript" src="../static/jquery/jquery.pagination.js"></script>
<script type="text/javascript">
    $(function (){
        //显示上个页面搜索的关键词
        $("#search-keyword").val(${requestScope.keyword});

        //页面导航条初始化
        initPagination();
    });

    function initPagination(){
        //获得admin记录的总数
        var totalRecord=${requestScope.pageInfo.total};

        //生命一个属性设置pagination函数所需的属性
        var properties={
            num_edge_entries: 3,        //边缘页数量
            num_display_entries: 5,     //主体页数量
            callback: pageSelectCallback,       //用户点击页码时，调用这个函数进行跳转
            items_per_page: ${requestScope.pageInfo.pageSize},
            current_page: ${requestScope.pageInfo.pageNum-1},   //Pagination内部使用pageIndex(从0开始），而pageNum从1开始
            prev_text: "Previous",
            next_text: "Next"
        };

        $("#Pagination").pagination(totalRecord, properties);

        //用户点击页码时，调用这个函数进行跳转
        function pageSelectCallback(pageIndex, jQuery){
            //计算pageNum
            var pageNum=pageIndex+1;

            //获得当前的关键词
            var keyword=$("#search-keyword").val();

            //跳转页面
            window.location.href="admin/get/page.html?pageNum="+pageNum+"&keyword="+keyword;

            //由于每一个页码按钮都是超链接，它默认跳转到上面的地址，但是那是不正确的，因为没有加host和contextPath。
            //我们要取消超链接的默认行为
            return false;
        }
    }
</script>

<body>
<%@include file="page-components/nav.jsp"%>
<div class="container-fluid">
    <div class="row">
        <%@include file="page-components/sidebar.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> Data List</h3>
                </div>
                <div class="panel-body">
                    <form action="/admin/get/page.html" class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">Search Condition</div>
                                <input name="keyword" id="search-keyword" class="form-control has-success" type="text" placeholder="Please enter conditions for search">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> Search</button>
                    </form>
                    <button type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> Delete</button>
                    <button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='add.html'"><i class="glyphicon glyphicon-plus"></i> Add</button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr>
                                <th width="30">#</th>
                                <th width="30"><input type="checkbox"></th>
                                <th>Account</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th width="100">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${empty requestScope.pageInfo.list}">
                                <tr>
                                    <td colspan="6" align="center">Sorry, there is no such data!</td>
                                </tr>
                            </c:if>

                            <c:if test="${!empty requestScope.pageInfo.list}">
                                <c:forEach items="${requestScope.pageInfo.list}" var="admin" varStatus="myStatus">
                                    <tr>
                                        <td>${myStatus.count}</td>
                                        <td><input type="checkbox"></td>
                                        <td>${admin.loginAcct}</td>
                                        <td>${admin.userName}</td>
                                        <td>${admin.email}</td>
                                        <td>
                                            <button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>
                                            <button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>
                                            <button type="button" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6" align="center">
                                        <div id="Pagination" class="pagination"></div>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
