<?php

class ZulinAction extends BaseAction {
	

	public function getList(){
        header('Content-Type:application/json; charset=utf-8');
        $where = [];
		if(!empty($_GET["cid"])){
			$where["cid"] = $_GET["cid"];
		}
		if(!empty($_GET["sid"])){
			$where["sid"] = $_GET["sid"];
		}
		if(!empty($_GET["kid"])){
			$where["kid"] = $_GET["kid"];
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
		$carlist = D("Car")->select();
		$sijilist = D("User")->where(["rid"=>3])->select();
		$kehulist = D("User")->where(["rid"=>4])->select();
	    $this->carlist = $carlist;
	    $this->sijilist = $sijilist;
	    $this->kehulist = $kehulist;
		$this->display();
	}


	public function add(){
		if (IS_POST) {
			$Form = M("Zulin");
			if($Form->create()){
				$res = $Form->add();
				if($res){
					$this->success("保存成功");
				}else{
					$this->error("保存中....");
				}
			}else{
				$this->error($Form->getError());
			}
		}else{

			$carlist = D("Car")->select();
			$sijilist = D("User")->where(["rid"=>3])->select();
			$kehulist = D("User")->where(["rid"=>4])->select();
	        $this->carlist = $carlist;
	        $this->sijilist = $sijilist;
	        $this->kehulist = $kehulist;
			$this->display();
		}
	}


	public function tuizu(){
        $id=$_GET['id'];
        if (M('Zulin')->where(["id"=>$id])->save(["status"=>1])) {
            $this->success('退租成功');
        } else {
            $this->error('退租失败');
        }
    }

	public function jiesuan(){
        $id=$_GET['id'];
        if (M('Zulin')->where(["id"=>$id])->save(["status"=>2])) {
            $this->success('结算成功');
        } else {
            $this->error('结算失败');
        }
    }
    
	public function huanche(){
        $id=$_GET['id'];
        if (M('Zulin')->where(["id"=>$id])->save(["status"=>3])) {
            $this->success('还车成功');
        } else {
            $this->error('还车失败');
        }
    }
	
	
}