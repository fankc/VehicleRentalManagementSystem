<?php

class TongjiAction extends BaseAction {
	

	public function getList(){
        header('Content-Type:application/json; charset=utf-8');
        $where = [];
		if(!empty($_GET["kaishi"])){
			$where["kaishi"] = array("egt",$_GET["kaishi"]);
		}
		if(!empty($_GET["jieshu"])){
			$where["jieshu"] = array("elt",$_GET["jieshu"]);
		}

		if(!empty($_GET["status"])){
			$where["status"] = $_GET["status"];
		}
        $list = M("Zulin")->where($where)->limit($_GET['limit']*$_GET['page']-$_GET['limit'].','.$_GET['limit'])->select();
        foreach ($list as $key => $value) {
        	$list[$key]["carinfo"] = D("Car")->where(["id"=>$value["cid"]])->find();
        	$list[$key]["sijiinfo"] = D("User")->where(["id"=>$value["sid"]])->find();
        	$list[$key]["kehuinfo"] = D("User")->where(["id"=>$value["kid"]])->find();
        }
        $count = count(M("Zulin")->select());
        $res=array("code"=>0,"msg"=>"","count"=>$count,"data"=>$list);
        return $this->ajaxReturn($res,'JSON');
    }

	public function index(){
		$this->display();
	}


}