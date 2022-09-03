<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ include file="page-components/head.jsp"%>
<link rel="stylesheet" href="../static/css/pagination.css" />
<script type="text/javascript" src="../static/jquery/jquery.pagination.js"></script>
<script type="text/javascript" src="../static/my-js/role-get-list.js"></script>
<script type="text/javascript">
    $(function(){
       //为分页操作准备初始化数据将变量设置为全局变量
        window.pageNum=1;
        window.pageSize=5;
        window.keyword="";

        //调用分页函数
        generatePage();

        //给查询按钮绑定点击响应函数
        $("#btn-search").click(function (){
            window.keyword=$("#input-keyword").val();

            generatePage();
        });

        //给添加按钮绑定点击函数
        $("#btn-show-modal-add").click(function (){
           $("#modal-role-add").modal("show");
        });
    });
</script>
<body>
<%@include file="page-components/nav.jsp"%>
<div class="container-fluid">
    <div class="row">
        <%@include file="page-components/sidebar.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> Data List</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-inline" role="form" style="float:left;">
                            <div class="form-group has-feedback">
                                <div class="input-group">
                                    <div class="input-group-addon">Conditional Search</div>
                                    <input id="input-keyword" class="form-control has-success" type="text" placeholder="Please enter conditions">
                                </div>
                            </div>
                            <button id="btn-search" type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> Search</button>
                        </form>
                        <button type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> Delete</button>
                        <button id="btn-show-modal-add" type="button" class="btn btn-primary" style="float:right;"><i class="glyphicon glyphicon-plus"></i> Add</button>
                        <br>
                        <hr style="clear:both;">
                        <div class="table-responsive">
                            <table class="table  table-bordered">
                                <thead>
                                <tr>
                                    <th width="30">#</th>
                                    <th width="30"><input type="checkbox"></th>
                                    <th>Name</th>
                                    <th width="100">Action</th>
                                </tr>
                                </thead>
                                <tbody id="tbody">
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
</div>

<%@include file="modal-role-add.jsp"%>
</body>
</html>
