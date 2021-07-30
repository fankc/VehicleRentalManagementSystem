<?php

class CarAction extends BaseAction {
	

	public function getList(){
        header('Content-Type:application/json; charset=utf-8');
        $list = M("Car")->limit($_GET['limit']*$_GET['page']-$_GET['limit'].','.$_GET['limit'])->select();
        $count = count(M("Car")->select());
        $res=array("code"=>0,"msg"=>"","count"=>$count,"data"=>$list);
        return $this->ajaxReturn($res,'JSON');
    }

	public function index(){
		$this->display();
	}


	public function add(){
		if (IS_POST) {
			$Form = M("Car");
			$_POST["createtime"] = time();
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
			$this->display();
		}
	}


	public function edit(){
		if (IS_POST) {
			$Form = M("Car");
			$_POST["updatetime"] = time();
			if($Form->create()){
				$res = $Form->save();
				if($res){
					$this->success("保存成功");
				}else{
					$this->error("保存中....");
				}
			}else{
				$this->error($Form->getError());
			}
		}else{
			$data = D("Car")->where(["id"=>$_GET["id"]])->find();
	        $this->data = $data;
			$this->display();
		}
	}


	public function del(){
        $id=$_GET['id'];
        if (M('Car')->where(["id"=>$id])->delete()) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
	
	
}