<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="__PUBLIC__/Admin/layui-v2/css/layui.css" media="all" />
<link rel="stylesheet" href="__PUBLIC__/Admin/css/public.css" media="all" />
<link rel="stylesheet" href="__PUBLIC__/Admin/css/all.css" media="all" />
</head>
<body class="childrenBody">
<form id="mainfrom" class="layui-form" style="width:80%;">

  <div class="layui-form-item layui-row layui-col-xs12">
      <label class="layui-form-label">车辆：</label>
      <div class="layui-input-block" style="display: flex; align-items: center;">
        <select id="cid" name="cid" >
            <?php if(is_array($carlist)): $i = 0; $__LIST__ = $carlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["chepai"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
        </select>
      </div>
  </div>

  <div class="layui-form-item layui-row layui-col-xs12">
      <label class="layui-form-label">司机：</label>
      <div class="layui-input-block" style="display: flex; align-items: center;">
        <select id="sid" name="sid" >
            <?php if(is_array($sijilist)): $i = 0; $__LIST__ = $sijilist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
        </select>
      </div>
  </div>

  <div class="layui-form-item layui-row layui-col-xs12">
      <label class="layui-form-label">客户：</label>
      <div class="layui-input-block" style="display: flex; align-items: center;">
        <select id="kid" name="kid" >
            <?php if(is_array($kehulist)): $i = 0; $__LIST__ = $kehulist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><option value="<?php echo ($vo["id"]); ?>"><?php echo ($vo["name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
        </select>
      </div>
  </div>

 

  <div class="layui-form-item layui-row layui-col-xs12">
    <label class="layui-form-label">开始时间：</label>
    <div class="layui-input-block">
      <input type="text" name="kaishi" class="layui-input width200 kaishi" id="kaishi" placeholder="yyyy-MM-dd HH:mm:ss">
    </div>
  </div>

  <div class="layui-form-item layui-row layui-col-xs12">
    <label class="layui-form-label">结束时间：</label>
    <div class="layui-input-block">
      <input type="text" name="jieshu" class="layui-input width200 jieshu" id="jieshu" placeholder="yyyy-MM-dd HH:mm:ss">
    </div>
  </div>

  <div class="layui-form-item layui-row layui-col-xs12">
    <label class="layui-form-label">价格：</label>
    <div class="layui-input-block">
      <input type="number" name="money" class="layui-input width200 money" value="" lay-verify="required" placeholder="请输入价格">
    </div>
  </div>

  <div class="layui-form-item layui-row layui-col-xs12">
    <div class="layui-input-block">
      <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="add">立即租赁</button>
      <button type="reset" id="reset" class="layui-btn layui-btn-sm layui-btn-primary">取消</button>
    </div>
  </div>

</form>

<script type="text/javascript" src="__PUBLIC__/Admin/layui-v2/layui.js"></script>
<script>
layui.use(['form','layer','layedit','laydate','upload'],function(){
    var form = layui.form
        layer = parent.layer === undefined ? layui.layer : top.layer,
        laypage = layui.laypage,
        upload = layui.upload,
        layedit = layui.layedit,
        laydate = layui.laydate,
        $ = layui.jquery;
        form.on("submit(add)",function(data){
            
            var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
            	$.ajax({
                      url:'/admin.php/Zulin/add',
                      type:'post',           //post提交
                      dataType:"json",        //json格式
                      data:$("#mainfrom").serialize(),    
                      success:function(data){
                            if(data.status!=1){

                              layer.msg(data.info);
                              
                            }else{
                                setTimeout(function(){
                                    top.layer.close(index);
                                    top.layer.msg(data.info);
                                    layer.closeAll("iframe");
                                    //刷新父页面
                                    parent.location.reload();
                                },2000);
                            }
                            
                        },
                        error:function(XmlHttpRequest,textStatus,errorThrown){
                            layer.msg('操作失败:服务器处理失败');
                        }
               	});
                
		        return false;
		});

        $("#reset").on("click",function(){
            layer.closeAll("iframe");
            parent.location.reload();
        });

    laydate.render({
      elem: '#kaishi',
      type: 'datetime'
    });
    
    laydate.render({
      elem: '#jieshu',
      type: 'datetime'
    });
    

})
</script>
</body>
</html>