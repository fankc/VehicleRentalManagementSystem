<?php

class BaseAction extends Action
{
    protected function _initialize()
    {
  		$user=$_SESSION['user'];
        if (empty($_SESSION['system'])) {
            $_SESSION['system'] = M("system")->find();
        }
  		if(empty($user)){
			$this->redirect("admin.php/Login/index");
		}else{
			$where = [];
			$controller = MODULE_NAME;
			$main=ACTION_NAME;
			$href = "/admin.php/".$controller."/".$main;
			$where["href"] = $href;
			$res = D("menu")->where($where)->find();
			if (!empty($res)) {
				$reslut = D("role_menu")->where(["rid"=>$user["rid"],"mid"=>$res["id"]])->find();
		    	if (empty($reslut)) {
		    		echo "权限不足，请联系管理员";
					exit;
		    	}
			}
			
		}
    }

	
	
}
?>